import { CommonConstant } from '../../../common/constant/CommonConstant'
import { ItemList } from '../../../model/HomeModel'

@Component
export struct TextCardFooter3 {
  @State data: ItemList = {}

  build() {
    Stack(){
      Column() {
        // 分割线
        Divider().strokeWidth("0.2vp")
          .color($r("app.color.color_ededed"))
          .width(CommonConstant.MATCH_PARENT)
          .margin({ left: "14vp", right: "14vp" })
        Row() {
          Blank().layoutWeight(1)

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
      }
      Stack({ alignContent: Alignment.Center }) {
        Text("刷新推荐")
          .fontColor($r("app.color.color_4687d7"))
          .fontSize("10fp")
          .fontFamily($r("app.string.font_family_name_fz_lan_ting_hei_s_db1_gb_regular"))
      }
      .width("88vp")
      .aspectRatio(4)
      .border({ width: "0.2vp", color: $r("app.color.color_4687d7"), radius: "20vp" })
      .alignSelf(ItemAlign.Center)
      .margin({ right: "14vp" })
    }
    .width(CommonConstant.MATCH_PARENT)
    .height("53vp")
  }
}

@Preview
@Component
export struct TextCardFooter3Preview {
  build() {
    Stack() {
      TextCardFooter3({ data: { data: { rightText: "查看全部" } } })
    }
  }
}