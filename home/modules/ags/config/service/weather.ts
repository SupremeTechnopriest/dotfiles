import { bash } from '@/lib/utils'
import { options } from '@/options'

const { fetchInterval, units } = options.weather

interface WeatherData {
  city: string
  temp: number
  feelsLike: number
  weatherCode: number
  isDay: boolean
  windSpeed: number
  windDirection: number
}

class Weather extends Service {
  static {
    Service.register(
      this,
      {},
      {
        current: ['jsobject']
      }
    )
  }

  #current: WeatherData = {
    city: 'Unknown',
    temp: 0,
    feelsLike: 0,
    weatherCode: 0,
    isDay: true,
    windSpeed: 0,
    windDirection: 0
  }
  get current() {
    return this.#current
  }

  async fetch() {
    const params = [
      `temperature-unit=${units.temperature.value}`,
      `wind-speed-unit=${units.wind.value}`,
      `precipitation-unit=${units.precipitation.value}`
    ].join('&')

    const url = `https://weather.technopriest.dev?${params}`
    const text = await bash`curl "${url}"`
    const json = JSON.parse(text)

    if (json.longitude && json.latitude) {
      const metrics = [
        'temperature_2m',
        'apparent_temperature',
        'is_day',
        'weather_code',
        'wind_speed_10m',
        'wind_direction_10m'
      ]

      const params = [
        `latitude=${json.latitude}`,
        `longitude=${json.longitude}`,
        `current=${metrics.join(',')}`,
        `temperature_unit=${units.temperature.value}`,
        `wind_speed_unit=${units.wind.value}`,
        `precipitation_unit=${units.precipitation.value}`
      ].join('&')

      const url = `https://api.open-meteo.com/v1/forecast?${params}`
      const text = await bash`curl "${url}"`
      const { current } = JSON.parse(text)

      return {
        city: json.city,
        temp: current.temperature_2m,
        feelsLike: current.apparent_temperature,
        weatherCode: current.weather_code,
        isDay: Boolean(current.is_day),
        windSpeed: current.wind_speed_10m,
        windDirection: current.wind_direction_10m
      }
    }
    return json
  }

  async update() {
    this.#current = await this.fetch()
    this.changed('current')
  }

  constructor() {
    super()

    Utils.interval(fetchInterval.value, () => {
      this.update().catch(console.error)
    })
  }
}

export default new Weather()
