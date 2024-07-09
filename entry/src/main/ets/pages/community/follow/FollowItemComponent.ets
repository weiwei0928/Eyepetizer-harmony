import { CommonConstant } from '../../../common/constant/CommonConstant';
import router from '@ohos.router';
import { RoutePath } from '../../../route/RoutePath';

@Component
export default struct FlowItemComponent {

  build() {
    Column(){
      Image($r('app.media.ic_avatar_gray_76dp'))
        .width($r('app.float.size_80'))
        .height($r('app.float.size_80'))
        .margin({ top: '50vp' })
        .onClick(() => {
          router.pushUrl({ url: RoutePath.LoginPage })
        })
      Text('点击登录后可关注主题和作者')
        .margin({ top: '20vp' })
        .fontColor($r('app.color.color_adadad'))

    }
    .width(CommonConstant.MATCH_PARENT)
  }
}

