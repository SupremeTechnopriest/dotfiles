import clsx from 'clsx'
import type { Binding } from '@/types/service'
import type { LabelProps } from '@/types/widgets/label'

export const FaIcon = (
  icon: string | Binding<any, string>,
  size: 'xxs' | 'xs' | 'sm' | 'md' | 'lg' | 'xl' = 'md',
  props: LabelProps = {}
) =>
  Widget.Label({
    ...props,
    className: clsx(`icon-fa text-${size}`, props.className),
    label: icon
  })
