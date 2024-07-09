import { ViewStateConstant } from '../constant/CommonConstant';

@Component
export struct StateComponent {
  @Prop viewState: string;
  //页面内容区域组件
  @BuilderParam viewContent: () => void
  //重试的回调方法
  retryCallback?: () => void
  //是否骨架屏幕
  private showSkeleton: boolean = false

  build() {
    Stack() {
      if (this.viewState != ViewStateConstant.VIEW_STATE_SUCCESS) {
        this.holdContent()
      } else {
        this.viewContent()
      }
    }
  }

  /**
   * 占位组件
   */
  @Builder
  holdContent() {
    Column() {
      Image($r('app.media.ic_refresh_blue_24dp'))
        .width("35vp")
        .aspectRatio(1)
        .rotate({ angle: 360 })
        .animation({
          duration: 1500,
          iterations: -1,
          curve: Curve.Smooth
        })
    }
    .justifyContent(FlexAlign.Center)
    .alignItems(HorizontalAlign.Center)
    .width("120vp")
    .aspectRatio(1)
    .backgroundColor(Color.Transparent)
    .border({ radius: "12vp" })
  }
}



