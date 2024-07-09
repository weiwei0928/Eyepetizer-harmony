import { CommonConstant } from '../../../common/constant/CommonConstant'
import { ItemList } from '../../../model/HomeModel'


@Component
export struct TopicBriefCard {
  @State data: ItemList = {}

  build() {
    Row() {
      Image(this.data.data?.icon)
        // 占位图
        .alt("#ccededed")
        .width("50vp")
        .aspectRatio(1)
        .objectFit(ImageFit.Cover)
          // 图片插值
        .interpolation(ImageInterpolation.High)
          // 设置图片的渲染模式为原色
        .renderMode(ImageRenderMode.Original)
        .sourceSize({
          width: 50,
          height: 50
        })
        .borderRadius("4vp")
        .margin({ left: "14vp" })

      Column({ space: "2vp" }) {
        Text(this.data?.data.title)
          .fontColor($r("app.color.color_333333"))
          .fontSize("14fp")
          .fontFamily($r("app.string.font_family_name_fz_lan_ting_hei_s_db1_gb_regular"))
          .fontWeight(FontWeight.Medium)
          .maxLines(2)
          .textOverflow({ overflow: TextOverflow.Ellipsis })
          .textAlign(TextAlign.Start)
          .width(CommonConstant.MATCH_PARENT)

        Text(this.data?.data.description)
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
    .height("66vp")
  }
}

@Preview
@Component
export struct TopicBriefCardPreview {
  build() {
    Stack() {
      TopicBriefCard({
        data: {
          data: {
            icon: "http://ali-img.kaiyanapp.com/53a54853f9457543e022ec7268ab5856.jpeg?imageMogr2/quality/60/format/jpg",
            title: "如果发挥你的专业去摆摊，你会去摆什么样的地摊？",
            description: "9527人浏览 / 498人参与",
          },
        }
      })
    }
  }
}