export const ClickCloseRegion = ({
  name,
  multiMonitor = true,
  monitor = 0,
  expand = true,
  fillMonitor = ''
}) => {
  return Widget.EventBox({
    child: Widget.Box({
      expand: expand,
      css: `
        min-width: ${fillMonitor.includes('h') ? monitors[monitor].width : 0}px;
        min-height: ${fillMonitor.includes('v') ? monitors[monitor].height : 0}px;
      `
    }),
    setup: (self) =>
      self.on('button-press-event', (self, event) => {
        // Any mouse button
        if (multiMonitor) closeWindowOnAllMonitors(name)
        else App.closeWindow(name)
      })
  })
}
