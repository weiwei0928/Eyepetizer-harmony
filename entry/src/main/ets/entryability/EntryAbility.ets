import UIAbility from '@ohos.app.ability.UIAbility';
import hilog from '@ohos.hilog';
import window from '@ohos.window';
import { AbilityConstant, Want } from '@kit.AbilityKit';

// import { ImageKnife } from '@ohos/imageknife'


export default class EntryAbility extends UIAbility {
  onCreate(want: Want, launchParam: AbilityConstant.LaunchParam): void {
    hilog.info(0x0000, 'testTag', '%{public}s', 'EntryAbility onCreate');
    hilog.info(0x0000, 'testTag', '%{public}s', 'want param:' + JSON.stringify(want) ?? '');
    hilog.info(0x0000, 'testTag', '%{public}s', 'launchParam:'+ JSON.stringify(launchParam) ?? '');  }

  onDestroy() {
    hilog.info(0x0000, 'testTag', '%{public}s', 'Ability onDestroy');
  }

  onWindowStageCreate(windowStage: window.WindowStage) {
    // Main window is created, set main page for this ability
    hilog.info(0x0000, 'testTag', '%{public}s', 'Ability onWindowStageCreate');

    // 1.获取应用主窗口。
    windowStage.getMainWindow((err, data) => {

      if (err.code) {
        console.error('Failed to obtain the main window. Cause: ' + JSON.stringify(err));
        return;
      }

      let windowClass = data;
      console.info('Succeeded in obtaining the main window. Data: ' + JSON.stringify(data));
      // 设置窗口的布局是否为全屏显示状态
      windowClass.setWindowLayoutFullScreen(true);
      // 获取导航条高度 参考API 9
      // 这个方法为返回的是PX像素，需要使用px2vp方法转换一下 参考API 9
      let navHeight: number = windowClass.getWindowAvoidArea(window.AvoidAreaType.TYPE_CUTOUT).topRect.height
      // 存储高度信息 参考API 9
      PersistentStorage.PersistProp('systemBarHeight', navHeight)

      // 实现沉浸式效果：设置导航栏、状态栏不显示。
      // let names = ["status"];
      // windowClass.setWindowSystemBarEnable(names, (err) => {
      //   if (err.code) {
      //     console.error('Failed to set the system bar to be visible. Cause:' + JSON.stringify(err));
      //     return;
      //   }
      //   console.info('Succeeded in setting the system bar to be visible.');
      // });
      // windowClass.setWindowLayoutFullScreen(true)

    })

    windowStage.loadContent('pages/SplashPage', (err, data) => {
      if (err.code) {
        hilog.error(0x0000, 'testTag', 'Failed to load the content. Cause: %{public}s', JSON.stringify(err) ?? '');
        return;
      }
      hilog.info(0x0000, 'testTag', 'Succeeded in loading the content. Data: %{public}s', JSON.stringify(data) ?? '');
    });
    // ImageKnife.with(this.context);

  }

  onWindowStageDestroy() {
    // Main window is destroyed, release UI related resources
    hilog.info(0x0000, 'testTag', '%{public}s', 'Ability onWindowStageDestroy');
  }

  onForeground() {
    // Ability has brought to foreground
    hilog.info(0x0000, 'testTag', '%{public}s', 'Ability onForeground');
  }

  onBackground() {
    // Ability has back to background
    hilog.info(0x0000, 'testTag', '%{public}s', 'Ability onBackground');
  }
}
