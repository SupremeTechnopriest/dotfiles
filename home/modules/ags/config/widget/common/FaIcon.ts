export const FaIcon = (icon: string, size: string, props = {}) =>
  Widget.Label({
    className: `icon-material txt-${size}`,
    label: icon,
    ...props
  })
