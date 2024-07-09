import router from '@ohos.router'
import { CommonConstant } from '../common/constant/CommonConstant'
import { windowManager } from '../common/utils/windowManager'
import { RoutePath } from '../route/RoutePath'

@Entry
@Component
struct SplashPage {
  @State scale1: number = 1.0
  aboutToAppear() {
    windowManager.settingStatusBarLight()
    windowManager.enableFullScreen()
    // api9好像设置字体有问题 官方论坛说后续修复
    // font.registerFont({
    //   familyName: 'splashFont',
    //   familySrc: '/font/DIN-Condensed-Bold.ttf'
    // })
  }
  onPageShow() {
    this.scale1 = 1.2
    setTimeout(() => {
      router.replaceUrl({ url: RoutePath.MainPage })
    }, 3000)
  }

  build() {
    Stack() {
      Image($r('app.media.bg_splash'))
        .scale({ x: this.scale1, y: this.scale1 })
        .animation({
          duration: 3000,
          curve: Curve.Friction,
          delay: 0,
          iterations: 1, // 设置-1表示动画无限循环
          playMode: PlayMode.Alternate
        })

      Column(){
        Image($r('app.media.ic_logo_slogan'))
          .objectFit(ImageFit.Fill)
          .width('150vp')
          .height('50vp')
          .margin({ top: "200vp" })
          .align(Alignment.Top)
        Blank()


        Text('Daily appetizersfor your eyes. Bon eyepétit.')
          .fontColor($r("app.color.color_white"))
          .fontFamily('splashFont')
          .fontSize(CommonConstant.FONT_SIZE_14)
          .margin({bottom: "10vp"})

          Text('每日精选视频推介，让你大开眼界。')
          .fontColor($r("app.color.color_white"))
          .fontFamily('splashFont')
          .fontSize(CommonConstant.FONT_SIZE_14)
          .margin({bottom: "80vp"})
      }
      .height(CommonConstant.MATCH_PARENT)

    }
    .width("100%")
    .height("100%")
    .backgroundColor($r("app.color.color_white"))
    // .alignContent(Alignment.Center)
  }
}