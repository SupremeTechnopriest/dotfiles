import { PopupWindow } from '@/widget/PopupWindow'
import { options } from '@/options'

import { Header } from './modules/Header'
import { SidebarWindow } from '../SidebarWindow'

const layout = Utils.derive(
  [options.bar.position, options.controlCenter.position],
  (bar, qs) => `${bar}-${qs}` as const
)

const Content = () =>
  Widget.Box({
    vexpand: true,
    hexpand: true,
    css: 'min-width: 2px;',
    children: [
      Widget.EventBox({
        onPrimaryClick: () => App.closeWindow('controlcenter'),
        onSecondaryClick: () => App.closeWindow('controlcenter'),
        onMiddleClick: () => App.closeWindow('controlcenter')
      }),
      Widget.Box({
        vertical: true,
        vexpand: true,
        className: 'control-center space-y-8',
        children: [
          Widget.Box({
            vertical: true,
            className: 'space-y-4',
            children: [Header]
          })
          // Widget.Box({
          //   className: 'sidebar-group',
          //   children: [sidebarOptionsStack]
          // }),
          // ModuleCalendar()
        ]
      })
    ],
    setup: (self) => {}
    // self.on('key-press-event', (widget, event) => {
    //   // Handle keybinds
    //   if (checkKeybind(event, userOptions.keybinds.sidebar.options.nextTab)) {
    //     sidebarOptionsStack.nextTab()
    //   } else if (
    //     checkKeybind(event, userOptions.keybinds.sidebar.options.prevTab)
    //   ) {
    //     sidebarOptionsStack.prevTab()
    //   }
    // })
  })

// const ControlCenter = () =>
//   PopupWindow({
//     name: 'controlcenter',
//     // exclusivity: 'ignore',
//     anchor: ['right', 'top', 'bottom'],
//     layer: 'overlay',
//     transition: options.controlCenter.position
//       .bind()
//       .as((pos) => (pos === 'right' ? 'slide_left' : 'slide_right')),
//     layout: layout.value,
//     child: Widget.Box({
//       children: [Content()]
//     })
//   })

const ControlCenter = () =>
  SidebarWindow({
    keymode: 'on-demand',
    anchor: ['right', 'top', 'bottom'],
    name: 'controlcenter',
    // className: 'control-center',
    layer: 'overlay',
    child: Widget.Box({
      children: [
        // clickCloseRegion({ name: 'sideright', multimonitor: false, fillMonitor: 'horizontal' }),
        Content()
      ]
    })
  })

// export const ControlCenter = () =>
//   PopupWindow({
//     keymode: 'on-demand',
//     anchor: ['right', 'top', 'bottom'],
//     name: 'controlcenter',
//     layer: 'overlay',
//     layout: layout.value,
//     child: Widget.Box({
//       children: [
//         Widget.Label('hi')
//         // clickCloseRegion({
//         //   name: 'sideright',
//         //   multimonitor: false,
//         //   fillMonitor: 'horizontal'
//         // }),
//         // SidebarRight()
//       ]
//     })
//   })

export function setupControlCenter() {
  App.addWindow(ControlCenter())
  layout.connect('changed', () => {
    App.removeWindow('controlcenter')
    App.addWindow(ControlCenter())
  })
}
