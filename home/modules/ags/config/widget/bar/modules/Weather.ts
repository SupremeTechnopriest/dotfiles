import { options } from '@/options'
import { PanelButton } from '../PanelButton'

import { getWeatherIcon, WeatherIcon } from '@/widget/common/WeatherIcon'

import weather from '@/service/weather'

const Loading = () =>
  WeatherIcon('na', 'md', {
    className: 'text-error',
    xalign: 1
  })

const Content = () => {
  const city = Widget.Label({
    visible: options.weather.showCity.bind(),
    className: 'text-muted'
  })

  const temp = Widget.Label()

  const icon = WeatherIcon('na', 'sm')

  return Widget.Box({
    className: 'space-x-4',
    children: [city, temp, icon]
  }).hook(
    weather,
    () => {
      city.label = weather.current.city
      temp.label = `${weather.current.feelsLike}°${options.weather.units.temperature.value.substring(0, 1).toUpperCase()}`
      icon.label = getWeatherIcon({
        code: weather.current.weatherCode,
        day: weather.current.isDay
      })
    },
    'changed'
  )
}

export const Weather = () =>
  PanelButton({
    flat: true,
    child: Widget.Box({
      child: Widget.Stack({
        transition: 'slide_up_down',
        transitionDuration: options.transition.value,
        children: {
          true: Content(),
          false: Loading()
        } as Record<string, any>,
        shown: weather
          .bind('current')
          .as((current) => String(current.city !== 'Unknown'))
      })
    })
  })
