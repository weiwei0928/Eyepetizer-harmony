/**
 * 加载弹窗
 */
@CustomDialog
export struct LoadingDialog {
  @Prop loadingTips: string
  @State rotateAngle: number = 0
  // 弹窗控制器
  controller: CustomDialogController

  aboutToAppear() {
    setTimeout(() => {
      this.rotateAngle = 360
    }, 200)
  }

  build() {
    Stack() {
      Column() {
        // Image($r('app.media.ic_loading'))
        Image($r('app.media.ic_refresh_blue_24dp'))
          .width("35vp")
          .aspectRatio(1)
          .rotate({ angle: this.rotateAngle })
          .animation({
            duration: 1500,
            iterations: -1,
            curve: Curve.Smooth
          })
        // Text(this.loadingTips)
        //   .fontColor($r("app.color.color_333333"))
        //   .fontSize("15fp")
        //   .margin({ top: "10vp" })
      }
      .justifyContent(FlexAlign.Center)
      .alignItems(HorizontalAlign.Center)
      .width("120vp")
      .aspectRatio(1)
      .backgroundColor(Color.Transparent)
      .border({ radius: "12vp" })
    }
  }
}

@Preview
@Component
struct LoadingDialogPreview {
  build() {
    Stack() {
      LoadingDialog({ loadingTips: "加载中..." })
    }
    .width("100%")
    .height("100%")
    .backgroundColor("#f5f5f5")
  }
}