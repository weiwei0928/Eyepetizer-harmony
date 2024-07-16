import { CommonType } from '@ohos/pulltorefresh/src/main/ets/components/PullToRefresh/TypeAlias';


export type ResultCallback<T> = (result: T) => void

/**
 * BaseViewModel
 */
export class BaseViewModel {
  httpRequest<T>(requestPromise: Promise<T>): Promise<T> {
    return new Promise<T>((resolve, reject) => {
      requestPromise.then((res) => {
        resolve(res)
      }).catch((error:CommonType) => {
        reject(error)
      })
    });
  }
}