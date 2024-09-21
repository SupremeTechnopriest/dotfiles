import { opt, mkOptions } from '@/lib/option'
// import { distro } from '@/lib/variables'
// import { icon } from '@/lib/utils'
// import icons from '@/lib/icons'

import type { BarWidget } from '@/widget/bar/Bar'

type Theme =
  | 'monokai'
  | 'rosePine'
  | 'tokyoNight'
  | 'catpuccinMocha'
  | 'catpuccinLatte'

export enum FullscreenOption {
  NEVER,
  ALWAYS,
  NOT_FULLSCREEN
}

export const options = mkOptions(OPTIONS, {
  appearance: {
    screenRounding: opt<FullscreenOption>(FullscreenOption.NOT_FULLSCREEN)
  },

  theme: {
    monokai: {
      base: opt('#2A2B3C'),
      surface: opt('#383A59'),
      overlay: opt('#5A5C8C'),

      muted: opt('#8C8FA1'),
      subtle: opt('#C5C8C6'),
      text: opt('#E3E5E8'),

      highlight: {
        low: opt('#3B3E5B'),
        medium: opt('#4B4E6B'),
        high: opt('#5A5C8C')
      },

      primary: opt('#AB9DF2'),
      error: opt('#F25D7D'),
      success: opt('#A8E36B')
    },

    rosePine: {
      base: opt('#232136'),
      surface: opt('#2a273f'),
      overlay: opt('#393552'),

      muted: opt('#6e6a86'),
      subtle: opt('#908caa'),
      text: opt('#e0def4'),

      highlight: {
        low: opt('#2a283e'),
        medium: opt('#44415a'),
        high: opt('#56526e')
      },

      primary: opt('#c4a7e7'),
      error: opt('#eb6f92'),
      success: opt('#9ccfd8')
    },

    tokyoNight: {
      base: opt('#1A1B26'),
      surface: opt('#16161E'),
      overlay: opt('#24283B'),

      muted: opt('#565F89'),
      subtle: opt('#787C99'),
      text: opt('#A9B1D6'),

      highlight: {
        low: opt('#2A2E3E'),
        medium: opt('#3B4261'),
        high: opt('#444B6A')
      },

      primary: opt('#7AA2F7'),
      error: opt('#F7768E'),
      success: opt('#9ECE6A')
    },

    catpuccinMocha: {
      base: opt('#1E1E2E'),
      surface: opt('#181825'),
      overlay: opt('#11111B'),

      muted: opt('#7F849C'),
      subtle: opt('#A6ADC8'),
      text: opt('#CDD6F4'),

      highlight: {
        low: opt('#313244'),
        medium: opt('#45475A'),
        high: opt('#585B70')
      },

      primary: opt('#CBA6F7'),
      error: opt('#F38BA8'),
      success: opt('#A6E3A1')
    },

    catpuccinLatte: {
      base: opt('#EFF1F5'),
      surface: opt('#E6E9EF'),
      overlay: opt('#DCE0E8'),

      muted: opt('#8C8FA1'),
      subtle: opt('#6C6F85'),
      text: opt('#4C4F69'),

      highlight: {
        low: opt('#ACB0BE'),
        medium: opt('#BCC0CC'),
        high: opt('#CCD0DA')
      },

      primary: opt('#8839EF'),
      error: opt('#D20F39'),
      success: opt('#40A02B')
    },

    blur: opt(0),
    scheme: opt<Theme>('rosePine'),
    widget: { opacity: opt(94) },
    border: {
      width: opt(1),
      opacity: opt(96)
    },

    shadows: opt(true),
    padding: opt(6),
    spacing: opt(12),
    radius: opt(8)
  },

  font: {
    size: opt(10),
    name: opt('Dank Mono Nerd Font')
  },

  transition: opt(200),

  notifications: {
    position: opt<Array<'top' | 'bottom' | 'left' | 'right'>>(['top', 'right']),
    blacklist: opt(['Spotify']),
    width: opt(440)
  },

  hyprland: {
    gaps: opt(2.4),
    inactiveBorder: opt('#282828'),
    gapsWhenOnly: opt(false)
  },

  bar: {
    state: opt<'normal' | 'zen'>('normal'),
    position: opt<'top' | 'bottom'>('top'),
    corners: opt(50),
    transparent: opt(false),
    layout: {
      start: opt<Array<BarWidget>>(['expander']),
      center: opt<Array<BarWidget>>(['expander', 'screengroup']),
      end: opt<Array<BarWidget>>(['theme', 'wallpaper', 'date', 'indicators'])
    },

    date: {
      format: opt('%I:%M • %A, %m/%d'),
      action: opt(() => App.toggleWindow('datemenu'))
    }
  },

  workspaces: {
    workspaces: opt(10)
  }
})
