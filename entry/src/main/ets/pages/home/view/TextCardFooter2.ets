import { CommonConstant } from '../../../common/constant/CommonConstant'
import { ItemList } from '../../../model/HomeModel'

@Component
export struct TextCardFooter2 {
  @State data: ItemList = {}

  build() {
    Column() {
      // 分割线
      Divider().strokeWidth("0.2vp")
        .color($r("app.color.color_ededed"))
        .width(CommonConstant.MATCH_PARENT)
        .margin({ left: "14vp", right: "14vp" })
      Row() {
        Blank().layoutWeight(1)

        Text(this.data.data?.text)
          .fontColor($r("app.color.color_4687d7"))
          .fontSize("14fp")
          .fontFamily($r("app.string.font_family_name_fz_lan_ting_hei_s_db1_gb_regular"))
          .margin({ right: "5vp", top: "28vp" })

        Image($r("app.media.ic_arrow_right_gray_24"))
          .width("20vp")
          .aspectRatio(1)
          .fillColor($r("app.color.color_4687d7"))
          .margin({ right: "14vp", top: "28vp" })
      }
    }
    .width(CommonConstant.MATCH_PARENT)
    .height("53vp")
  }
}

@Preview
@Component
export struct TextCardFooter2Preview {
  build() {
    Stack() {
      TextCardFooter2({ data: { data: { rightText: "查看全部" } } })
    }
  }
}