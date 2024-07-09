import { CommonConstant } from '../../../common/constant/CommonConstant'
import { ItemList } from '../../../model/HomeModel'


@Component
export struct Banner {
  @State data: ItemList = {}

  build() {
    Stack({ alignContent: Alignment.Bottom }) {
      Image(this.data.data?.image)
        // 占位图
        .alt("#ccededed")
        .objectFit(ImageFit.Cover)
          // 图片插值
        .interpolation(ImageInterpolation.High)
          // 设置图片的渲染模式为原色
        .renderMode(ImageRenderMode.Original)
        .borderRadius("4vp")
        .margin({ left: "14vp", top: "10vp", right: "14vp", bottom: "10vp" })

      Divider()
        .strokeWidth("0.2vp")
        .color($r("app.color.color_ededed"))
        .margin({ left: "14vp", right: "14vp" })
    }
    .width(CommonConstant.FULL_WIDTH)
    .height("205vp")
  }
}

@Preview
@Component
struct BannerPreview {
  build() {
    Banner({
      data: {
        data: {
          image: "https://img.kaiyanapp.com/5abd51b35e6f0cfb9c00b9b9417c703d.jpeg?imageMogr2/quality/60/format/jpg",
        }
      }
    })
  }
}