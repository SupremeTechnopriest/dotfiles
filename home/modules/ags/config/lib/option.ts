import { Variable } from 'resource:///com/github/Aylur/ags/variable.js'

type OptProps = {
  persistent?: boolean
}

export class Opt<T = unknown> extends Variable<T> {
  static {
    Service.register(this)
  }

  public id = ''
  private initial: T
  private persistent: boolean

  constructor(initial: T, { persistent = false }: OptProps = {}) {
    super(initial)
    this.initial = initial
    this.persistent = persistent
  }

  toString() {
    return `${this.value}`
  }

  toJSON() {
    return `opt:${this.value}`
  }

  getValue(): T {
    return super.getValue()
  }

  init(cacheFile: string) {
    const cacheV = JSON.parse(Utils.readFile(cacheFile) || '{}')[this.id]
    if (cacheV !== undefined) this.value = cacheV

    this.connect('changed', () => {
      const cache = JSON.parse(Utils.readFile(cacheFile) || '{}')
      cache[this.id] = this.value
      Utils.writeFileSync(JSON.stringify(cache, null, 2), cacheFile)
    })
  }

  reset(): string | undefined {
    if (this.persistent) return

    if (JSON.stringify(this.value) !== JSON.stringify(this.initial)) {
      this.value = this.initial
      return this.id
    }
  }
}

export const opt = <T>(initial: T, opts?: OptProps): Opt<T> => {
  return new Opt<T>(initial, opts)
}

function getOptions(object: object, path = ''): Opt[] {
  return Object.keys(object).flatMap((key) => {
    const obj: Opt = (object as Record<string, Opt>)[key]
    const id = path ? `${path}.${key}` : key

    if (obj instanceof Variable) {
      obj.id = id
      return obj
    }

    if (typeof obj === 'object' && obj !== null) return getOptions(obj, id)

    return []
  })
}

export function getOption<T extends object>(obj: T, path: string): any {
  const keys = path.split('.')

  let acc: any = obj
  for (const key of keys) {
    if (acc && typeof acc === 'object' && key in acc) {
      acc = (acc as Record<string, any>)[key]
    } else {
      throw new Error(`Path "${path}" does not exist in the object.`)
    }
  }

  if (!(acc instanceof Variable)) {
    throw new Error(`"${path}" does not result in an Option.`)
  }

  return (acc as Variable<unknown>).value
}

export function mkOptions<T extends object>(cacheFile: string, object: T) {
  const opts = getOptions(object)

  for (const opt of opts) opt.init(cacheFile)

  Utils.ensureDirectory(cacheFile.split('/').slice(0, -1).join('/'))

  const configFile = `${TMP}/config.json`

  const values = opts.reduce(
    (obj, opt) => ({ ...obj, [opt.id]: opt.value }),
    {} as Record<string, any>
  )

  Utils.writeFileSync(JSON.stringify(values, null, 2), configFile)
  Utils.monitorFile(configFile, () => {
    const cache = JSON.parse(Utils.readFile(configFile) || '{}')
    for (const opt of opts) {
      if (JSON.stringify(cache[opt.id]) !== JSON.stringify(opt.value)) {
        opt.value = cache[opt.id]
      }
    }
  })

  function sleep(ms = 0) {
    return new Promise<void>((resolve) => setTimeout(resolve, ms))
  }

  async function reset(): Promise<string[]> {
    const resetIds: string[] = []

    for (const opt of opts) {
      const id = opt.reset()
      if (id) {
        resetIds.push(id)
        await sleep(50)
      }
    }
    return resetIds
  }

  return Object.assign(object, {
    configFile,
    array: () => getOptions(object),
    async reset() {
      return (await reset()).join('\n')
    },
    handler(deps: string[], callback: () => void) {
      for (const opt of opts) {
        if (deps.some((i) => opt.id.startsWith(i))) {
          opt.connect('changed', callback)
        }
      }
    }
  })
}
