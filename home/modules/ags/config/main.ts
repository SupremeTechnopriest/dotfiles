import '@/lib/session'
import '@/style'
import { options } from '@/options'
import { forMonitors } from '@/lib/utils'
import { init } from '@/lib/init'
import { Bar } from '@/widget/bar/Bar'
import { ScreenCorners } from '@/widget/bar/ScreenCorners'

App.config({
  onConfigParsed: () => {
    // setupQuickSettings()
    // setupDateMenu()
    init()
  },
  closeWindowDelay: {
    launcher: options.transition.value,
    overview: options.transition.value,
    quicksettings: options.transition.value,
    datemenu: options.transition.value
  },
  windows: () => [...forMonitors(Bar), ...forMonitors(ScreenCorners)]
})
