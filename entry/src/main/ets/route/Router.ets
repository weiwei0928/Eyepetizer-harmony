import router from '@ohos.router'
import { CommonType } from '@ohos/pulltorefresh/src/main/ets/components/PullToRefresh/TypeAlias';
import { loge, logInfo } from '../common/utils/LogUtils';

export class Router {
  static push(url: string, params?: object) {
    router.pushUrl({ url: url, params: params }, router.RouterMode.Standard, (err) => {
      if (err) {
        loge(`pushUrl failed, code is ${err.code}, message is ${err.message}`);
        return;
      }
      logInfo('pushUrl success' + url);
    })
  }
}