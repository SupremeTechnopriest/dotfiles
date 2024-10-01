import GLib from 'gi://GLib'
import { options } from '@/options'
import { icons } from '@/lib/icons'

const interval = options.system.fetchInterval.value
const tempPath = options.system.temperaturePath.value

export const clock = Variable(GLib.DateTime.new_now_local(), {
  poll: [1000, () => GLib.DateTime.new_now_local()]
})

export const uptime = Variable('Unknown', {
  poll: [
    60_000,
    'cat /proc/uptime',
    (out) => {
      const uptimeRegex = /up\s+((\d+)\s+days?,\s+)?((\d+):(\d+)),/
      const matches = uptimeRegex.exec(out)

      if (matches) {
        const days = matches[2] ? parseInt(matches[2]) : 0
        const hours = matches[4] ? parseInt(matches[4]) : 0
        const minutes = matches[5] ? parseInt(matches[5]) : 0

        let formattedUptime = ''

        if (days > 0) {
          formattedUptime += `${days} d `
        }
        if (hours > 0) {
          formattedUptime += `${hours} h `
        }
        formattedUptime += `${minutes} m`

        return formattedUptime
      }

      return 'Unknown'
    }
  ]
})

const divide = ([total, free]: string[]) =>
  Number.parseInt(free) / Number.parseInt(total)

export const cpu = Variable(0, {
  poll: [
    interval,
    'top -b -n 1',
    (out) =>
      100 -
      Number.parseInt(
        out
          .split('\n')
          .find((line) => line.includes('Cpu(s)'))
          ?.split(/,\s+/)
          .find((segment) => segment.includes('id'))
          ?.split(/\s/)[0]
          .replace(',', '.') || '0'
      )
  ]
})

export const ram = Variable(0, {
  poll: [
    interval,
    'free',
    (out) =>
      divide(
        out
          .split('\n')
          .find((line) => line.includes('Mem:'))
          ?.split(/\s+/)
          .splice(1, 2) || ['1', '1']
      ) * 100
  ]
})

export const temperature = Variable(0, {
  poll: [interval, `cat ${tempPath}`, (out) => Number.parseInt(out) / 1000]
})

export const temperatureIcon = Variable('temperature-empty', {
  poll: [
    interval,
    `cat ${tempPath}`,
    (out) => {
      const temp = Number.parseInt(out) / 1000
      const max = options.system.maxTemperature.value

      if (temp <= max * 0.25) return 'temperature-empty'
      if (temp <= max * 0.5) return 'temperature-quarter'
      if (temp <= max * 0.75) return 'temperature-half'
      if (temp <= max) return 'temperature-three-quarter'
      return 'temperature-full'
    }
  ]
})

export const distro = {
  id: GLib.get_os_info('ID'),
  logo: GLib.get_os_info('LOGO')
}
