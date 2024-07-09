import { ItemList } from '../../model/CommunityRecommendModel';
import FlowItemComponent from './FlowItemComponent';
import { WaterFlowDataSource } from '../../model/WaterFlowDataSource';
import { CommonConstant } from '../../common/constant/CommonConstant';


@Component
export default struct WaterFlowComponent {
  private datasource: WaterFlowDataSource = new WaterFlowDataSource();
  @State data: ItemList[] = []

  aboutToAppear() {
    this.datasource.setDataArray(this.data);
  }

  build() {

    WaterFlow({ footer: (): void => this.itemFoot() }) {
      LazyForEach(this.datasource, (item: ItemList) => {
        FlowItem() {
          FlowItemComponent({ item: item })
        }
      }, (item: ItemList) => JSON.stringify(item))
    }
    .layoutWeight(1)
    .layoutDirection(FlexDirection.Column)
    .columnsTemplate(CommonConstant.WATER_FLOW_COLUMNS_TEMPLATE)
    .columnsGap($r('app.float.size_8'))
    .rowsGap($r('app.float.size_8'))
  }

  @Builder
  itemFoot() {
    Column() {
      Text('已经到底了')
        .fontColor(Color.Gray)
        .fontSize($r('app.float.font_size_10fp'))
        .width(CommonConstant.FULL_WIDTH)
        .height($r('app.float.size_20'))
        .textAlign(TextAlign.Center)
    }
  }
}