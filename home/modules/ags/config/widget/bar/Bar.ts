import { options } from '@/options'

import { Separator } from '@/widget/bar/Separator'
import { Workspaces } from '@/widget/bar/modules/Workspaces'
import { Date } from '@/widget/bar/modules/Date'
import { ColorPicker } from '@/widget/bar/modules/ColorPicker'
import { CPU, RAM, Temp } from '@/widget/bar/modules/ResouceMonitor'
import { ScreenRecord } from '@/widget/bar/modules/ScreenRecord'
import { ScreenShot } from '@/widget/bar/modules/ScreenShot'
import { Indicators } from '@/widget/bar/modules/Indicators'
import { Weather } from '@/widget/bar/modules/Weather'
import { Media } from '@/widget/bar/modules/Media'
import { Tray } from '@/widget/bar/modules/Tray'

const {
  transparent,
  position,
  layout: { start, center, end }
} = options.bar

export type BarWidget = keyof typeof widget

const widget = {
  separator: Separator,
  workspaces: Workspaces,
  date: Date,
  colorpicker: ColorPicker,
  cpu: CPU,
  ram: RAM,
  temp: Temp,
  screenrecord: ScreenRecord,
  screenshot: ScreenShot,
  tray: Tray,
  indicators: Indicators,
  weather: Weather,
  media: Media,
  expander: () => Widget.Box({ expand: true })
}

export const Zen = (monitor: number) =>
  Widget.Window({
    monitor,
    className: 'bar',
    name: `bar-${monitor}`,
    exclusivity: 'exclusive',
    anchor: position.bind().as((pos) => [pos, 'right', 'left'])
  })

export const Bar = (monitor: number) =>
  Widget.Window({
    monitor,
    className: 'bar',
    name: `bar-${monitor}`,
    exclusivity: 'exclusive',
    anchor: position.bind().as((pos) => [pos, 'right', 'left']),
    child: Widget.CenterBox({
      css: 'min-width: 2px; min-height: 2px;',
      startWidget: Widget.Box({
        hexpand: true,
        children: start.bind().as((s) => s.map((w) => widget[w]()))
      }),
      centerWidget: Widget.Box({
        hpack: 'center',
        children: center.bind().as((c) => c.map((w) => widget[w]()))
      }),
      endWidget: Widget.Box({
        hexpand: true,
        hpack: 'end',
        children: end.bind().as((e) => e.map((w) => widget[w]()))
      })
    }),
    setup: (self) =>
      self.hook(transparent, () => {
        self.toggleClassName('transparent', transparent.value)
      })
  })
