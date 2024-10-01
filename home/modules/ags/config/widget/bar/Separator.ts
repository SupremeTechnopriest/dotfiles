import { FaIcon } from '@/widget/common/FaIcon'

export const Separator = () =>
  Widget.Box({
    css: 'margin: 0 0.5rem;',
    className: 'text-muted',
    child: FaIcon('circle', 'xxs')
  })
