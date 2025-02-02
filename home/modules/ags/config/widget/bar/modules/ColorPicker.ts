import { PanelButton } from '@/widget/bar/PanelButton'
import { colorpicker } from '@/service/colorpicker'
import Gdk from 'gi://Gdk'
import { FaIcon } from '@/widget/common/FaIcon'

const css = (color: string) => `
* {
    background-color: ${color};
    color: transparent;
}
*:hover {
    color: white;
    text-shadow: 2px 2px 3px rgba(0,0,0,.8);
}`

export const ColorPicker = () => {
  const menu = Widget.Menu({
    class_name: 'colorpicker',
    children: colorpicker.bind('colors').as((c) =>
      c.map((color) =>
        Widget.MenuItem({
          child: Widget.Label(color),
          css: css(color),
          on_activate: () => colorpicker.wlCopy(color)
        })
      )
    )
  })

  return PanelButton({
    class_name: 'color-picker',
    child: FaIcon('eye-dropper', 'sm'),
    on_clicked: colorpicker.pick,
    on_secondary_click: (self) => {
      if (colorpicker.colors.length === 0) return

      menu.popup_at_widget(self, Gdk.Gravity.SOUTH, Gdk.Gravity.NORTH, null)
    }
  })
}
