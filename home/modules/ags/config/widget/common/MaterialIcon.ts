import clsx from 'clsx'
import type { Binding } from '@/types/service'
import type { LabelProps } from '@/types/widgets/label'

export const MaterialIcon = (
  icon: string | Binding<any, string>,
  size: 'xxs' | 'xs' | 'sm' | 'md' | 'lg' | 'xl' = 'md',
  props: LabelProps = {}
) =>
  Widget.Label({
    ...props,
    className: clsx(`icon-material text-${size}`, props.className),
    label: icon
  })
