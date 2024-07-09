import { CommonConstant } from '../../../common/constant/CommonConstant'
import { ItemList } from '../../../model/HomeModel'

@Component
export struct TextCardHeader7 {
  @State data: ItemList = {}

  build() {
    Row() {
      Text(this.data.data?.text)
        .fontColor($r("app.color.color_333333"))
        .fontSize("22fp")
        .fontFamily($r("app.string.font_family_name_fz_lan_ting_hei_s_db1_gb_regular"))
        .margin({ left: "14vp", top: "19vp" })

      Blank()

      Text(this.data.data?.rightText)
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
    .width(CommonConstant.MATCH_PARENT)
    .height("53vp")
  }
}

@Preview
@Component
export struct TextCardHeader7Preview {
  build() {
    Stack() {
      TextCardHeader7({ data: { data: { text: "开眼专栏", rightText: "查看全部" } } })
    }
  }
}