import { icons } from '@/lib/icons'
import { uptime } from '@/lib/variables'

const Hyprland = await Service.import('hyprland')

export const ModuleReloadIcon = (props = {}) =>
  Widget.Button({
    ...props,
    className: 'txt-small sidebar-iconbutton',
    tooltipText: 'Reload Environment config',
    onClicked: () => {
      Hyprland.messageAsync('reload')
      App.closeWindow('sideright')
    },
    child: Widget.Icon(icons.ui.refresh)
  })

export const Header = Widget.Box({
  className: 'spacing-h-10 sidebar-group-invisible-morehorizpad',
  children: [
    Widget.Icon({
      icon: icons.nix.nix,
      className: 'txt txt-larger'
    }),
    Widget.Label({
      hpack: 'center',
      className: 'txt-small txt',
      label: uptime.bind()
    }),
    Widget.Box({ hexpand: true }),
    ModuleReloadIcon({ hpack: 'end' })
    // ModuleSettingsIcon({ hpack: 'end' }), // Button does work, gnome-control-center is kinda broken
    // ModulePowerIcon({ hpack: 'end' })
  ]
})
