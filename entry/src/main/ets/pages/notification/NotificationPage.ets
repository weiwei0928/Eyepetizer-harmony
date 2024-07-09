import router from '@ohos.router'
import { CommonConstant } from '../../common/constant/CommonConstant'
import { RoutePath } from '../../route/RoutePath'
import { InboxPage } from './InboxPage'
import { InteractionPage } from './InteractionPage'
import { PushPage } from './PushPage'

@Component
export struct NotificationPage {
  private selectedIndex: number = 0

  build() {
    Stack({ alignContent: Alignment.TopEnd }) {
      Tabs({ index: this.selectedIndex, barPosition: BarPosition.Start }) {
        TabContent() {
          PushPage()
        }
        .tabBar({ text: "推送" })

        TabContent() {
          InteractionPage()
        }
        .tabBar({ text: "互动" })

        TabContent() {
          InboxPage()
        }
        .tabBar({ text: "私信" })
      }
      .scrollable(true)
      .barMode(BarMode.Fixed)
      .barHeight($r('app.float.size_50'))
      .barWidth(CommonConstant.SIXTY_PERCENT)


      Image($r('app.media.ic_search_black_17dp'))
        .height($r('app.float.size_18'))
        .width($r('app.float.size_18'))
        .margin({ left: 0, right: 15, top: 15 })
        .onClick(() => {
          router.pushUrl({ url: RoutePath.SearchPage })
        })
    }
    .height('100%')
  }
}

