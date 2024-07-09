import { CommonConstant, ViewStateConstant } from '../../common/constant/CommonConstant'
import { logDebug, logJson } from '../../common/utils/LogUtils'
import { EyepetizerApi } from '../../http/EyepetizerApi'
import { ItemList } from '../../model/HomeModel'
import discoveryViewModel from '../../viewmodel/home/DiscoveryViewModel'
import { HomeItem } from './HomeItem'

@Component
export struct DiscoveryPage {
  private url: string = EyepetizerApi.HOME_DISCOVERY
  private nextPageUrl?: string = null
  @State isRefreshing: boolean = false
  @State datas: ItemList[] = []
  @State isTheEnd: boolean = false
  @State viewState: string = ViewStateConstant.VIEW_STATE_LOADING

  aboutToAppear() {
    this.nextPageUrl = this.url
    this.getData()
  }

  getData() {
    if (this.nextPageUrl != null) {
      discoveryViewModel.getDiscoveryData((result) => {
        this.nextPageUrl = result.nextPageUrl
        this.datas = result.itemList
        logJson(this.datas, 'DiscoveryPage')
        this.isRefreshing = false
      })
    } else {
      this.isTheEnd = true
    }
  }

  onPageShow() {
    logDebug('DiscoveryPage', 'onPageShow')
  }

  build() {
    Refresh({ refreshing: $$this.isRefreshing, offset: 100, friction: 100 }) {
      List({ space: 0, initialIndex: 0 }) {
        ForEach(this.datas, (item: ItemList, index: number) => {
          ListItem() {
            HomeItem({ item: item })
          }
        })
        ListItem() {
          if (this.isTheEnd) {
            Column() {
              Text("- The End -")
                .fontColor("#4d000000")
                .fontSize("14fp")
                .width(CommonConstant.MATCH_PARENT)
                .padding("8vp")
                .textAlign(TextAlign.Center)
            }
            .height("60vp")
          }
        }
      }
      .width(CommonConstant.MATCH_PARENT)
      .height(CommonConstant.MATCH_PARENT)
      .listDirection(Axis.Vertical)
      .divider({
        strokeWidth: 0,
        color: Color.Transparent,
        startMargin: 0,
        endMargin: 0
      })
      .onReachEnd(() => {
        this.getData()
      })
    }.onRefreshing(() => {
      this.nextPageUrl = this.url
      this.getData()
    })
  }
}

@Preview
@Component
struct BPreview {
  build() {
    Column() {
      Text("- The End -")
        .fontColor("#4d000000")
        .fontSize("14fp")
        .width(CommonConstant.MATCH_PARENT)
        .padding("8vp")
        .textAlign(TextAlign.Center)
    }
    .height("160vp")

    // .width(CommonConstant.MATCH_PARENT)
  }
}
