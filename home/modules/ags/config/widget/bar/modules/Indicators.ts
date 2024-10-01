import { options } from '@/options'
import { MaterialIcon } from '@/widget/common/MaterialIcon'
import { PanelButton } from '@/widget/bar/PanelButton'
import type Label from '@/types/widgets/label'

const Notifications = await Service.import('notifications')
const Bluetooth = await Service.import('bluetooth')
const Audio = await Service.import('audio')
const Network = await Service.import('network')

export const NotificationIndicator = () => {
  const widget = Widget.Revealer({
    transition: 'slide_left',
    transitionDuration: options.transition.value,
    revealChild: Notifications.bind('notifications').as((n) => n.length > 0),
    child: Widget.Box({
      children: [
        MaterialIcon('notifications', 'md', {
          className: 'text-normal'
        }),
        Widget.Label({
          className: 'text-title text-subtle',
          label: Notifications.bind('notifications').as((n) =>
            n.length.toString()
          )
        })
      ]
    })
  })
  return widget
}

const DNDIndicator = () =>
  Widget.Box({
    child: MaterialIcon('notifications_off', 'md', {
      visible: Notifications.bind('dnd'),
      className: 'text-muted'
    })
  })

const BluetoothIndicator = () =>
  Widget.Stack({
    transition: 'slide_up_down',
    transitionDuration: options.transition.value,
    children: {
      false: MaterialIcon('bluetooth_disabled', 'md', {
        className: 'txt-subtle'
      }),
      true: MaterialIcon('bluetooth', 'md', {
        className: 'txt-subtle'
      })
    } as Record<string, Label<unknown>>,
    shown: Bluetooth.bind('enabled').as((enabled) => String(enabled))
  })

const SimpleNetworkIndicator = () =>
  MaterialIcon('wifi_tethering_error', 'md', {
    className: 'text-subtle'
  })

const NetworkWiredIndicator = () =>
  Widget.Stack({
    transition: 'slide_up_down',
    transitionDuration: options.transition.value,
    children: {
      fallback: SimpleNetworkIndicator(),
      unknown: MaterialIcon('wifi_off', 'md', {
        className: 'text-subtle'
      }),
      disconnected: MaterialIcon('signal_wifi_off', 'md', {
        className: 'text-subtle'
      }),
      connected: MaterialIcon('lan', 'md', {
        className: 'text-subtle'
      }),
      connecting: MaterialIcon('settings_ethernet', 'md', {
        className: 'text-subtle'
      })
    } as Record<string, Label<unknown>>,
    shown: Network.bind('wired').as((wired) => {
      if (!wired) return 'fallback'

      const { internet } = wired
      if (['connecting', 'connected'].includes(internet)) return internet
      else if (Network.connectivity !== 'full') return 'disconnected'
      else return 'fallback'
    })
  })

const NetworkWifiIndicator = () =>
  Widget.Stack({
    transition: 'slide_up_down',
    transitionDuration: options.transition.value,
    children: {
      disabled: MaterialIcon('wifi_off', 'md', {
        className: 'text-subtle'
      }),
      disconnected: MaterialIcon('signal_wifi_off', 'md', {
        className: 'text-subtle'
      }),
      connecting: MaterialIcon('settings_ethernet', 'md', {
        className: 'text-subtle'
      }),
      '0': MaterialIcon('signal_wifi_0_bar', 'md', {
        className: 'text-subtle'
      }),
      '1': MaterialIcon('network_wifi_1_bar', 'md', {
        className: 'text-subtle'
      }),
      '2': MaterialIcon('network_wifi_2_bar', 'md', {
        className: 'text-subtle'
      }),
      '3': MaterialIcon('network_wifi_3_bar', 'md', {
        className: 'text-subtle'
      }),
      '4': MaterialIcon('signal_wifi_4_bar', 'md', {
        className: 'text-subtle'
      })
    } as Record<string, Label<unknown>>,
    shown: Network.bind('wifi').as((wifi) => {
      if (!wifi) {
        return ''
      }
      if (wifi.internet == 'connected') {
        return Math.ceil(wifi.strength / 25).toString()
      } else if (['disconnected', 'connecting'].includes(wifi.internet)) {
        return wifi.internet
      } else {
        return ''
      }
    })
  })

const NetworkIndicator = () =>
  Widget.Stack({
    transition: 'slide_up_down',
    transitionDuration: options.transition.value,
    children: {
      fallback: SimpleNetworkIndicator(),
      wifi: NetworkWifiIndicator(),
      wired: NetworkWiredIndicator()
    },
    shown: Network.bind('primary').as((primary) => {
      if (!primary) {
        return 'wifi'
      }
      if (['wifi', 'wired'].includes(primary)) return primary
      else return 'fallback'
    })
  })

const AudioIndicator = () =>
  Widget.Box({
    child: MaterialIcon('volume_mute', 'md', {
      className: 'text-subtle'
    }).hook(Audio, (self) => {
      const vol = Audio.speaker.is_muted ? 0 : Audio.speaker.volume

      const cons = [
        [101, 'brand_awareness'],
        [67, 'volume_up'],
        [34, 'volume_down'],
        [1, 'volume_mute'],
        [0, 'no_sound']
      ] as const

      self.label = cons.find(([n]) => n <= vol * 100)?.[1] || ''
    })
  })

const MicMuteIndicator = () =>
  Widget.Revealer({
    transition: 'slide_left',
    transitionDuration: options.transition.value,
    revealChild: Audio.bind('microphone').as((microphone) =>
      Boolean(microphone?.stream?.isMuted)
    ),
    child: MaterialIcon('mic_off', 'md', {
      className: 'text-muted'
    })
  })

export const Indicators = () =>
  PanelButton({
    window: 'indicators',
    flat: true,
    on_clicked: () => App.toggleWindow('controlcenter'),
    on_scroll_up: () => (Audio.speaker.volume += 0.02),
    on_scroll_down: () => (Audio.speaker.volume -= 0.02),
    child: Widget.Box({
      className: 'space-x-8',
      children: [
        NotificationIndicator(),
        DNDIndicator(),
        BluetoothIndicator(),
        NetworkIndicator(),
        MicMuteIndicator(),
        AudioIndicator()
      ]
    })
  })
