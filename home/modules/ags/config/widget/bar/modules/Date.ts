import { options } from '@/options'
import { clock } from '@/lib/variables'
import { PanelButton } from '@/widget/bar/PanelButton'

const { format, action } = options.bar.date
const time = Utils.derive([clock, format], (c, f) => c.format(f) || '')

export const Date = () =>
  PanelButton({
    window: 'datemenu',
    on_clicked: action.bind(),
    child: Widget.Label({
      justification: 'right',
      label: time.bind()
    })
  })
