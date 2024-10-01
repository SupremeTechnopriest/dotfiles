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
    return JSON.parse(text)
  }

  async update() {
    this.#current = await this.fetch()
    this.changed('current')
  }

  constructor() {
    super()

    this.update().catch(console.error)
    Utils.interval(fetchInterval.value, () => {
      this.update().catch(console.error)
    })
  }
}

export default new Weather()
