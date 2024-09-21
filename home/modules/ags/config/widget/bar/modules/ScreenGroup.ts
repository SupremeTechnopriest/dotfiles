import { ButtonGroup } from '@/widget/bar/PanelButton'
import { ScreenRecord } from './ScreenRecord'
import { ScreenShot } from './ScreenShot'
import { ColorPicker } from './ColorPicker'

export const ScreenGroup = () =>
  ButtonGroup({
    children: [ColorPicker, ScreenShot, ScreenRecord]
  })
