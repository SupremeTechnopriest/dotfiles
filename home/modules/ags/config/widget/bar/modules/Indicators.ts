import { options } from '@/options'
import { icons } from '@/lib/icons'
import { PanelButton } from '@/widget/bar/PanelButton'

const Notifications = await Service.import('notifications')
const bluetooth = await Service.import('bluetooth')
const audio = await Service.import('audio')
const network = await Service.import('network')

export const NotificationIndicator = (notifCenterName = 'controlcenter') => {
  const widget = Widget.Revealer({
    transition: 'slide_left',
    transitionDuration: options.transition.value,
    revealChild: Notifications.bind('notifications').as((n) => n.length >= 0),
    child: Widget.Box({
      children: [
        Widget.Icon({
          className: 'text-normal',
          icon: icons.notifications.noisy
        }),
        Widget.Label({
          className: 'text-subtle',
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
    child: Widget.Icon({
      // visible: Notifications.bind('dnd'),
      className: 'text-muted',
      icon: icons.notifications.silent
    })
  })

const MicrophoneIndicator = () =>
  Widget.Icon()
    .hook(
      audio,
      (self) =>
        (self.visible =
          audio.recorders.length > 0 || audio.microphone.is_muted || false)
    )
    .hook(audio.microphone, (self) => {
      const vol = audio.microphone.is_muted ? 0 : audio.microphone.volume
      const { muted, low, medium, high } = icons.audio.mic
      const cons = [
        [67, high],
        [34, medium],
        [1, low],
        [0, muted]
      ] as const
      self.icon = cons.find(([n]) => n <= vol * 100)?.[1] || ''
    })

const BluetoothIndicator = () =>
  Widget.Overlay({
    class_name: 'bluetooth',
    passThrough: true,
    visible: bluetooth.bind('enabled'),
    child: Widget.Icon({
      className: 'bar-indicator',
      icon: icons.bluetooth.enabled
    }),
    overlay: Widget.Label({
      hpack: 'end',
      vpack: 'start',
      label: bluetooth.bind('connected_devices').as((c) => `${c.length}`),
      visible: bluetooth.bind('connected_devices').as((c) => c.length > 0)
    })
  })

const NetworkIndicator = () =>
  Widget.Icon().hook(network, (self) => {
    const icon = network[network.primary || 'wifi']?.icon_name
    self.icon = icon || ''
    self.visible = !!icon
  })

const AudioIndicator = () =>
  Widget.Icon().hook(audio.speaker, (self) => {
    const vol = audio.speaker.is_muted ? 0 : audio.speaker.volume
    const { muted, low, medium, high, overamplified } = icons.audio.volume
    const cons = [
      [101, overamplified],
      [67, high],
      [34, medium],
      [1, low],
      [0, muted]
    ] as const
    self.icon = cons.find(([n]) => n <= vol * 100)?.[1] || ''
  })

export const Indicators = () =>
  PanelButton({
    window: 'quicksettings',
    flat: true,
    on_clicked: () => App.toggleWindow('controlcenter'),
    on_scroll_up: () => (audio.speaker.volume += 0.02),
    on_scroll_down: () => (audio.speaker.volume -= 0.02),
    child: Widget.Box({
      className: 'spacing-h-15',
      children: [
        NotificationIndicator(),
        DNDIndicator(),
        BluetoothIndicator(),
        NetworkIndicator(),
        AudioIndicator(),
        MicrophoneIndicator()
      ]
    })
  })
