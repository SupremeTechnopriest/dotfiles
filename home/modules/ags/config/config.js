import GLib from 'gi://GLib'

const main = '/tmp/asztal/main.js'
const entry = `${App.configDir}/main.ts`

try {
  await Utils.execAsync([
    'bun',
    'build',
    entry,
    '--outfile',
    main,
    '--external',
    'resource://*',
    '--external',
    'gi://*',
    '--external',
    'file://*'
  ])

  await import(`file://${main}`)
} catch (err) {
  console.error(err)
  App.quit()
}

export {}
