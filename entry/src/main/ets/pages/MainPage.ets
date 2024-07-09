import common from '@ohos.app.ability.common'
import curves from '@ohos.curves'
import emitter from '@ohos.events.emitter'
import { CommonConstant } from '../common/constant/CommonConstant'
import { TabItem } from '../common/model/TabItem'
import { LoadingDialog } from '../common/widget/LoadingDialog'
import { loadingEvent } from '../event/EventKeys'
import MainViewModel from '../viewmodel/MainViewModel'
import { CommunityPage } from './community/CommunityPage'
import { HomePage } from './home/HomePage'
import { MinePage } from './mine/MinePage'
import { NotificationPage } from './notification/NotificationPage'

@Entry
@Component
struct MainPage {
  @State message: string = 'Hello World'
  @State selectedIndex: number = 0
  @State homeIconScale: number = 1
  @State loadingShow: boolean = false
  @State loadingTips: string = "加载中..."
  private context = getContext(this) as common.UIAbilityContext;
  @StorageLink('systemBarHeight') systemBarHeight: number = 0;
  //全局的loading
  loadingDialogController: CustomDialogController = new CustomDialogController({
    builder: LoadingDialog({ loadingTips: this.loadingTips }),
    autoCancel: false,
    customStyle: true,
    gridCount: 2,
    cancel: () => {
      this.loadingShow = false
    }
  })

  pageTransition() {
    PageTransitionExit({ duration: 600 })
      .translate({ y: 300.0 })
      .opacity(0)
  }

  aboutToAppear() {
    emitter.on(loadingEvent, (event) => {
      if (event.data.showLoading == true && !this.loadingShow) {
        this.loadingShow = true
        this.loadingTips = event.data.loadingTips
        this.loadingDialogController.open()
      } else if (event.data.showLoading == false) {
        this.loadingDialogController.close()
        this.loadingShow = false
      }
    })
  }

  build() {
    Row() {
      Tabs({ index: this.selectedIndex, barPosition: BarPosition.End }) {
        TabContent() {
          HomePage()
        }
        .tabBar(this.TabBottom(MainViewModel.tabTitle[0], 0))

        TabContent() {
          //api9 tabs 嵌套waterFlow 一定会发生native崩溃 这样先解决
          if (this.selectedIndex === 1) {
            CommunityPage()
          }
        }
        .tabBar(this.TabBottom(MainViewModel.tabTitle[1], 1))

        TabContent() {
          NotificationPage()
        }
        .tabBar(this.TabBottom(MainViewModel.tabTitle[2], 2))

        TabContent() {
          MinePage()
        }
        .tabBar(this.TabBottom(MainViewModel.tabTitle[3], 3))
      }
      .scrollable(false)
      .barMode(BarMode.Fixed)
      .barHeight($r('app.float.size_44'))
      .barWidth(CommonConstant.MATCH_PARENT)
      .onChange((index: number) => {
        if (this.selectedIndex != index) {
          this.selectedIndex = index;
          // Tab缩放动画
          this.homeIconScale = 0
          animateTo(
            { duration: 400, curve: curves.springCurve(10, 1, 1, 1.2) },
            () => {
              this.homeIconScale = 1
            })
        }
        // this.homeTabSelected = index
      })

    }
    .height('100%')
    .padding({ top: px2vp(this.systemBarHeight) })
  }

  @Builder
  TabBottom(item: TabItem, index: number) {
    Column() {
      Image(this.selectedIndex == index ? item.imageActivated : item.imageOriginal)
        .height($r('app.float.size_18'))
        .width($r('app.float.size_18'))
        .margin({
          top: $r('app.float.size_6'),
          bottom: $r('app.float.size_4')
        })
        .scale({
          x: this.selectedIndex == index ? this.homeIconScale : 1,
          y: this.selectedIndex == index ? this.homeIconScale : 1,
          centerX: CommonConstant.FIFTY_PERCENT,
          centerY: CommonConstant.FIFTY_PERCENT,
        })
      Text(item.title)
        .width(CommonConstant.MATCH_PARENT)
        .height($r('app.float.size_13'))
        .fontSize($r('app.float.font_size_10fp'))
        .fontWeight(CommonConstant.TAB_ITEM_FONT_WEIGHT)
        .fontColor(this.selectedIndex === index ? $r('app.color.color_black') : Color.Gray)
        .textAlign(TextAlign.Center)
        .margin({
          bottom: $r('app.float.size_7')
        })
    }
    .justifyContent(FlexAlign.Center)
    .height(CommonConstant.MATCH_PARENT)
    .width(CommonConstant.MATCH_PARENT)
    .backgroundColor($r("app.color.color_f5f5f5"))
  }
}