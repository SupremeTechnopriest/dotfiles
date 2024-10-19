export const SidebarWindow = ({
  name,
  child,
  showClassName = '',
  hideClassName = '',
  ...props
}) =>
  Widget.Window({
    name,
    visible: false,
    layer: 'overlay',
    className: 'sidebar',
    ...props,

    child: Widget.Box({
      setup: (self) => {
        self.keybind('Escape', () => App.closeWindow(name))
        if (showClassName != '' && hideClassName !== '') {
          self.hook(App, (self, currentName, visible) => {
            if (currentName === name) {
              self.toggleClassName(hideClassName, !visible)
            }
          })

          if (showClassName !== '' && hideClassName !== '')
            self.class_name = `${showClassName} ${hideClassName}`
        }
      },
      child: child
    })
  })
