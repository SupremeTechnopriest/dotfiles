import Gtk from 'gi://Gtk?version=3.0'
import Pango from 'gi://Pango'
import cairo from 'gi://cairo'
import PangoCairo from 'gi://PangoCairo'

import type { DrawingArea, DrawingAreaProps } from '@/types/widgets/drawingarea'

interface MarqueeTextProps extends DrawingAreaProps {
  label: string
  speed?: number
}

export const MarqueeText = ({
  label,
  speed = 1,
  ...rest
}: MarqueeTextProps): DrawingArea<MarqueeTextProps> => {
  let xPosition = 0
  let layoutWidth = 0

  const drawingArea = Widget.DrawingArea<any>({
    hexpand: true,
    vexpand: false,
    attribute: {
      label
    },
    ...rest,
    drawFn: (self, cr: any) => {
      const width = self.get_allocated_width()
      const height = self.get_allocated_height()
      const style = self.get_style_context()

      // Create a Pango layout for the text
      const layout = self.create_pango_layout(self.attribute.label)
      layout.set_alignment(Pango.Alignment.LEFT)

      // Get the layout size
      const [lwidth, lheight] = layout.get_pixel_size()
      layoutWidth = lwidth

      // Set font face
      const fontFamily = style.get_property(
        'font-family',
        Gtk.StateFlags.NORMAL
      )
      cr.selectFontFace(
        fontFamily[0],
        cairo.FontSlant.NORMAL,
        cairo.FontWeight.BOLD
      )

      // Set font size
      const fontSize = style.get_property('font-size', Gtk.StateFlags.NORMAL)
      cr.setFontSize(fontSize)

      // Set text color
      const color = style.get_property('color', Gtk.StateFlags.NORMAL)
      cr.setSourceRGBA(color.red, color.green, color.blue, color.alpha)

      const yPosition = (height - lheight) / 2
      // Draw the text at the current x position
      cr.save()
      cr.translate(-xPosition, yPosition)
      PangoCairo.update_layout(cr, layout)
      PangoCairo.show_layout(cr, layout)
      cr.restore()

      // Draw a second instance for wrapping effect
      if (xPosition > layoutWidth - width) {
        cr.save()
        cr.translate(-xPosition + layoutWidth, yPosition)
        PangoCairo.update_layout(cr, layout)
        PangoCairo.show_layout(cr, layout)
        cr.restore()
      }

      return false
    }
  })

  // Animation loop
  Utils.interval(30, () => {
    xPosition += speed

    if (xPosition >= layoutWidth) {
      xPosition = 0
    }

    drawingArea.queue_draw()
    return true
  })

  return drawingArea
}
