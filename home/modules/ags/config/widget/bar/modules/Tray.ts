import { options } from '@/options'

import type { TrayItem } from '@/types/service/systemtray'

const { Box, Icon, Button, Revealer } = Widget
const { Gravity } = imports.gi.Gdk

const SystemTray = await Service.import('systemtray')

const SysTrayItem = (item: TrayItem) => {
  return item.id !== null
    ? Button({
        className: 'bar-systray-item',
        child: Icon({ hpack: 'center' }).bind('icon', item, 'icon'),
        setup: (self) =>
          self.hook(item, (self) => (self.tooltipMarkup = item.tooltip_markup)),
        onPrimaryClick: (_, event) => item.activate(event),
        onSecondaryClick: (btn) =>
          item.menu?.popup_at_widget(btn, Gravity.SOUTH, Gravity.NORTH, null)
      })
    : null
}

console.log(SystemTray.items)

export const Tray = (props = {}) => {
  const trayContent = Box({
    className: 'margin-right-5 spacing-h-15',
    children: SystemTray.items.map(SysTrayItem).filter((x) => x)
  })
  const trayRevealer = Revealer({
    revealChild: true,
    transition: 'slide_left',
    transitionDuration: options.transition.value,
    child: trayContent
  })
  return Box({
    ...props,
    children: [trayRevealer]
  })
}
