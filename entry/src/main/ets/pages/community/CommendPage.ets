import { CommonConstant } from '../../common/constant/CommonConstant';
import { EyepetizerApi } from '../../http/EyepetizerApi';
import { ItemList } from '../../model/CommunityRecommendModel';
import { WaterFlowDataSource } from '../../model/WaterFlowDataSource';
import recommendViewModel from '../../viewmodel/home/RecommendViewModel';
import FlowItemComponent from './FlowItemComponent';


@Component
export struct CommendPage {
  private scroller: Scroller = new Scroller();
  private url: string = EyepetizerApi.COMMUNITY_RECOMMEND_URL
  private nextPageUrl?: string = null
  @State isRefreshing: boolean = false
  @State data: ItemList[] = []
  @State waterFlowData: ItemList[] = []
  @State datasource: WaterFlowDataSource = new WaterFlowDataSource();

  aboutToAppear() {
    this.nextPageUrl = this.url
    this.getData(false)
  }

  getData(onRefresh: boolean) {
    if (onRefresh) {
      this.nextPageUrl = this.url
    }
    return recommendViewModel.getRecommendData(this.nextPageUrl, (result) => {
      this.nextPageUrl = result.nextPageUrl
      if (onRefresh) {
        this.data = result.itemList
      } else {
        this.data = [...this.data, ...result.itemList]
      }
      this.waterFlowData = this.data.filter(itemList => itemList.type === "communityColumnsCard");
      this.datasource.setDataArray(this.data.filter(itemList => itemList.type === "communityColumnsCard"));
      this.isRefreshing = false
    })
  }

  build() {
    Refresh({ refreshing: $$this.isRefreshing, offset: 100, friction: 100 }) {
      WaterFlow({ scroller: this.scroller }) {
        ForEach(this.waterFlowData, (item: ItemList) => {
          FlowItem() {
            FlowItemComponent({ item: item })
          }
        }, (item: ItemList) => JSON.stringify(item))
      }
      .columnsTemplate(CommonConstant.WATER_FLOW_COLUMNS_TEMPLATE)
      .columnsGap($r('app.float.size_8'))
      .rowsGap($r('app.float.size_8'))
      .onReachEnd(() => {
        this.getData(false)
      })
    }
    .onRefreshing(() => {
      this.nextPageUrl = this.url
      this.getData(true)
    })
  }


}

