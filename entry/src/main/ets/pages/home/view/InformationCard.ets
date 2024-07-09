import { CommonConstant } from '../../../common/constant/CommonConstant'
import { ItemList } from '../../../model/HomeModel'


@Component
export struct InformationCard {
  @State data: ItemList = {}

  build() {
    Column() {
      Stack({ alignContent: Alignment.TopEnd }) {
        Image(this.data.data?.content?.data?.cover?.feed)
          // 占位图
          .alt("#ccededed")
          .objectFit(ImageFit.Cover)
            // 图片插值
          .interpolation(ImageInterpolation.High)
            // 设置图片的渲染模式为原色
          .renderMode(ImageRenderMode.Original)
          .borderRadius({ topLeft: "4vp", topRight: "4vp" })
          .margin({ left: "14vp", right: "14vp" })
      }
      .width(CommonConstant.MATCH_PARENT)
      .height("185vp")

      Stack() {
        Column({ space: "13vp" }) {

          ForEach(this.data.data?.titleList, (title, index) => {
            Text(title)
              .fontColor($r("app.color.color_333333"))
              .fontSize("12fp")
          })
        }
        .alignItems(HorizontalAlign.Start)
        .width(CommonConstant.MATCH_PARENT)
        .backgroundColor("#ededed")
        .borderRadius({ bottomLeft: "4vp", bottomRight: "4vp" })
        .padding({ top: "5vp", left: "12vp", right: "12vp", bottom: "5vp" })
      }
      .padding({ left: "14vp", right: "14vp" })
    }
  }
}

@Preview
@Component
struct InformationCardPreview {
  build() {
    InformationCard({
      data: {
        data: {
          content: {
            data: {
              cover: {
                feed: "http://img.kaiyanapp.com/5abd51b35e6f0cfb9c00b9b9417c703d.jpeg?imageMogr2/quality/60/format/jpg",
              }
            }
          },
          titleList: [
            "Netfix | 因社会戾气沉重，[黑镜]第六季或延迟推出",
            "Netfix | 因社会戾气沉重，[黑镜]第六季或延迟推出",
            "Netfix | 因社会戾气沉重，[黑镜]第六季或延迟推出",
            "Netfix | 因社会戾气沉重，[黑镜]第六季或延迟推出",
          ]
        }
      }
    })
  }
}