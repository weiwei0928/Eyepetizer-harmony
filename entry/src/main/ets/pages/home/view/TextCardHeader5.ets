import { CommonConstant } from '../../../common/constant/CommonConstant'
import { ItemList } from '../../../model/HomeModel'

@Component
export struct TextCardHeader5 {
  @State data: ItemList = {}

  build() {
    Row() {
      Text(this.data.data?.text)
        .fontColor($r("app.color.color_333333"))
        .fontSize("22fp")
        .fontFamily($r("app.string.font_family_name_fz_lan_ting_hei_s_db1_gb_regular"))
        .margin({ left: "14vp", top: "19vp" })

      Image($r("app.media.ic_arrow_right_gray_24"))
        .width("20vp")
        .aspectRatio(1)
        .margin({ left: "5vp", top: "19vp" })

      if (this.data.data?.follow != null) {
        Blank()
        Stack({ alignContent: Alignment.Center }) {
          Text("+关注")
            .fontColor($r("app.color.color_444444"))
            .fontSize("10fp")
            .fontFamily($r("app.string.font_family_name_fz_lan_ting_hei_s_db1_gb_regular"))
        }
        .width("44vp")
        .aspectRatio(2)
        .border({ width: "0.2vp", color: $r("app.color.color_444444"), radius: "2vp" })
        .alignSelf(ItemAlign.Center)
        .margin({ right: "14vp" })
      }
    }.width(CommonConstant.MATCH_PARENT)
    .height("53vp")
  }
}

@Preview
@Component
export struct TextCardHeader5Preview {
  build() {
    Stack() {
      TextCardHeader5({ data: { data: { text: "五分钟新知", follow: {} } } })
    }
  }
}