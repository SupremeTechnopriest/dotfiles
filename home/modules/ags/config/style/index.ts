import { options } from '@/options'
import { getOption } from '@/lib/option'
import { bash, dependencies } from '@/lib/utils'

import type { Opt } from '@/lib/option'

const deps = [
  'font',
  'theme',
  'bar.corners',
  'bar.flatButtons',
  'bar.position',
  'bar.battery.charging',
  'bar.battery.blocks'
]

const { blur, scheme, padding, spacing, radius, shadows, widget, border } =
  options.theme

const popoverPaddingMultiplier = 1.6

const t = (path: string) => getOption(options.theme[scheme.value], path)

const $ = (name: string, value: string | Opt<any>) => `$${name}: ${value};`

const variables = () => [
  $(
    'base',
    blur.value ? `transparentize(${t('base')}, ${blur.value / 100})` : t('base')
  ),

  $(
    'surface',
    blur.value
      ? `transparentize(${t('surface')}, ${blur.value / 100})`
      : t('surface')
  ),

  $(
    'overlay',
    blur.value
      ? `transparentize(${t('overlay')}, ${blur.value / 100})`
      : t('overlay')
  ),

  $('subtle', t('subtle')),
  $('muted', t('muted')),
  $('text', t('text')),
  $('primary', t('primary')),
  $('success', t('success')),
  $('error', t('error')),

  $('hl-low', t('highlight.low')),
  $('hl-med', t('highlight.medium')),
  $('hl-high', t('highlight.high')),

  $('font-size', `${options.font.size}pt`),
  $('font-title', options.font.face.title),
  $('font-main', options.font.face.main),
  $('font-reading', options.font.face.reading),
  $('font-icon', options.font.face.icon),
  $('font-nerd', options.font.face.nerd),
  $('font-mono', options.font.face.mono),

  $('scheme', scheme),
  $('padding', `${padding}pt`),
  $('spacing', `${spacing}pt`),
  $('radius', `${radius}px`),
  $('transition', `${options.transition}ms`),

  $('shadows', `${shadows}`),
  $('border-width', `${border.width}px`),
  $(
    'border-color',
    `transparentize(${t('primary')}, ${border.opacity.value / 100})`
  ),
  $('border', '$border-width solid $border-color'),

  $('bar-position', options.bar.position),
  $('hyprland-gaps-multiplier', options.hyprland.gaps),
  $('screen-corner-multiplier', `${options.bar.corners.value * 0.01}`)
  //
  // $(
  //   'widget-bg',
  //   `transparentize(${t(dark.widget, light.widget)}, ${widget.opacity.value / 100})`
  // ),
  //
  // $(
  //   'hover-bg',
  //   `transparentize(${t(dark.widget, light.widget)}, ${(widget.opacity.value * 0.9) / 100})`
  // ),
  // $('hover-fg', `lighten(${t(dark.fg, light.fg)}, 8%)`),
  //
  //
  // $(
  //   'active-gradient',
  //   `linear-gradient(to right, ${t(dark.primary.bg, light.primary.bg)}, darken(${t(dark.primary.bg, light.primary.bg)}, 4%))`
  // ),
  // $('shadow-color', t('rgba(0,0,0,.6)', 'rgba(0,0,0,.4)')),
  // $('text-shadow', t('2pt 2pt 2pt $shadow-color', 'none')),
  // $(
  //   'box-shadow',
  //   t(
  //     '2pt 2pt 2pt 0 $shadow-color, inset 0 0 0 $border-width $border-color',
  //   )
  // ),

  // $(
  //   'popover-border-color',
  //   `transparentize(${t('border')}, ${Math.max((border.opacity.value - 1) / 100, 0)})`
  // ),
  // $('popover-padding', `$padding * ${popoverPaddingMultiplier}`),
  // $('popover-radius', radius.value === 0 ? '0' : '$radius + $popover-padding'),
  //
  //
]

async function resetCss() {
  if (!dependencies('sass', 'fd')) return

  try {
    const vars = `${TMP}/variables.scss`
    const scss = `${TMP}/main.scss`
    const css = `${TMP}/main.css`

    const fd = await bash(`fd ".scss" ${App.configDir}`)
    const files = fd.split(/\s+/)
    const imports = [vars, ...files].map((f) => `@import '${f}';`)

    await Utils.writeFile(variables().join('\n'), vars)
    await Utils.writeFile(imports.join('\n'), scss)
    await bash`sass ${scss} ${css}`

    App.applyCss(css, true)
  } catch (error) {
    error instanceof Error ? logError(error) : console.error(error)
  }
}

Utils.monitorFile(`${App.configDir}/style`, resetCss)
options.handler(deps, resetCss)
await resetCss()
