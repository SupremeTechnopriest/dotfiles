import { FullscreenOption, options } from '@/options'

const Hyprland = await Service.import('hyprland')

type Position = 'topleft' | 'topright' | 'bottomleft' | 'bottomright'

export const RoundedCorner = (position: Position) =>
  Widget.DrawingArea({
    hpack: position.includes('left') ? 'start' : 'end',
    vpack: position.includes('top') ? 'start' : 'end',
    heightRequest: options.theme.radius.value,
    widthRequest: options.theme.radius.value,
    drawFn: (_, cr: any) => {
      const r = options.theme.radius.value

      switch (position) {
        case 'topleft':
          cr.arc(r, r, r, Math.PI, (3 * Math.PI) / 2)
          cr.lineTo(0, 0)
          break

        case 'topright':
          cr.arc(0, r, r, (3 * Math.PI) / 2, 2 * Math.PI)
          cr.lineTo(r, 0)
          break

        case 'bottomleft':
          cr.arc(r, 0, r, Math.PI / 2, Math.PI)
          cr.lineTo(0, r)
          break

        case 'bottomright':
          cr.arc(0, 0, r, 0, Math.PI / 2)
          cr.lineTo(r, r)
          break
      }

      cr.closePath()
      cr.setSourceRGBA(0, 0, 0, 1)
      cr.fill()
    }
  })

if (
  options.appearance.screenRounding.value === FullscreenOption.NOT_FULLSCREEN
) {
  Hyprland.connect('event', (_, name, data) => {
    if (name == 'fullscreen') {
      const monitor = Hyprland.active.monitor.id
      if (data == '1') {
        for (const window of App.windows) {
          if (
            window.name?.startsWith('corner') &&
            window.name?.endsWith(monitor.toString())
          ) {
            App.closeWindow(window.name)
          }
        }
      } else {
        for (const window of App.windows) {
          if (
            window.name?.startsWith('corner') &&
            window.name?.endsWith(monitor.toString())
          ) {
            App.openWindow(window.name)
          }
        }
      }
    }
  })
}

export const FauxCorner = (
  monitor = 0,
  where = 'bottom left',
  useOverlayLayer = true
) => {
  const positionString = where.replace(/\s/, '') as Position
  return Widget.Window({
    monitor,
    name: `corner${positionString}${monitor}`,
    layer: useOverlayLayer ? 'overlay' : 'top',
    css: 'background: transparent',
    // @ts-expect-error
    anchor: where.split(' '),
    exclusivity: 'ignore',
    visible: true,
    clickThrough: true,
    child: RoundedCorner(positionString)
  })
}
