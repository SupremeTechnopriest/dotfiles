import { options } from '@/options'

const { Gdk, Gtk } = imports.gi
const Cairo = imports.cairo
const { Box, DrawingArea, EventBox } = Widget

const Hyprland = await Service.import('hyprland')

const dummyWs = Box({ className: 'bar-ws' }) // Not shown. Only for getting size props
const dummyActiveWs = Box({ className: 'bar-ws bar-ws-active' }) // Not shown. Only for getting size props
const dummyHoverWs = Box({ className: 'bar-ws bar-ws-hover' }) // Not shown. Only for getting size props
const dummyOccupiedWs = Box({ className: 'bar-ws bar-ws-occupied' }) // Not shown. Only for getting size props

const mix = (value1: number, value2: number, perc: number) => {
  return value1 * perc + value2 * (1 - perc)
}

// Font size = workspace id
const WorkspaceContents = (count = 10) => {
  return DrawingArea({
    className: 'bar-ws-container',
    heightRequest: 1,
    attribute: {
      workspaceMask: 0,
      workspaceGroup: 0,
      hoveredWorkspace: -1,
      updateMask: (self: any) => {
        const offset =
          Math.floor((Hyprland.active.workspace.id - 1) / count) *
          options.bar.workspaces.workspaces.value

        const workspaces = Hyprland.workspaces
        let workspaceMask = 0
        for (let i = 0; i < workspaces.length; i++) {
          const ws = workspaces[i]
          if (ws.id <= offset || ws.id > offset + count) continue // Out of range, ignore
          if (workspaces[i].windows > 0) workspaceMask |= 1 << (ws.id - offset)
        }
        self.attribute.workspaceMask = workspaceMask
        self.queue_draw()
      },
      toggleMask: (self: any, occupied: boolean, name: string) => {
        if (occupied) self.attribute.workspaceMask |= 1 << parseInt(name)
        else self.attribute.workspaceMask &= ~(1 << parseInt(name))
        self.queue_draw()
      }
    },
    setup: (area) => {
      area.add_events(Gdk.EventMask.POINTER_MOTION_MASK)
      area.add_events(Gdk.EventMask.LEAVE_NOTIFY_MASK)
      area.on('motion-notify-event', (self, event) => {
        const [_, cursorX] = event.get_coords()
        const widgetWidth = self.get_allocation().width
        const wsId = Math.ceil(
          (cursorX * options.bar.workspaces.workspaces.value) / widgetWidth
        )
        area.attribute.hoveredWorkspace = wsId
        area.queue_draw()
      })

      area.on('leave-notify-event', () => {
        area.attribute.hoveredWorkspace = -1
        area.queue_draw()
      })

      area
        .hook(Hyprland.active.workspace, (self) => {
          self.setCss(
            `font-size: ${((Hyprland.active.workspace.id - 1) % count) + 1}px;`
          )
          const previousGroup = self.attribute.workspaceGroup
          const currentGroup = Math.floor(
            (Hyprland.active.workspace.id - 1) / count
          )
          if (currentGroup !== previousGroup) {
            self.attribute.updateMask(self)
            self.attribute.workspaceGroup = currentGroup
          }
        })
        .hook(
          Hyprland,
          (self) => self.attribute.updateMask(self),
          'notify::workspaces'
        )
    },
    drawFn: (area, cr: any) => {
      const allocation = area.get_allocation()
      const { height } = allocation

      const workspaceStyleContext = dummyWs.get_style_context()
      const workspaceDiameter = workspaceStyleContext.get_property(
        'min-width',
        Gtk.StateFlags.NORMAL
      )
      const workspaceRadius = workspaceDiameter / 2

      const wsfg = workspaceStyleContext.get_property(
        'color',
        Gtk.StateFlags.NORMAL
      )

      const occupiedWorkspaceStyleContext = dummyOccupiedWs.get_style_context()
      const occupiedbg = occupiedWorkspaceStyleContext.get_property(
        'background-color',
        Gtk.StateFlags.NORMAL
      )
      const occupiedfg = occupiedWorkspaceStyleContext.get_property(
        'color',
        Gtk.StateFlags.NORMAL
      )

      const hoverWorkspaceStyleContext = dummyHoverWs.get_style_context()
      const hoverbg = hoverWorkspaceStyleContext.get_property(
        'background-color',
        Gtk.StateFlags.NORMAL
      )

      const activeWorkspaceStyleContext = dummyActiveWs.get_style_context()
      const activebg = activeWorkspaceStyleContext.get_property(
        'background-color',
        Gtk.StateFlags.NORMAL
      )
      const activefg = activeWorkspaceStyleContext.get_property(
        'color',
        Gtk.StateFlags.NORMAL
      )
      area.set_size_request(workspaceDiameter * count, -1)
      const widgetStyleContext = area.get_style_context()
      const activeWs = widgetStyleContext.get_property(
        'font-size',
        Gtk.StateFlags.NORMAL
      )

      const activeWsCenterX =
        -(workspaceDiameter / 2) + workspaceDiameter * activeWs
      const activeWsCenterY = height / 2

      // Font
      cr.setAntialias(Cairo.Antialias.BEST)
      const indicatorRadius = workspaceStyleContext.get_property(
        'min-height',
        Gtk.StateFlags.NORMAL
      )

      for (let i = 1; i <= count; i++) {
        if (area.attribute.workspaceMask & (1 << i)) {
          // Draw bg highlight
          cr.setSourceRGBA(
            occupiedbg.red,
            occupiedbg.green,
            occupiedbg.blue,
            occupiedbg.alpha
          )
          const wsCenterX = -workspaceRadius + workspaceDiameter * i
          const wsCenterY = height / 2
          if (!(area.attribute.workspaceMask & (1 << (i - 1)))) {
            // Left
            cr.arc(
              wsCenterX,
              wsCenterY,
              workspaceRadius,
              0.5 * Math.PI,
              1.5 * Math.PI
            )
            cr.fill()
          } else {
            cr.rectangle(
              wsCenterX - workspaceRadius,
              wsCenterY - workspaceRadius,
              workspaceRadius,
              workspaceRadius * 2
            )
            cr.fill()
          }
          if (!(area.attribute.workspaceMask & (1 << (i + 1)))) {
            // Right
            cr.arc(
              wsCenterX,
              wsCenterY,
              workspaceRadius,
              -0.5 * Math.PI,
              0.5 * Math.PI
            )
            cr.fill()
          } else {
            cr.rectangle(
              wsCenterX,
              wsCenterY - workspaceRadius,
              workspaceRadius,
              workspaceRadius * 2
            )
            cr.fill()
          }
        }
      }

      // Draw workspace numbers
      for (let i = 1; i <= count; i++) {
        const inactivecolors =
          area.attribute.workspaceMask & (1 << i) ? occupiedfg : wsfg
        if (i === activeWs) {
          cr.setSourceRGBA(
            activefg.red,
            activefg.green,
            activefg.blue,
            activefg.alpha
          )
        }
        // Moving to
        else if (
          (i == Math.floor(activeWs) &&
            Hyprland.active.workspace.id < activeWs) ||
          (i == Math.ceil(activeWs) && Hyprland.active.workspace.id > activeWs)
        ) {
          cr.setSourceRGBA(
            mix(activefg.red, inactivecolors.red, 1 - Math.abs(activeWs - i)),
            mix(
              activefg.green,
              inactivecolors.green,
              1 - Math.abs(activeWs - i)
            ),
            mix(activefg.blue, inactivecolors.blue, 1 - Math.abs(activeWs - i)),
            activefg.alpha
          )
        }
        // Moving from
        else if (
          (i == Math.floor(activeWs) &&
            Hyprland.active.workspace.id > activeWs) ||
          (i == Math.ceil(activeWs) && Hyprland.active.workspace.id < activeWs)
        ) {
          cr.setSourceRGBA(
            mix(activefg.red, inactivecolors.red, 1 - Math.abs(activeWs - i)),
            mix(
              activefg.green,
              inactivecolors.green,
              1 - Math.abs(activeWs - i)
            ),
            mix(activefg.blue, inactivecolors.blue, 1 - Math.abs(activeWs - i)),
            activefg.alpha
          )
        }
        // Hovered
        else if (i === area.attribute.hoveredWorkspace) {
          cr.setSourceRGBA(
            hoverbg.red,
            hoverbg.green,
            hoverbg.blue,
            hoverbg.alpha
          )
        }
        // Inactive
        else {
          cr.setSourceRGBA(
            inactivecolors.red,
            inactivecolors.green,
            inactivecolors.blue,
            inactivecolors.alpha
          )
        }

        // const [layoutWidth] = layout.get_pixel_size()
        const x = -(workspaceDiameter / 2) + workspaceDiameter * i
        const y = height / 2

        cr.arc(x, y, indicatorRadius, 0, 2 * Math.PI)
        cr.fill()
      }

      // Draw active ws
      cr.setSourceRGBA(
        activebg.red,
        activebg.green,
        activebg.blue,
        activebg.alpha
      )
      cr.arc(activeWsCenterX, activeWsCenterY, indicatorRadius, 0, 2 * Math.PI)
      cr.fill()
    }
  })
}

