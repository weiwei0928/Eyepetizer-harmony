import { CommonConstant } from '../../../common/constant/CommonConstant'
import { ItemList } from '../../../model/HomeModel'


@Component
export struct FollowCard {
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
    Column() {
      Stack() {
        Image(this.data.data?.content?.data?.cover?.feed)
          // 占位图
          .alt("#ccededed")
          .objectFit(ImageFit.Cover)
            // 图片插值
          .interpolation(ImageInterpolation.High)
            // 设置图片的渲染模式为原色
          .renderMode(ImageRenderMode.Original)
          .borderRadius("4vp")
          .margin({ left: "14vp", top: "10vp", right: "14vp", bottom: "10vp" })

        if (this.data.data?.content?.data?.library == "DAILY") {
          Image($r("app.media.ic_choiceness"))
            .size({ width: "48vp", height: "48vp" })
            .position({ x: "26vp", y: "22vp" })
        }

        if (this.data.data?.content?.data?.ad == true) {
          Stack({ alignContent: Alignment.Center }) {
            Text("广告")
              .fontColor(Color.White)
              .fontSize("10fp")
              .fontWeight(FontWeight.Bold)
              .fontFamily($r("app.string.font_family_name_fz_lan_ting_hei_s_db1_gb_regular"))
          }
          .width("36vp")
          .height("20vp")
          .border({ width: "0.2vp", color: "#33ffffff", radius: "2vp" })
          .backgroundColor("#4d000000")
          .margin({ top: "18vp", right: "22vp" })
          .alignSelf(ItemAlign.Center)
        }

        Stack() {
          TextTimer({ isCountDown: true, count: this.data?.data?.content?.data?.duration * 1000 })
            .format(this.format)
            .fontColor(Color.White)
            .fontSize("14fp")
            .fontFamily($r("app.string.font_family_name_din_condensed_bold"))
        }
        .height("20vp")
        .backgroundColor("#cc000000")
        .borderRadius("2vp")
        .padding({ left: "3.5vp", top: "1vp", right: "3.5vp", bottom: "1vp" })
        .margin({ top: "170vp", right: "19vp" })
      }
      .width(CommonConstant.MATCH_PARENT)
      .height("205vp")
      .alignContent(Alignment.TopEnd)

      Row() {
        Stack() {
          Image(this.data.data?.header?.icon)
            // 占位图
            .alt("#ccededed")
            .width("40vp")
            .aspectRatio(1)
            .objectFit(ImageFit.Cover)
              // 图片插值
            .interpolation(ImageInterpolation.High)
              // 设置图片的渲染模式为原色
            .renderMode(ImageRenderMode.Original)
            .sourceSize({
              width: 40,
              height: 40
            })
            .borderRadius("20vp")

          Image($r("app.media.ic_star"))
            .width("10vp")
            .aspectRatio(1)
            .backgroundColor("#4687d7")
            .border({ width: "1vp", color: $r("app.color.color_ededed"), radius: "10vp" })
            .borderRadius("10vp")
            .margin({ right: "1vp", bottom: "1vp" })
        }
        .width("40vp")
        .aspectRatio(1)
        .alignContent(Alignment.BottomEnd)
        .margin({ left: "14vp" })

        Column({ space: "2vp" }) {
          Text(this.data.data?.header?.title)
            .fontColor($r("app.color.color_333333"))
            .fontSize("14fp")
            .fontFamily($r("app.string.font_family_name_fz_lan_ting_hei_s_db1_gb_regular"))
            .fontWeight(FontWeight.Medium)
            .maxLines(1)
            .textOverflow({ overflow: TextOverflow.Ellipsis })
            .textAlign(TextAlign.Start)
            .width(CommonConstant.MATCH_PARENT)

          Text(this.data.data?.header?.description)
            .fontColor($r("app.color.color_888888"))
            .fontSize("12fp")
            .fontWeight(FontWeight.Medium)
            .maxLines(1)
            .textOverflow({ overflow: TextOverflow.Ellipsis })
            .textAlign(TextAlign.Start)
            .width(CommonConstant.MATCH_PARENT)
        }
        .layoutWeight(1)
        .margin({ left: "12vp", right: "12vp" })

        Image($r("app.media.ic_share_gray"))
          .width("20vp")
          .aspectRatio(1)
          .margin({ right: "14vp" })
      }
      .width(CommonConstant.MATCH_PARENT)

      Divider()
        .strokeWidth("0.2vp")
        .color($r("app.color.color_ededed"))
        .margin({ left: "14vp", top: "10vp", right: "14vp" })
    }
  }
}

@Preview
@Component
struct FollowCardPreview {
  build() {
    FollowCard({
      data: {
        data: {
          content: {
            data: {
              cover: {
                feed: "http://img.kaiyanapp.com/5abd51b35e6f0cfb9c00b9b9417c703d.jpeg?imageMogr2/quality/60/format/jpg",
              },
              library: "DAILY",
              duration: 130,
              ad: true,
            }
          },
          header: {
            icon: "http://ali-img.kaiyanapp.com/53a54853f9457543e022ec7268ab5856.jpeg?imageMogr2/quality/60/format/jpg",
            title: "广告裁判",
            description: "开眼广告精选 / #广告",
          },
        }
      }
    })
  }
}