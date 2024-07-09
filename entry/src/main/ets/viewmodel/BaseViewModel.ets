

export type ResultCallback<T> = (result: T) => void

/**
 * BaseViewModel
 */
export class BaseViewModel {
  httpRequest<T>(requestPromise: Promise<T>): Promise<T> {
    return new Promise<T>((resolve, reject) => {
      requestPromise.then((res) => {
        resolve(res)
      }).catch((error) => {
        reject(error)
      })
    });
  }
}