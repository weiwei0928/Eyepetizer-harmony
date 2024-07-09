import { CommonConstant } from '../../common/constant/CommonConstant'
import router from '@ohos.router'
import { RoutePath } from '../../route/RoutePath'
import { Router } from '../../route/Router'
import common from '@ohos.app.ability.common'


@Entry
@Component
export struct MinePage {
  private context = getContext(this) as common.UIAbilityContext;

  build() {
    Column() {

      Image($r('app.media.ic_more_black_19dp'))
        .width($r('app.float.size_19'))
        .height($r('app.float.size_19'))
        .alignSelf(ItemAlign.End)
        .margin({ top: $r('app.float.size_8'), right: $r('app.float.size_8') })

      Image($r('app.media.ic_logo_black_76dp'))
        .width($r('app.float.size_80'))
        .height($r('app.float.size_80'))
        .margin({ top: $r('app.float.size_40') })
      Text($r('app.string.guide_login_tips'))
        .fontSize($r('app.float.font_size_16fp'))
        .textAlign(TextAlign.Center)
        .margin({ top: $r('app.float.size_10') })

      Row() {
        Row() {
          Image($r('app.media.ic_favorite_border_black_20dp'))
            .width($r('app.float.size_20'))
            .height($r('app.float.size_20'))
            .margin({ right: $r('app.float.size_8') })
          Text('收藏')
            .fontSize($r('app.float.font_size_14fp'))
        }

        Row() {
          Image($r('app.media.ic_cache_black_16dp'))
            .width($r('app.float.size_20'))
            .height($r('app.float.size_20'))
            .margin({ right: $r('app.float.size_8') })
          Text('缓存')
            .fontSize($r('app.float.font_size_14fp'))
        }
      }
      .width(CommonConstant.MATCH_PARENT)
      .justifyContent(FlexAlign.SpaceEvenly)
      .margin({ top: $r('app.float.size_12') })


      this.mineItem('我的关注')
      this.mineItem('观看记录')
      this.mineItem('通知开关')
      this.mineItem('我的徽章')
      this.mineItem('意见反馈', () => {
        Router.push(RoutePath.WebPage, { path: CommonConstant.URL.GITHUB_URL })
      })
      this.mineItem('我要投稿', () => {
        Router.push(RoutePath.WebPage, { path: CommonConstant.URL.AUTHOR_OPEN })
      })
      Text('version 1.0.0')
        .fontColor($r('app.color.color_888888'))
        .fontSize($r('app.float.font_size_14fp'))
        .margin({ top: $r('app.float.size_40') })
        .onClick(() => {
          Router.push(RoutePath.WebPage, { path: CommonConstant.URL.GITHUB_URL })
        })


    }
    .width(CommonConstant.MATCH_PARENT)
    .height(CommonConstant.MATCH_PARENT)
  }

  @Builder
  mineItem(text: Resource | string, event: (event?: ClickEvent) => void = () => {
    router.pushUrl({ url: RoutePath.LoginPage })
  }) {
    Text(text)
      .fontSize($r('app.float.font_size_16fp'))
      .margin({ top: $r('app.float.size_40') })
      .fontColor(Color.Black)
      .onClick(event)
      .fontStyle(FontStyle.Italic)
  }
}