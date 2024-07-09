import { CommonConstant } from '../../../common/constant/CommonConstant'
import { ItemList } from '../../../model/HomeModel'


@Component
export struct VideoSmallCard {
  @State format: string = "mm:ss"
  @State data: ItemList = {}

  aboutToAppear() {
    if (this.data?.data?.duration > 60 * 60) {
      this.format = "HH:mm:ss"
    } else {
      this.format = "mm:ss"
    }
  }

  build() {
    Row() {
      Stack() {
        Image(this.data.data?.cover?.feed)
          // 占位图
          .alt("#ccededed")
          .width("172vp")
          .height("100vp")
          .objectFit(ImageFit.Cover)
            // 图片插值
          .interpolation(ImageInterpolation.High)
            // 设置图片的渲染模式为原色
          .renderMode(ImageRenderMode.Original)
          .borderRadius("4vp")

        Stack() {
          TextTimer({ isCountDown: true, count: this.data?.data?.duration * 1000 })
            .format(this.format)
            .fontColor(Color.White)
            .fontSize("14fp")
            .fontFamily($r("app.string.font_family_name_din_condensed_bold"))
        }
        .height("20vp")
        .backgroundColor("#cc000000")
        .borderRadius("2vp")
        .margin("5vp")
        .padding({ left: "3.5vp", top: "1vp", right: "3.5vp", bottom: "1vp" })
      }
      .margin({ left: "14vp", bottom: "14vp" })
      .alignContent(Alignment.BottomEnd)

      Column() {
        Text(this.data?.data.title)
          .fontColor($r("app.color.color_333333"))
          .fontSize("14fp")
          .fontFamily($r("app.string.font_family_name_fz_lan_ting_hei_s_db1_gb_regular"))
          .fontWeight(FontWeight.Medium)
          .maxLines(2)
          .textOverflow({ overflow: TextOverflow.Ellipsis })
          .textAlign(TextAlign.Start)
          .width(CommonConstant.MATCH_PARENT)

        Row() {
          if (this.data?.data?.library == "DAILY") {
            Text("#" + `${this.data?.data.category}` + " / 开眼精选")
              .fontColor($r("app.color.color_333333"))
              .fontSize("12fp")
              .margin({ bottom: "6vp" })
          } else {
            Text("#" + `${this.data?.data.category}`)
              .fontColor($r("app.color.color_333333"))
              .fontSize("12fp")
              .margin({ bottom: "6vp" })
          }

          Image($r("app.media.ic_share_gray"))
            .width("20vp")
            .aspectRatio(1)
            .margin({ bottom: "6vp" })
        }
        .width(CommonConstant.MATCH_PARENT)
        .justifyContent(FlexAlign.SpaceBetween)
        .alignItems(VerticalAlign.Bottom)
      }
      .height(CommonConstant.MATCH_PARENT)
      .justifyContent(FlexAlign.SpaceBetween)
      .layoutWeight(1)
      .padding({ left: "12vp", top: "8vp", right: "14vp", bottom: "14vp" })
    }
    .width(CommonConstant.MATCH_PARENT)
    .height("114vp")
  }
}

@Preview
@Component
export struct VideoSmallCardPreview {
  build() {
    Stack() {
      VideoSmallCard({
        data: {
          data: {
            cover: {
              feed: "http://ali-img.kaiyanapp.com/f2c7f7b6795508b053b6872a07a7e044.jpeg?imageMogr2/quality/60/format/jpg"
            },
            duration: 130,
            title: "当病毒把人类隔离在家，大自然开始了狂欢",
            category: "动画",
            library: "DAILY"
          },
        }
      })
    }
  }
}