import { PullToRefresh } from '@ohos/pulltorefresh/Index'
import { PullToRefreshConfigurator } from '@ohos/pulltorefresh/Index'
import { CommonConstant } from '../../common/constant/CommonConstant';
import { HomeItem } from './HomeItem';
import { ItemList } from '../../model/HomeModel';
import { EyepetizerApi } from '../../http/EyepetizerApi';
import dailyViewModel from '../../viewmodel/home/DailyViewModel';

const pointSpace = 30;
const pointJitterAmplitude = 10;

@Component
export struct RecommendPage {
  @State refreshText: string = '';
  private scroller: Scroller = new Scroller();
  private refreshConfigurator: PullToRefreshConfigurator = new PullToRefreshConfigurator();
  private canvasSetting: RenderingContextSettings = new RenderingContextSettings(true);
  private canvasRefresh: CanvasRenderingContext2D = new CanvasRenderingContext2D(this.canvasSetting);
  private value1: number[] = [];
  private value2: number[] = [];
  private url: string = EyepetizerApi.HOME_RECOMMEND
  private nextPageUrl?: string = null
  @State data: ItemList[] = []
  @State isTheEnd: boolean = false

  aboutToAppear() {
    // 设置属性
    this.refreshConfigurator.setRefreshAnimDuration(600) // 下拉动画执行一次的时间
    this.nextPageUrl = this.url
    this.getData(false)
  }

  getData(onRefresh: boolean) {
    return dailyViewModel.getDailyData(this.nextPageUrl, (result) => {
      if (onRefresh) {
        this.data = result.itemList
      } else {
        this.data = [...this.data, ...result.itemList]
      }
    })
  }

  build() {
    Column() {
      PullToRefresh({
        // 必传项，列表组件所绑定的数据
        data: $data,
        // 必传项，需绑定传入主体布局内的列表或宫格组件
        scroller: this.scroller,
        // 必传项，自定义主体布局，内部有列表或宫格组件
        customList: () => {
          // 一个用@Builder修饰过的UI方法
          this.getListView();
        },
        // 可选项，组件属性配置，具有默认值
        refreshConfigurator: this.refreshConfigurator,
        // 可选项，下拉刷新回调
        onRefresh: () => {
          return this.getData(true)
        },
        // 可选项，上拉加载更多回调
        onLoadMore: () => {
          return this.getData(false)
        },
        // 可选项，自定义下拉刷新动画布局
        customRefresh: () => {
          this.customRefreshView();
        },
        // 可选项，下拉中回调
        onAnimPullDown: (value, width, height) => {
          if (value !== undefined && width !== undefined && height !== undefined) {
            this.canvasRefresh.clearRect(0, 0, width, height);
            if (value <= 0.33) {
              this.drawPoint(width / 2, height / 2);
            } else if (value <= 0.75) {
              this.drawPoint(width / 2 - (pointSpace / 2 * (value - 0.33) / (0.75 - 0.33)), height / 2);
              this.drawPoint(width / 2 + (pointSpace / 2 * (value - 0.33) / (0.75 - 0.33)), height / 2);
            } else {
              this.drawPoint(width / 2, height / 2);
              this.drawPoint(width / 2 - pointSpace / 2 - (pointSpace / 2 * (value - 0.75) / (1 - 0.75)), height / 2);
              this.drawPoint(width / 2 + pointSpace / 2 + (pointSpace / 2 * (value - 0.75) / (1 - 0.75)), height / 2);
            }
          }
        },
        // 可选项，刷新中回调
        onAnimRefreshing: (value, width, height) => {
          if (value !== undefined && width !== undefined && height !== undefined) {
            this.canvasRefresh.clearRect(0, 0, width, height);
            // 将value值由0到1循环变化变为-1到1反复变化
            value = Math.abs(value * 2 - 1) * 2 - 1;
            // 绘制第1个点
            this.drawPoint(width / 2 - pointSpace, height / 2 + pointJitterAmplitude * value);
            // 绘制第2个点
            if (this.value1.length == 7) {
              this.drawPoint(width / 2, height / 2 + pointJitterAmplitude * this.value1[0]);
              this.value1 = this.value1.splice(1, this.value1.length);
            } else {
              this.drawPoint(width / 2, height / 2 + pointJitterAmplitude);
            }
            this.value1.push(value);
            // 绘制第3个点
            if (this.value2.length == 14) {
              this.drawPoint(width / 2 + pointSpace, height / 2 + pointJitterAmplitude * this.value2[0]);
              this.value2 = this.value2.splice(1, this.value2.length);
            } else {
              this.drawPoint(width / 2 + pointSpace, height / 2 + pointJitterAmplitude);
            }
            this.value2.push(value);
          }
        },
        customLoad: null,
      })
    }
  }

  private drawPoint(x: number, y: number): void {
    this.canvasRefresh.beginPath();
    this.canvasRefresh.arc(x, y, 3, 0, Math.PI * 2);
    this.canvasRefresh.fill();
  }

  @Builder
  private customRefreshView() {
    Canvas(this.canvasRefresh)
      .width('100%')
      .height('100%')
      .onReady(() => {
        this.canvasRefresh.fillStyle = 'red';
      })
  }

  @Builder
  private getListView() {
    List({ space: 0, initialIndex: 0, scroller: this.scroller }) {
      ForEach(this.data, (item: ItemList, index: number) => {
        ListItem() {
          HomeItem({ item: item })
        }
      })
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
    .edgeEffect(EdgeEffect.None) // 必须设置列表为滑动到边缘无效果
  }
}

