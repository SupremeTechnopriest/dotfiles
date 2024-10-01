import { options } from '@/options'
import { clock } from '@/lib/variables'
import { PanelButton } from '@/widget/bar/PanelButton'
import { Separator } from '@/widget/bar/Separator'

const { format, action } = options.bar.date
const time = Utils.derive([clock, format.time], (c, f) => c.format(f) || '')
const date = Utils.derive([clock, format.date], (c, f) => c.format(f) || '')

export const Date = () =>
  PanelButton({
    window: 'datemenu',
    flat: true,
    on_clicked: action.bind(),
    child: Widget.Box({
      className: 'space-x-4',
      children: [
        Widget.Label({
          class_name: 'text-bold text-normal',
          justification: 'right',
          label: time.bind()
        }),
        Widget.Label({
          justification: 'right',
          label: date.bind()
        })
      ]
    })
  })
