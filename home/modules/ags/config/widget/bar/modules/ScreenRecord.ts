import { options } from '@/options'
import { PanelButton } from '@/widget/bar/PanelButton'
import { MaterialIcon } from '@/widget/common/MaterialIcon'
import { screenrecord } from '@/service/screenrecord'

const Record = () =>
  Widget.Box({
    child: MaterialIcon('screen_record', 'md')
  })

const Recording = () =>
  Widget.Box({
    className: 'space-x-4',
    visible: screenrecord.bind('recording'),
    children: [
      MaterialIcon('stop_circle', 'md', {
        className: 'text-error'
      }),
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
    on_clicked: () =>
      screenrecord.recording ? screenrecord.stop() : screenrecord.start(),
    child: Widget.Box({
      child: Widget.Stack({
        transition: 'slide_up_down',
        transitionDuration: options.transition.value,
        children: {
          false: Record(),
          true: Recording()
        } as Record<string, any>,
        shown: screenrecord.bind('recording').as((enabled) => String(enabled))
      })
    })
  })
