import { CommonConstant } from '../../common/constant/CommonConstant'
import { RoutePath } from '../../route/RoutePath'
import router from '@ohos.router'

@Component
export struct NotificationLoginTips {
  build() {
    Column(){
      Image($r('app.media.ic_login_tips_gray_100dp'))
        .width($r('app.float.size_100'))
        .height($r('app.float.size_100'))
        .margin({top: $r('app.float.size_80') })
      Text('别错过重要的信息')
        .fontSize($r('app.float.font_size_16fp'))
        .textAlign(TextAlign.Center)
        .margin({top: $r('app.float.size_20')})
        .fontWeight(FontWeight.Bold)
      Text('登录后即可查看评论回复、点赞及关注等通知信息')
        .fontSize($r('app.float.font_size_14fp'))
        .textAlign(TextAlign.Center)
        .margin({top: $r('app.float.size_8')})

      Button('登录')
        .fontSize($r('app.float.font_size_16fp'))
        .margin({top: $r('app.float.size_8')})
        .width($r('app.float.size_200'))
        .margin({top: $r('app.float.size_20')})
        .onClick(() => {
          router.pushUrl({ url: RoutePath.LoginPage })
        })


    }
    .width(CommonConstant.MATCH_PARENT)
    .height(CommonConstant.MATCH_PARENT)
  }
}