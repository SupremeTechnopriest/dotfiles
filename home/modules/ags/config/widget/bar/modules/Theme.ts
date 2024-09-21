import { icons } from '@/lib/icons'
import { icon } from '@/lib/utils'
import { PanelButton } from '@/widget/bar/PanelButton'

export const ThemeCycle = () => {
  return PanelButton({
    className: 'themecycle',
    flat: true,
    child: Widget.Icon(icon(icons.ui.palette))
  })
}
