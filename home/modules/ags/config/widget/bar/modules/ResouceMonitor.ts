import { options } from '@/options'
import { icons } from '@/lib/icons'
import { cpu, ram, temperature, temperatureIcon } from '@/lib/variables'
import { CircularProgress } from '@/widget/common/CircularProgress'
import { PanelButton } from '@/widget/bar/PanelButton'

import type { Variable } from '@/types/variable'
import type { Binding } from '@/types/service'

interface ResourceMonitorProps {
  icon: string | Binding<Variable<string>, any, string>
  iconCss?: string
  value: Variable<number>
  unit?: string
  onClicked: () => void
}

export const ResourceMonitor = ({
  icon,
  iconCss = '',
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
          children: [
            Widget.Icon({
              icon,
              css: iconCss,
              className: 'bar-resource-icon'
            })
          ]
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
    icon: icons.system.cpu,
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
    icon: icons.system.ram,
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
    icon: temperatureIcon.bind(),
    iconCss: 'margin-left: 4px',
    value: temperature,
    unit: 'c',
    onClicked: () => {
      Utils.execAsync([
        'bash',
        '-c',
        `${options.apps.taskManager.value}`
      ]).catch(print)
    }
  })
