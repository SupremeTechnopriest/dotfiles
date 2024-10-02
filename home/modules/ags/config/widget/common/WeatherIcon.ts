import clsx from 'clsx'
import type { LabelProps } from '@/types/widgets/label'

type Icon = {
  description: string
  icon: string
}

const CodeMap: Record<string, { day: Icon; night: Icon }> = {
  '0': {
    day: {
      description: 'Sunny',
      icon: '\uF00D' // wi-day-sunny
    },
    night: {
      description: 'Clear',
      icon: '\uF02E' // wi-night-clear
    }
  },
  '1': {
    day: {
      description: 'Mostly Sunny',
      icon: '\uF00C' // wi-day-sunny-overcast
    },
    night: {
      description: 'Mostly Clear',
      icon: '\uF083' // wi-night-alt-partly-cloudy
    }
  },
  '2': {
    day: {
      description: 'Partly Cloudy',
      icon: '\uF002' // wi-day-cloudy
    },
    night: {
      description: 'Partly Cloudy',
      icon: '\uF086' // wi-night-alt-cloudy
    }
  },
  '3': {
    day: {
      description: 'Cloudy',
      icon: '\uF013' // wi-cloudy
    },
    night: {
      description: 'Cloudy',
      icon: '\uF031' // wi-night-cloudy
    }
  },
  '45': {
    day: {
      description: 'Foggy',
      icon: '\uF003' // wi-fog
    },
    night: {
      description: 'Foggy',
      icon: '\uF04A' // wi-night-fog
    }
  },
  '48': {
    day: {
      description: 'Rime Fog',
      icon: '\uF003' // wi-fog
    },
    night: {
      description: 'Rime Fog',
      icon: '\uF04A' // wi-night-fog
    }
  },
  '51': {
    day: {
      description: 'Light Drizzle',
      icon: '\uF00B' // wi-sprinkle
    },
    night: {
      description: 'Light Drizzle',
      icon: '\uF029' // wi-night-sprinkle
    }
  },
  '53': {
    day: {
      description: 'Drizzle',
      icon: '\uF00B' // wi-sprinkle
    },
    night: {
      description: 'Drizzle',
      icon: '\uF029' // wi-night-sprinkle
    }
  },
  '55': {
    day: {
      description: 'Heavy Drizzle',
      icon: '\uF017' // wi-rain-wind
    },
    night: {
      description: 'Heavy Drizzle',
      icon: '\uF087' // wi-night-alt-rain-wind
    }
  },
  '56': {
    day: {
      description: 'Light Freezing Drizzle',
      icon: '\uF0B2' // wi-day-sleet
    },
    night: {
      description: 'Light Freezing Drizzle',
      icon: '\uF0B4' // wi-night-alt-sleet
    }
  },
  '57': {
    day: {
      description: 'Freezing Drizzle',
      icon: '\uF0B5' // wi-sleet
    },
    night: {
      description: 'Freezing Drizzle',
      icon: '\uF0B5' // wi-sleet (no night variant)
    }
  },
  '61': {
    day: {
      description: 'Light Rain',
      icon: '\uF008' // wi-day-rain
    },
    night: {
      description: 'Light Rain',
      icon: '\uF036' // wi-night-alt-rain
    }
  },
  '63': {
    day: {
      description: 'Rain',
      icon: '\uF019' // wi-rain
    },
    night: {
      description: 'Rain',
      icon: '\uF037' // wi-night-rain
    }
  },
  '65': {
    day: {
      description: 'Heavy Rain',
      icon: '\uF017' // wi-rain-wind
    },
    night: {
      description: 'Heavy Rain',
      icon: '\uF087' // wi-night-alt-rain-wind
    }
  },
  '66': {
    day: {
      description: 'Light Freezing Rain',
      icon: '\uF017' // wi-rain-mix
    },
    night: {
      description: 'Light Freezing Rain',
      icon: '\uF089' // wi-night-alt-rain-mix
    }
  },
  '67': {
    day: {
      description: 'Freezing Rain',
      icon: '\uF017' // wi-rain-mix
    },
    night: {
      description: 'Freezing Rain',
      icon: '\uF089' // wi-night-alt-rain-mix
    }
  },
  '71': {
    day: {
      description: 'Light Snow',
      icon: '\uF00A' // wi-day-snow
    },
    night: {
      description: 'Light Snow',
      icon: '\uF02A' // wi-night-alt-snow
    }
  },
  '73': {
    day: {
      description: 'Snow',
      icon: '\uF01B' // wi-snow
    },
    night: {
      description: 'Snow',
      icon: '\uF038' // wi-night-snow
    }
  },
  '75': {
    day: {
      description: 'Heavy Snow',
      icon: '\uF064' // wi-snow-wind
    },
    night: {
      description: 'Heavy Snow',
      icon: '\uF067' // wi-night-alt-snow-wind
    }
  },
  '77': {
    day: {
      description: 'Snow Grains',
      icon: '\uF076' // wi-snowflake-cold
    },
    night: {
      description: 'Snow Grains',
      icon: '\uF076' // wi-snowflake-cold (no night variant)
    }
  },
  '80': {
    day: {
      description: 'Light Showers',
      icon: '\uF009' // wi-day-showers
    },
    night: {
      description: 'Light Showers',
      icon: '\uF037' // wi-night-alt-showers
    }
  },
  '81': {
    day: {
      description: 'Showers',
      icon: '\uF009' // wi-day-showers
    },
    night: {
      description: 'Showers',
      icon: '\uF037' // wi-night-alt-showers
    }
  },
  '82': {
    day: {
      description: 'Heavy Showers',
      icon: '\uF009' // wi-day-showers
    },
    night: {
      description: 'Heavy Showers',
      icon: '\uF037' // wi-night-alt-showers
    }
  },
  '85': {
    day: {
      description: 'Light Snow Showers',
      icon: '\uF00A' // wi-day-snow
    },
    night: {
      description: 'Light Snow Showers',
      icon: '\uF02A' // wi-night-alt-snow
    }
  },
  '86': {
    day: {
      description: 'Snow Showers',
      icon: '\uF06B' // wi-day-snow-thunderstorm
    },
    night: {
      description: 'Snow Showers',
      icon: '\uF06D' // wi-night-alt-snow-thunderstorm
    }
  },
  '95': {
    day: {
      description: 'Thunderstorm',
      icon: '\uF010' // wi-day-thunderstorm
    },
    night: {
      description: 'Thunderstorm',
      icon: '\uF03C' // wi-night-alt-thunderstorm
    }
  },
  '96': {
    day: {
      description: 'Light Thunderstorms With Hail',
      icon: '\uF068' // wi-day-sleet-storm
    },
    night: {
      description: 'Light Thunderstorms With Hail',
      icon: '\uF06D' // wi-night-alt-sleet-storm
    }
  },
  '99': {
    day: {
      description: 'Thunderstorm With Hail',
      icon: '\uF068' // wi-day-sleet-storm
    },
    night: {
      description: 'Thunderstorm With Hail',
      icon: '\uF06D' // wi-night-alt-sleet-storm
    }
  }
}

const IconMap: Record<string, string> = {
  na: '\uF07B'
}

interface WeatherIconProps {
  code: number
  day: boolean
}

export function getWeatherIcon(icon: WeatherIconProps | string) {
  if (typeof icon === 'object') {
    return CodeMap[icon.code.toString()][icon.day ? 'day' : 'night'].icon
  }
  return IconMap[icon]
}

export const WeatherIcon = (
  icon: WeatherIconProps | string,
  size: 'xxs' | 'xs' | 'sm' | 'md' | 'lg' | 'xl' = 'md',
  props: LabelProps = {}
) => {
  let label = icon as string
  if (typeof icon === 'object') {
    label = CodeMap[icon.code.toString()][icon.day ? 'day' : 'night'].icon
  } else {
    label = IconMap[icon]
  }

  return Widget.Label({
    ...props,
    className: clsx(`icon-weather text-${size}`, props.className),
    label
  })
}
