import type { Widget } from '@/types/widgets/widget'

class IndicatorService extends Service {
  static {
    Service.register(this, { popup: ['double'] })
  }

  _delay = 1500
  _count = 0

  popup(value: number) {
    this.emit('popup', value)
    this._count++
    Utils.timeout(this._delay, () => {
      this._count--

      if (this._count === 0) this.emit('popup', -1)
    })
  }

  connectWidget(widget: Widget<any>, callback: () => void) {
    widget.connect('popup', callback)
  }
}

// the singleton instance
const service = new IndicatorService()

// make it global for easy use with cli
globalThis['indicator'] = service

// export to use in other modules
export default service
