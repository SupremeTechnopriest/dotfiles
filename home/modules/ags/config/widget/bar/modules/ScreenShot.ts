import { PanelButton } from '@/widget/bar/PanelButton'
import { screenrecord } from '@/service/screenrecord'
import { icons } from '@/lib/icons'
import { icon } from '@/lib/utils'

export const ScreenShot = () =>
  PanelButton({
    className: 'recorder',
    on_clicked: () => screenrecord.screenshot(),
    child: Widget.Icon(icon(icons.screen.screenshot))
  })
