import { options } from '@/options'

import { Separator } from '@/widget/bar/Separator'
import { Title } from '@/widget/bar/modules/Title'
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

const { monitor, zen, transparent, position, layout } = options.bar

export type BarWidget = keyof typeof widget

const widget = {
  separator: Separator,
  title: Title,
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

export const Zen = () =>
  Widget.CenterBox({
    css: 'min-width: 2px; min-height: 2px;',
    startWidget: Widget.Box({
      hexpand: true,
      children: layout.zen.start.bind().as((s) => s.map((w) => widget[w]()))
    }),
    centerWidget: Widget.Box({
      hpack: 'center',
      children: layout.zen.center.bind().as((c) => c.map((w) => widget[w]()))
    }),
    endWidget: Widget.Box({
      hexpand: true,
      hpack: 'end',
      children: layout.zen.end.bind().as((e) => e.map((w) => widget[w]()))
    })
  })

export const Normal = () =>
  Widget.CenterBox({
    css: 'min-width: 2px; min-height: 2px;',
    startWidget: Widget.Box({
      hexpand: true,
      children: layout.normal.start.bind().as((s) => s.map((w) => widget[w]()))
    }),
    centerWidget: Widget.Box({
      hpack: 'center',
      children: layout.normal.center.bind().as((c) => c.map((w) => widget[w]()))
    }),
    endWidget: Widget.Box({
      hexpand: true,
      hpack: 'end',
      children: layout.normal.end.bind().as((e) => e.map((w) => widget[w]()))
    })
  })

export const Bar = () =>
  Widget.Window({
    monitor: monitor.bind(),
    className: 'bar',
    name: 'bar',
    exclusivity: 'exclusive',
    anchor: position.bind().as((pos) => [pos, 'right', 'left']),
    child: Widget.Stack({
      transition: 'slide_up_down',
      transitionDuration: options.transition.value,
      children: {
        zen: Zen(),
        normal: Normal()
      },
      shown: zen.bind().as((zen) => (zen ? 'zen' : 'normal'))
    }),
    setup: (self) =>
      self.hook(transparent, () => {
        self.toggleClassName('transparent', transparent.value)
      })
  })
