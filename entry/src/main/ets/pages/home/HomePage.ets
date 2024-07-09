import router from '@ohos.router'
import { CommonConstant } from '../../common/constant/CommonConstant'
import { RoutePath } from '../../route/RoutePath'
import { DiscoveryPage } from './DiscoveryPage'
import { DailyPage } from './DailyPage'
import { RecommendPage } from './RecommendPage'

@Component
export struct HomePage {
  //默认定位到中间的tab
  private selectedIndex: number = 1

  build() {
    Stack({ alignContent: Alignment.TopEnd }) {
      Tabs({ index: this.selectedIndex, barPosition: BarPosition.Start }) {
        TabContent() {
          DiscoveryPage()
        }
        .tabBar({ text: "发现" })

        TabContent() {
          RecommendPage()
        }
        .tabBar({ text: "推荐" })

        TabContent() {
          DailyPage()
        }
        .tabBar({ text: "日报" })
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

    // .justifyContent(FlexAlign.Start)
    // .alignItems(VerticalAlign.Top)
  }
}