import { PanelButton } from '../PanelButton'

const Hyprland = await Service.import('hyprland')

const WindowTitle = () =>
  Widget.Box({
    vertical: true,
    children: [
      Widget.Label({
        xalign: 0,
        truncate: 'end',
        maxWidthChars: 1,
        className: 'text-sm text-normal text-title text-bold',
        setup: (self) =>
          self.hook(Hyprland.active.client, (label) => {
            label.label =
              Hyprland.active.client.class.length === 0
                ? 'Desktop'
                : Hyprland.active.client.class
          })
      }),
      Widget.Label({
        xalign: 0,
        truncate: 'end',
        maxWidthChars: 1,
        className: 'text-xs text-subtle text-title',
        setup: (self) =>
          self.hook(Hyprland.active.client, (label) => {
            label.label =
              Hyprland.active.client.title.length === 0
                ? `Workspace ${Hyprland.active.workspace.id}`
                : Hyprland.active.client.title
          })
      })
    ]
  })

export const Title = () => {
  return Widget.EventBox({
    onScrollUp: () => {},
    onScrollDown: () => {},
    onPrimaryClick: () => {},
    child: Widget.Box({
      homogeneous: true,
      className: 'bar-title',
      child: PanelButton({
        child: WindowTitle()
      })
    })
  })
}
