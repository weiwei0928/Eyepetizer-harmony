import { AxiosError, AxiosRequestHeaders, AxiosResponse } from '@ohos/axios';
import { hideLoadingDialog, showLoadingDialog } from '../common/utils/DialogUtil';
import { Router } from '../route/Router';
import { RoutePath } from '../route/RoutePath';
import showToast from '../common/utils/ToastUtil'
import AxiosHttpRequest, { errorHandler, HttpRequestConfig } from './AxiosHttpRequest'
import deviceInfo from '@ohos.deviceInfo';
import display from '@ohos.display';
import { logDebug, loge } from '../common/utils/LogUtils';
import { SPUtil } from '../common/utils/SPUtil';
import { PrefKey } from '../common/constant/PrefKey';


/**
 * axios请求客户端创建
 */
const axiosClient = new AxiosHttpRequest({
  baseURL: "https://www.baidu.com/",
  timeout: 10 * 1000,
  checkResultCode: false,
  headers: {
    'Content-Type': 'application/json',
  } as AxiosRequestHeaders,
  params: {
    "deviceModel": deviceInfo.deviceType,
    "udid": deviceInfo.udid,
    "size": display.getDefaultDisplaySync().width + "x" + display.getDefaultDisplaySync().height,
    "system_version_code": deviceInfo.sdkApiVersion,
    "first_channel": deviceInfo.manufacture,
    "last_channel": deviceInfo.brand,
  },
  interceptorHooks: {
    requestInterceptor: async (config) => {
      // 在发送请求之前做一些处理，例如打印请求信息
      axiosClient.config.showLoading = config.showLoading
      if (config.showLoading) {
        showLoadingDialog()
      }
      if (config.checkLoginState) {
        let hasLogin = await SPUtil.get(PrefKey.USER_LOGIN, false)
        // logDebug('网络请求Request 登录状态校验>>>', `${hasLogin.toString()}`);
        if (hasLogin) {
          return config
        } else {
          if (config.needJumpToLogin) {
            Router.push(RoutePath.LoginPage)
          }
          throw new Error("请登录")
        }
      }
      return config;
    },
    requestInterceptorCatch: (err) => {
      loge("网络请求RequestError", err?.toString()??"")
      if (axiosClient.config.showLoading) {
        hideLoadingDialog()
      }
      return err;
    },
    responseInterceptor: (response: AxiosResponse) => {
      //优先执行自己的请求响应拦截器，在执行通用请求request的
      if (axiosClient.config.showLoading) {
        hideLoadingDialog()
      }
      logDebug('网络请求Response:', `${response.config.url}`);
      logDebug(response.data, '网络请求响应Response')
      if (response.status === 200) {
        // const checkResultCode = response.config.checkResultCode
        let config = response.config as HttpRequestConfig
        const checkResultCode = config.checkResultCode
        if (checkResultCode && response.data.errorCode != 0) {
          showToast(response.data.errorMsg)
          return Promise.reject(response)
        }
        return Promise.resolve(response.data);
      } else {
        return Promise.reject(response);
      }
    },
    responseInterceptorCatch: (error) => {
      if (axiosClient.config.showLoading) {
        hideLoadingDialog()
      }
      loge("网络请求响应异常", error?.toString()??"")
      errorHandler(error);
      return Promise.reject(error);
    },
  }
});

export default axiosClient;