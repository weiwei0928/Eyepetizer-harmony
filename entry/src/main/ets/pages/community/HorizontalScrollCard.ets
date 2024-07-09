import { CommonConstant } from '../../common/constant/CommonConstant'
import { ItemList, ItemX } from '../../model/CommunityRecommendModel'

@Component
export struct HorizontalScrollCard {
  @State data: ItemList = {}

  build() {
    Grid() {
      ForEach(
        this.data?.data?.itemList,
        (item: ItemX, index) => {
          GridItem() {
            Stack() {
              Image(item.data?.bgPicture)
                .alt("#ccededed")// 占位图
                .width(CommonConstant.MATCH_PARENT)
                .objectFit(ImageFit.Cover)// 图片插值
                .interpolation(ImageInterpolation.High)// 设置图片的渲染模式为原色
                .renderMode(ImageRenderMode.Original)// 设置图片解码尺寸
                .sourceSize({
                  width: undefined,
                  height: 90
                })
                .borderRadius("4vp")

              Text(item.data?.title)
                .fontColor($r("app.color.white"))
                .fontSize("14fp")
                .textAlign(TextAlign.Center)
                .fontFamily($r("app.string.font_family_name_fz_lan_ting_hei_s_db1_gb_regular"))
                .margin({ left: "14vp", right: "14vp" })
            }
          }
        }
      )
    }
    .width(CommonConstant.MATCH_PARENT)
    .height("184vp")
    .padding({ left: "14vp", right: "14vp" })
    .maxCount(2)
    .layoutDirection(GridDirection.Row)
    .rowsTemplate('1fr 1fr')
    // .columnsTemplate('1fr 1fr')
    // 设置行列间距
    .columnsGap("4vp")
    .rowsGap("4vp")
  }
}

@Preview
@Component
export struct HorizontalScrollCardPreview {
  build() {
    Stack() {
      HorizontalScrollCard()
    }
  }
}