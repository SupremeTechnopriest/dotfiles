import { options } from '@/options'
import { cpu, ram, temperature, temperatureIcon } from '@/lib/variables'
import { CircularProgress } from '@/widget/common/CircularProgress'
import { FaIcon } from '@/widget/common/FaIcon'
import { PanelButton } from '@/widget/bar/PanelButton'

import type { Variable } from '@/types/variable'
import type Label from '@/types/widgets/label'

interface ResourceMonitorProps {
  icon: Label<unknown>
  iconCss?: string
  value: Variable<number>
  unit?: string
  onClicked: () => void
}

export const ResourceMonitor = ({
  icon,
  value,
  unit = '%',
  onClicked
}: ResourceMonitorProps) => {
  const resourceCircProg = CircularProgress({
    className: 'bar-resource-progress',
    css: value.bind().as((v) => `font-size: ${v}px;`),
    vpack: 'center',
    hpack: 'center'
  })

  const resourceProgress = Widget.Box({
    homogeneous: true,
    children: [
      Widget.Overlay({
        child: Widget.Box({
          vpack: 'center',
          className: 'bar-resource-icon-container',
          homogeneous: true,
          children: [icon]
        }),
        overlays: [resourceCircProg]
      })
    ]
  })

  const resourceLabel = Widget.Label({
    className: 'bar-resource-label',
    label: value.bind().as((v) => `${Math.round(v)}${unit}`)
  })

  return PanelButton({
    onClicked,
    child: Widget.Box({
      children: [resourceProgress, resourceLabel]
    })
  })
}

export const CPU = () =>
  ResourceMonitor({
    icon: FaIcon('microchip', 'sm'),
    value: cpu,
    onClicked: () => {
      Utils.execAsync([
        'bash',
        '-c',
        `${options.apps.taskManager.value}`
      ]).catch(print)
    }
  })

export const RAM = () =>
  ResourceMonitor({
    icon: FaIcon('memory', 'xs'),
    value: ram,
    onClicked: () => {
      Utils.execAsync([
        'bash',
        '-c',
        `${options.apps.taskManager.value}`
      ]).catch(print)
    }
  })

export const Temp = () =>
  ResourceMonitor({
    icon: FaIcon(temperatureIcon.bind(), 'xs'),
    value: temperature,
    unit: '°C',
    onClicked: () => {
      Utils.execAsync([
        'bash',
        '-c',
        `${options.apps.taskManager.value}`
      ]).catch(print)
    }
  })
