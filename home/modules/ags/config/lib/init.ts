import notifications from './notifications'

export const init = function init() {
  try {
    notifications()
  } catch (error) {
    logError(error)
  }
}
