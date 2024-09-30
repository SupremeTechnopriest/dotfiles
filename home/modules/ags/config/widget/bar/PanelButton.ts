import type Gtk from '@/types/@girs/gtk-3.0/gtk-3.0'
import type { ButtonProps } from '@/types/widgets/button'

type PanelButtonProps = ButtonProps & {
  window?: string
  flat?: boolean
}

export const PanelButton = ({
  window = '',
  flat,
  child,
  setup,
  ...rest
}: PanelButtonProps) =>
  Widget.Button({
    cursor: 'pointer',
    child,
    setup: (self) => {
      let open = false

      self.toggleClassName('panel-button')
      self.toggleClassName(window)

      if (flat) {
        self.toggleClassName('flat')
      }

      self.hook(App, (_, win, visible) => {
        if (win !== window) return

        if (open && !visible) {
          open = false
          self.toggleClassName('active', false)
        }

        if (visible) {
          open = true
          self.toggleClassName('active')
        }
      })

      if (setup) setup(self)
    },
    ...rest
  })

type ButtonGroupProps = {
  children: Array<() => Gtk.Widget>
}

export const ButtonGroup = ({ children }: ButtonGroupProps) =>
  Widget.Box({
    className: 'button-group',
    children: children.map((child) => child())
  })