const dispatch = (ws: string | number) =>
  Hyprland.messageAsync(`dispatch workspace ${ws}`)

export const Workspaces = () =>
  EventBox({
    onScrollUp: () => dispatch('-1'),
    onScrollDown: () => dispatch('+1'),
    onSecondaryClick: () => App.toggleWindow('overview'),
    attribute: {
      clicked: false,
      ws_group: 0
    },
    child: Box({
      homogeneous: true,
      className: 'workspaces',
      children: [
        Box({
          className: 'bar-ws-wrapper',
          css: 'min-width: 2px;',
          children: [WorkspaceContents(options.bar.workspaces.workspaces.value)]
        })
      ]
    }),
    setup: (self) => {
      self.add_events(Gdk.EventMask.POINTER_MOTION_MASK)
      self.on('motion-notify-event', (self, event) => {
        if (!self.attribute.clicked) return
        const [_, cursorX] = event.get_coords()
        const widgetWidth = self.get_allocation().width
        const wsId = Math.ceil(
          (cursorX * options.bar.workspaces.workspaces.value) / widgetWidth
        )
        dispatch(wsId)
      })
      self.on('button-press-event', (self, event) => {
        if (event.get_button()[1] === 1) {
          self.attribute.clicked = true
          const [_, cursorX] = event.get_coords()
          const widgetWidth = self.get_allocation().width
          const wsId = Math.ceil(
            (cursorX * options.bar.workspaces.workspaces.value) / widgetWidth
          )
          dispatch(wsId)
        } else if (event.get_button()[1] === 8) {
          Hyprland.messageAsync(`dispatch togglespecialworkspace`).catch(print)
        }
      })
      self.on(
        'button-release-event',
        (self) => (self.attribute.clicked = false)
      )
    }
  })
