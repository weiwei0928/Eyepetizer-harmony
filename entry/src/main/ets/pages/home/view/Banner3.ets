import { CommonConstant } from '../../../common/constant/CommonConstant'
import { ItemList } from '../../../model/HomeModel'


@Component
export struct Banner3 {
  @State data: ItemList = {}

  build() {
    Column() {
      Stack({ alignContent: Alignment.TopEnd }) {
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

        if (this.data.data?.label?.text != null) {
          Stack({ alignContent: Alignment.Center }) {
            Text(this.data.data?.label?.text)
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
        }
      }
      .width(CommonConstant.MATCH_PARENT)
      .height("205vp")

      Row() {
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
struct Banner3Preview {
  build() {
    Banner3({
      data: {
        data: {
          image: "http://img.kaiyanapp.com/5abd51b35e6f0cfb9c00b9b9417c703d.jpeg?imageMogr2/quality/60/format/jpg",
          label: {
            text: "广告"
          },
          header: {
            icon: "http://ali-img.kaiyanapp.com/53a54853f9457543e022ec7268ab5856.jpeg?imageMogr2/quality/60/format/jpg",
            title: "J12. IT’S ALL ABOUT SECONDS*",
            description: "*J12腕表 分秒背后",
          },
        }
      }
    })
  }
}