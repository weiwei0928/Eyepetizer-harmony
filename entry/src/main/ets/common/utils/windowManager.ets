import window from '@ohos.window';

export class windowManager {
  //开启沉浸式全屏模式
  static async enableFullScreen() {
    const win = await window.getLastWindow(getContext()) //使用window这个API的getLastWindow方法获取页面
    win.setWindowLayoutFullScreen(true) //使用setWindowLayoutFullScreen设置true开启沉浸式模式
    const area = await win.getWindowAvoidArea(window.AvoidAreaType.TYPE_SYSTEM) //使用getWindowAvoidArea方法获取到安全区域的高度
    let vpHeight = px2vp(area.topRect.height)
    AppStorage.setOrCreate('topHeight', vpHeight) //将高度转成vp，存到AppStorage中方便其它页面获取高度
  }

  //关闭沉浸式模式
  static async disableFullScreen() {
    const win = await window.getLastWindow(getContext()) //使用window这个API的getLastWindow方法获取页面
    win.setWindowLayoutFullScreen(false) //使用setWindowLayoutFullScreen设置false关闭沉浸式模式
    AppStorage.setOrCreate('topHeight', 0) //将高度重置为零
  }

  static async settingStatusBarLight() {
    const win = await window.getLastWindow(getContext())
    win.setWindowSystemBarProperties({ statusBarContentColor: '#FFFFFF' }) //设置安全区字体颜色为白色
  }

  static async settingStatusBarDark() {
    const win = await window.getLastWindow(getContext())
    win.setWindowSystemBarProperties({ statusBarContentColor: '#000000' }) //设置安全区字体颜色为白色
  }
}