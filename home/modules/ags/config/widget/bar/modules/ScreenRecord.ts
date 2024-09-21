import { PanelButton } from '@/widget/bar/PanelButton'
import { screenrecord } from '@/service/screenrecord'
import { icons } from '@/lib/icons'
import { icon } from '@/lib/utils'

const Record = Widget.Icon(icon(icons.screen.record))

const Recording = Widget.Box({
  children: [
    Widget.Icon(icon(icons.screen.recording)),
    Widget.Label({
      label: screenrecord.bind('timer').as((time) => {
        const sec = time % 60
        const min = Math.floor(time / 60)
        return `${min}:${sec < 10 ? '0' + sec : sec}`
      })
    })
  ]
})

const child = screenrecord.bind('recording') ? Recording : Record

export const ScreenRecord = () =>
  PanelButton({
    className: 'recorder',
    on_clicked: () =>
      screenrecord.bind('recording')
        ? screenrecord.stop()
        : screenrecord.start(),
    child
  })
