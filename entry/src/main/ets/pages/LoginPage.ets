import { CommonConstant } from '../common/constant/CommonConstant'
import { windowManager } from '../common/utils/windowManager'
import router from '@ohos.router';

@Entry
@Component
struct LoginPage {
  @State userName: string = '';
  @State password: string = '';

  aboutToAppear() {
    windowManager.settingStatusBarLight()
    windowManager.enableFullScreen()
  }

  onPageShow() {

  }

  build() {
    Stack() {
      Image($r('app.media.bg_login'))
      Column() {
        Row() {
          Image($r('app.media.ic_close_white_24dp'))
            .width('30vp')
            .height('30vp')
            .onClick(() => {
              router.back()
            })
          Text('找回密码')
            .fontColor(Color.White)
        }
        .justifyContent(FlexAlign.SpaceBetween)
        .width(CommonConstant.MATCH_PARENT)
        .padding({
          left: $r('app.float.size_15'),
          right: $r('app.float.size_15'),
          top: $r('app.float.size_25'),
        })

        Image($r('app.media.ic_logo_slogan'))
          .objectFit(ImageFit.Fill)
          .width('150vp')
          .height('50vp')
          .margin({ top: "50vp" })
          .align(Alignment.Top)

        Text($r('app.string.login_top_tips'))
          .fontColor($r("app.color.color_white"))
          .fontFamily('splashFont')
          .fontSize(CommonConstant.FONT_SIZE_14)
          .margin({ top: "15vp" })
          .textAlign(TextAlign.Center)

        Row() {
          Image($r('app.media.ic_person_white_18dp'))
            .width('20vp')
            .height('20vp')
            .margin({ left: $r('app.float.size_15') })
          TextInput({ placeholder: '请输入手机号/邮箱地址' })
            .width('250vp')
            .height($r('app.float.size_40'))
            .placeholderColor($r("app.color.color_white"))
            .placeholderFont({ size: CommonConstant.FONT_SIZE_12 })// .showPasswordIcon(true)
            .fontColor($r("app.color.color_white"))
            .fontSize(CommonConstant.FONT_SIZE_12)
            .backgroundColor(Color.Transparent)
            .padding({ left: 0 })
            .enabled(true)
            .onChange((value: string) => {
              this.userName = value;
            })
        }
        .margin({ top: $r('app.float.size_80') })

        Divider()
          .width('250vp')
          .height($r('app.float.size_1'))
          .color($r('app.color.color_888888'))
          .alignSelf(ItemAlign.Center)

        Row() {
          Image($r('app.media.ic_password_white_lock_18dp'))
            .width('20vp')
            .height('20vp')
            .margin({ left: $r('app.float.size_15') })
          TextInput({ placeholder: '请输入密码' })
            .width('250vp')
            .height($r('app.float.size_40'))
            .placeholderColor($r("app.color.color_white"))
            .placeholderFont({ size: CommonConstant.FONT_SIZE_12 })// .showPasswordIcon(true)
            .fontColor($r("app.color.color_white"))
            .fontSize(CommonConstant.FONT_SIZE_12)
            .backgroundColor(Color.Transparent)
            .padding({ left: 0 })
            .showPasswordIcon(true)
            .onChange((value: string) => {
              this.password = value;
            })
        }

        Divider()
          .width('250vp')
          .height($r('app.float.size_1'))
          .color($r('app.color.color_888888'))
          .alignSelf(ItemAlign.Center)

        Button('登录')
          .width('250vp')
          .height($r('app.float.size_35'))
          .margin({ top: $r('app.float.size_20') })
          .fontSize($r('app.float.size_10'))
          .fontWeight(500)
          .enabled(isLoginButtonClickable(this.userName, this.password))
          .fontColor(isLoginButtonClickable(this.userName, this.password)
            ? Color.White
            : $r('app.color.color_fff'))
          .backgroundColor(isLoginButtonClickable(this.userName, this.password)
            ? $r('app.color.login_btn_enabled')
            : $r('app.color.login_btn_normal'))
          .onClick(() => {

          })

        Row() {
          Text('用户注册')
            .fontColor($r("app.color.color_white"))
            .fontSize(CommonConstant.FONT_SIZE_12)
          Text('作者登录')
            .fontColor($r("app.color.color_white"))
            .fontSize(CommonConstant.FONT_SIZE_12)

        }
        .margin({ top: $r('app.float.size_20') })
        .justifyContent(FlexAlign.SpaceEvenly)
        .width('250vp')

        Blank()


        Row() {
          Image($r('app.media.ic_account_login_wechat'))
            .width($r('app.float.size_40'))
            .height($r('app.float.size_40'))
          Image($r('app.media.ic_account_login_weibo'))
            .width($r('app.float.size_40'))
            .height($r('app.float.size_40'))
          Image($r('app.media.ic_account_login_qq'))
            .width($r('app.float.size_40'))
            .height($r('app.float.size_40'))
        }
        .margin({ bottom: $r('app.float.size_50') })
        .width('350vp')
        .justifyContent(FlexAlign.SpaceEvenly)

        Row() {
          Text('登录或注册即同意开眼')
            .fontColor($r("app.color.color_403b47"))
            .fontSize(CommonConstant.FONT_SIZE_12)
          Text('用户服务协议')
            .fontColor($r("app.color.color_white"))
            .fontFamily('splashFont')
            .fontSize(CommonConstant.FONT_SIZE_14)
        }
        .margin({ bottom: $r('app.float.size_20') })
        .width('250vp')
        .justifyContent(FlexAlign.Center)

      }
      .height(CommonConstant.MATCH_PARENT)
    }
    .width("100%")
    .height("100%")
    .backgroundColor($r("app.color.color_white"))

  }
}

function isLoginButtonClickable(userName: string, password: string): boolean {
  return userName !== '' && password !== '';
}