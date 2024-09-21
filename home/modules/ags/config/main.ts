import '@/lib/session'
import '@/style'
import { options } from '@/options'
import { forMonitors } from '@/lib/utils'
import { init } from '@/lib/init'
import { Bar } from '@/widget/bar/Bar'
import { ScreenCorners } from '@/widget/bar/ScreenCorners'
import { FauxCorner } from '@/widget/desktop/FauxCorner'

App.config({
  onConfigParsed: () => {
    // setupQuickSettings()
    // setupDateMenu()
    init()
  },
  closeWindowDelay: {
    // launcher: options.transition.value,
    // overview: options.transition.value,
    // quicksettings: options.transition.value,
    // datemenu: options.transition.value
  },
  windows: () => [
    ...forMonitors(Bar),
    ...forMonitors(ScreenCorners),
    ...(options.appearance.screenRounding.value
      ? [
          ...forMonitors((id) => FauxCorner(id, 'top left', true)),
          ...forMonitors((id) => FauxCorner(id, 'top right', true)),
          ...forMonitors((id) => FauxCorner(id, 'bottom left', true)),
          ...forMonitors((id) => FauxCorner(id, 'bottom right', true))
        ]
      : [])
  ]
})
