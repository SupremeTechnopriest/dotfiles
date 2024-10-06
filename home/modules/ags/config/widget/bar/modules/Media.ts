import { options } from '@/options'
import { FaIcon } from '@/widget/common/FaIcon'
import { CircularProgress } from '@/widget/common/CircularProgress'
import { MarqueeText } from '@/widget/common/MarqueeText'
import { PanelButton } from '@/widget/bar/PanelButton'

import type DrawingArea from '@/types/widgets/drawingarea'

const Mpris = await Service.import('mpris')

const trimTrackTitle = (title?: string) => {
  if (!title) return ''
  return title
}

const hasMedia = () => {
  const mpris = Mpris.getPlayer('')
  if (mpris && mpris.track_title) return 'true'
  return 'false'
}

const TrackProgress = () => {
  const _updateProgress = (self: DrawingArea<any>) => {
    const mpris = Mpris.getPlayer('')
    if (!mpris) return
    self.css = `font-size: ${Math.max((mpris.position / mpris.length) * 100, 0)}px;`
  }

  return CircularProgress({
    className: 'bar-media-progress',
    vpack: 'center',
    hpack: 'center',
    setup: (self: any) => {
      self.hook(Mpris, _updateProgress).poll(3000, _updateProgress)
    }
  })
}

export const Media = () => {
  const noMedia = Widget.Label({
    className: 'text-muted text-bold',
    xalign: 0,
    label: 'No Media'
  })

  const playingState = Widget.Box({
    homogeneous: true,
    children: [
      Widget.Overlay({
        child: Widget.Box({
          vpack: 'center',
          className: 'bar-media-playstate',
          homogeneous: true,
          children: [
            FaIcon('play', 'sm', {
              vpack: 'center',
              justification: 'center',
              setup: (self) =>
                self.hook(Mpris, (label) => {
                  const mpris = Mpris.getPlayer('')
                  label.label = `${mpris?.play_back_status === 'Playing' ? 'pause' : 'play'}`
                })
            })
          ],
          setup: (self) =>
            self.hook(Mpris, (label) => {
              const mpris = Mpris.getPlayer('')
              if (!mpris) return
              label.toggleClassName(
                'bar-music-playstate-playing',
                mpris?.play_back_status === 'Playing'
              )
              label.toggleClassName(
                'bar-music-playstate',
                mpris?.play_back_status === 'Paused'
              )
            })
        }),
        overlays: [TrackProgress()]
      })
    ]
  })

  const trackTitle = MarqueeText({
    label: 'No media',
    speed: 0.8,
    className: 'bar-media-text',
    visible: false,
    setup: (self: DrawingArea<any>) =>
      self.hook(Mpris, () => {
        const mpris = Mpris.getPlayer('')
        if (mpris) {
          self.attribute.label = `${trimTrackTitle(mpris.track_title)}  •  ${mpris.track_artists.join(', ')}  •  `
        } else {
          self.attribute.label = 'No media'
        }
      })
  })

  const content = Widget.Box({
    className: 'bar-media space-x-4',
    hexpand: false,
    child: PanelButton({
      child: Widget.Box({
        children: [playingState, trackTitle]
      })
    })
  })

  return Widget.EventBox({
    // onScrollUp: (self) => switchToRelativeWorkspace(self, -1),
    // onScrollDown: (self) => switchToRelativeWorkspace(self, +1),
    child: Widget.Box({
      children: [
        Widget.EventBox({
          child: Widget.Stack({
            transition: 'slide_up_down',
            transitionDuration: options.transition.value,
            children: {
              true: content,
              false: noMedia
            }
          }).hook(Mpris, (self) => {
            self.shown = hasMedia()
          })
          // onPrimaryClick: () =>
          //   showMusicControls.setValue(!showMusicControls.value),
          // onSecondaryClick: () =>
          //   execAsync([
          //     'bash',
          //     '-c',
          //     'playerctl next || playerctl position `bc <<< "100 * $(playerctl metadata mpris:length) / 1000000 / 100"` &'
          //   ]).catch(print),
          // onMiddleClick: () => execAsync('playerctl play-pause').catch(print),
          // setup: (self) =>
          //   self.on('button-press-event', (self, event) => {
          //     if (event.get_button()[1] === 8)
          //       // Side button
          //       execAsync('playerctl previous').catch(print)
          //   })
        })
      ]
    })
  })
}
