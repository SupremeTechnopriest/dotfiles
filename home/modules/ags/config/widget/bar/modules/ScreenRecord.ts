import { PanelButton } from '@/widget/bar/PanelButton'
import { screenrecord } from '@/service/screenrecord'
import { icons } from '@/lib/icons'

const Record = Widget.Icon(icons.screen.record)

const Recording = Widget.Box({
  children: [
    Widget.Icon(icons.screen.recording),
    Widget.Label({
      label: screenrecord.bind('timer').as((time) => {
        const sec = time % 60
        const min = Math.floor(time / 60)
        return `${min}:${sec < 10 ? '0' + sec : sec}`
      })
    })
  ]
})

export const ScreenRecord = () =>
  PanelButton({
    className: 'recorder',
    visible: screenrecord.bind('recording').as((r) => !r),
    on_clicked: () =>
      screenrecord.bind('recording')
        ? screenrecord.stop()
        : screenrecord.start(),
    child: Record
  })

export const ScreenRecording = () =>
  PanelButton({
    className: 'recorder',
    visible: screenrecord.bind('recording').as((r) => r),
    on_clicked: () =>
      screenrecord.bind('recording')
        ? screenrecord.stop()
        : screenrecord.start(),
    child: Recording
  })
