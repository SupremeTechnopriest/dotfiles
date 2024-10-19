import '@/lib/session'
import '@/style'
import { options } from '@/options'
import { forMonitors } from '@/lib/utils'
import { init } from '@/lib/init'
import { Bar } from '@/widget/bar/Bar'
import { ScreenCorners } from '@/widget/bar/ScreenCorners'
import { FauxCorner } from '@/widget/desktop/FauxCorner'
import { Indicators } from '@/widget/indicators'
import { setupControlCenter } from '@/widget/controlcenter'

App.config({
  onConfigParsed: () => {
    setupControlCenter()
    // setupQuickSettings()
    // setupDateMenu()
    init()
  },
  closeWindowDelay: {
    controlcenter: options.transition.value
  },
  windows: () => [
    Bar(),
    ...forMonitors(Indicators),
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
