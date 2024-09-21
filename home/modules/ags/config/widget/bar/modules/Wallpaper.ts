import { icons } from '@/lib/icons'
import { icon } from '@/lib/utils'
import { options } from '@/options'
import { PanelButton } from '@/widget/bar/PanelButton'

export const WallpaperCycle = () => {
  return PanelButton({
    className: 'wallpapercycle',
    flat: true,
    child: Widget.Icon(icon(icons.ui.wallpaper)),
    onPrimaryClick: () => {
      options.theme.scheme.setValue('tokyoNight')
    }
  })
}
