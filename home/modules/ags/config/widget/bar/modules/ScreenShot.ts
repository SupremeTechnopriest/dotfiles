import { PanelButton } from '@/widget/bar/PanelButton'
import { screenrecord } from '@/service/screenrecord'
import { MaterialIcon } from '@/widget/common/MaterialIcon'

export const ScreenShot = () =>
  PanelButton({
    className: 'recorder',
    on_clicked: () => screenrecord.screenshot(),
    child: MaterialIcon('screenshot_region', 'md')
  })
