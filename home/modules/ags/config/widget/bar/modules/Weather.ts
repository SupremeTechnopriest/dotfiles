import { options } from '@/options'
import { PanelButton } from '../PanelButton'

import { getWeatherIcon, WeatherIcon } from '@/widget/common/WeatherIcon'

import weather from '@/service/weather'

const CodeMap = {
  '0': {
    day: {
      description: 'Sunny',
      icon: 'sunny'
    },
    night: {
      description: 'Clear',
      icon: 'bedtime'
    }
  },
  '1': {
    day: {
      description: 'Mostly Sunny',
      icon: 'partly_cloudy_day'
    },
    night: {
      description: 'Mostly Clear',
      icon: 'nights_stay'
    }
  },
  '2': {
    day: {
      description: 'Partly Cloudy',
      icon: 'partly_cloudy_day'
    },
    night: {
      description: 'Partly Cloudy',
      icon: 'nights_stay'
    }
  },
  '3': {
    day: {
      description: 'Cloudy',
      icon: 'cloud'
    },
    night: {
      description: 'Cloudy',
      icon: 'cloud'
    }
  },
  '45': {
    day: {
      description: 'Foggy',
      icon: 'foggy'
    },
    night: {
      description: 'Foggy',
      icon: 'foggy'
    }
  },
  '48': {
    day: {
      description: 'Rime Fog',
      icon: 'mist'
    },
    night: {
      description: 'Rime Fog',
      icon: 'mist'
    }
  },
  '51': {
    day: {
      description: 'Light Drizzle',
      icon: 'rainy_light'
    },
    night: {
      description: 'Light Drizzle',
      icon: 'rainy_light'
    }
  },
  '53': {
    day: {
      description: 'Drizzle',
      icon: 'rainy_light'
    },
    night: {
      description: 'Drizzle',
      icon: 'rainy_light'
    }
  },
  '55': {
    day: {
      description: 'Heavy Drizzle',
      icon: 'rainy_heavy'
    },
    night: {
      description: 'Heavy Drizzle',
      icon: 'rainy_heavy'
    }
  },
  '56': {
    day: {
      description: 'Light Freezing Drizzle',
      icon: 'rainy_snow'
    },
    night: {
      description: 'Light Freezing Drizzle',
      icon: 'rainy_snow'
    }
  },
  '57': {
    day: {
      description: 'Freezing Drizzle',
      icon: 'rainy_snow'
    },
    night: {
      description: 'Freezing Drizzle',
      icon: 'rainy_snow'
    }
  },
  '61': {
    day: {
      description: 'Light Rain',
      icon: 'rainy_light'
    },
    night: {
      description: 'Light Rain',
      icon: 'rainy_light'
    }
  },
  '63': {
    day: {
      description: 'Rain',
      icon: 'rainy_light'
    },
    night: {
      description: 'Rain',
      icon: 'rainy_light'
    }
  },
  '65': {
    day: {
      description: 'Heavy Rain',
      icon: 'rainy_heavy'
    },
    night: {
      description: 'Heavy Rain',
      icon: 'rainy_heavy'
    }
  },
  '66': {
    day: {
      description: 'Light Freezing Rain',
      icon: 'http://openweathermap.org/img/wn/10d@2x.png'
    },
    night: {
      description: 'Light Freezing Rain',
      icon: 'http://openweathermap.org/img/wn/10n@2x.png'
    }
  },
  '67': {
    day: {
      description: 'Freezing Rain',
      icon: 'http://openweathermap.org/img/wn/10d@2x.png'
    },
    night: {
      description: 'Freezing Rain',
      icon: 'http://openweathermap.org/img/wn/10n@2x.png'
    }
  },
  '71': {
    day: {
      description: 'Light Snow',
      icon: 'http://openweathermap.org/img/wn/13d@2x.png'
    },
    night: {
      description: 'Light Snow',
      icon: 'http://openweathermap.org/img/wn/13n@2x.png'
    }
  },
  '73': {
    day: {
      description: 'Snow',
      icon: 'http://openweathermap.org/img/wn/13d@2x.png'
    },
    night: {
      description: 'Snow',
      icon: 'http://openweathermap.org/img/wn/13n@2x.png'
    }
  },
  '75': {
    day: {
      description: 'Heavy Snow',
      icon: 'http://openweathermap.org/img/wn/13d@2x.png'
    },
    night: {
      description: 'Heavy Snow',
      icon: 'http://openweathermap.org/img/wn/13n@2x.png'
    }
  },
  '77': {
    day: {
      description: 'Snow Grains',
      icon: 'http://openweathermap.org/img/wn/13d@2x.png'
    },
    night: {
      description: 'Snow Grains',
      icon: 'http://openweathermap.org/img/wn/13n@2x.png'
    }
  },
  '80': {
    day: {
      description: 'Light Showers',
      icon: 'http://openweathermap.org/img/wn/09d@2x.png'
    },
    night: {
      description: 'Light Showers',
      icon: 'http://openweathermap.org/img/wn/09n@2x.png'
    }
  },
  '81': {
    day: {
      description: 'Showers',
      icon: 'http://openweathermap.org/img/wn/09d@2x.png'
    },
    night: {
      description: 'Showers',
      icon: 'http://openweathermap.org/img/wn/09n@2x.png'
    }
  },
  '82': {
    day: {
      description: 'Heavy Showers',
      icon: 'http://openweathermap.org/img/wn/09d@2x.png'
    },
    night: {
      description: 'Heavy Showers',
      icon: 'http://openweathermap.org/img/wn/09n@2x.png'
    }
  },
  '85': {
    day: {
      description: 'Light Snow Showers',
      icon: 'http://openweathermap.org/img/wn/13d@2x.png'
    },
    night: {
      description: 'Light Snow Showers',
      icon: 'http://openweathermap.org/img/wn/13n@2x.png'
    }
  },
  '86': {
    day: {
      description: 'Snow Showers',
      icon: 'http://openweathermap.org/img/wn/13d@2x.png'
    },
    night: {
      description: 'Snow Showers',
      icon: 'http://openweathermap.org/img/wn/13n@2x.png'
    }
  },
  '95': {
    day: {
      description: 'Thunderstorm',
      icon: 'http://openweathermap.org/img/wn/11d@2x.png'
    },
    night: {
      description: 'Thunderstorm',
      icon: 'http://openweathermap.org/img/wn/11n@2x.png'
    }
  },
  '96': {
    day: {
      description: 'Light Thunderstorms With Hail',
      icon: 'http://openweathermap.org/img/wn/11d@2x.png'
    },
    night: {
      description: 'Light Thunderstorms With Hail',
      icon: 'http://openweathermap.org/img/wn/11n@2x.png'
    }
  },
  '99': {
    day: {
      description: 'Thunderstorm With Hail',
      icon: 'http://openweathermap.org/img/wn/11d@2x.png'
    },
    night: {
      description: 'Thunderstorm With Hail',
      icon: 'http://openweathermap.org/img/wn/11n@2x.png'
    }
  }
}

const Loading = () =>
  WeatherIcon('na', 'md', {
    className: 'text-error'
  })

const Content = () => {
  const city = Widget.Label({
    visible: options.weather.showCity.bind(),
    className: 'text-muted'
  })

  const temp = Widget.Label()

  const icon = WeatherIcon('na', 'md')

  return Widget.Box({
    className: 'space-x-4',
    children: [city, temp, icon]
  }).hook(
    weather,
    () => {
      city.label = weather.current.city
      temp.label = `${weather.current.temp}°${options.weather.units.temperature.value.substring(0, 1).toUpperCase()}`
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
