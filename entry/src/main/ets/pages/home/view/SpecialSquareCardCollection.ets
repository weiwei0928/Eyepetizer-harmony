import { CommonConstant } from '../../../common/constant/CommonConstant'
import { ItemList } from '../../../model/HomeModel'


@Component
export struct SpecialSquareCardCollection {
  @State data: ItemList = {}

  aboutToAppear() {
  }

  build() {
    Column() {
      Row() {
        Text(this.data.data?.header?.title)
          .fontColor($r("app.color.color_333333"))
          .fontSize("22fp")
          .fontFamily($r("app.string.font_family_name_fz_lan_ting_hei_s_db1_gb_regular"))
          .margin({ left: "14vp", top: "19vp" })

        Blank()

        Text(this.data.data?.header?.rightText)
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

      Grid() {
        ForEach(
          this.data.data?.itemList,
          (item: ItemList, index) => {
            GridItem() {
              Stack() {
                Image(item.data?.image)
                  // 占位图
                  .alt("#ccededed")
                  .width(CommonConstant.MATCH_PARENT)
                  .aspectRatio(1)
                  .objectFit(ImageFit.Cover)
                    // 图片插值
                  .interpolation(ImageInterpolation.High)
                    // 设置图片的渲染模式为原色
                  .renderMode(ImageRenderMode.Original)
                    // 设置图片解码尺寸
                  .sourceSize({
                    width: 108,
                    height: 108
                  })
                  .borderRadius("4vp")

                Text(item.data?.title)
                  .fontColor($r("app.color.white"))
                  .fontSize("14fp")
                  .fontFamily($r("app.string.font_family_name_fz_lan_ting_hei_s_db1_gb_regular"))
              }
              .width("108vp")
              .aspectRatio(1)
            }
          }
        )
      }
      .width(CommonConstant.MATCH_PARENT)
      .height("220vp")
      .padding({ left: "14vp", right: "14vp" })
      // 表示主轴方向上最大显示的网格单元数量为8
      .maxCount(8)
      // 设置主轴方向
      .layoutDirection(GridDirection.Row)
      // 设置行列数量与占比
      // 如果仅设置行、列数量与占比中的一个，即仅设置rowsTemplate或仅设置columnsTemplate属性，网格单元按照设置的方向排列，超出Grid显示区域后，Grid拥有可滚动能力。
      // 如果设置的是columnsTemplate，Grid的滚动方向为垂直方向；如果设置的是rowsTemplate，Grid的滚动方向为水平方向。
      .rowsTemplate('1fr 1fr')
      // 设置行列间距
      .columnsGap("4vp")
      .rowsGap("4vp")
    }
    .width(CommonConstant.MATCH_PARENT)
    .height("285vp")
  }
}

@Preview
@Component
export struct SpecialSquareCardCollectionPreview {
  build() {
    Stack() {
      SpecialSquareCardCollection({
        data: {
          data: {
            header: {
              title: "热门分类",
              rightText: "查看全部分类"
            },
            itemList: [
              {
                data: {
                  image: "http://img.kaiyanapp.com/57472e13fd2b6c9655c8a600597daf4d.png?imageMogr2/quality/60/format/jpg",
                  title: "#广告",
                  dataType: "SquareCard",
                },
                type: "squareCardOfCategory"
              },
              {
                data: {
                  image: "http://img.kaiyanapp.com/57472e13fd2b6c9655c8a600597daf4d.png?imageMogr2/quality/60/format/jpg",
                  title: "#广告",
                  dataType: "SquareCard",
                },
                type: "squareCardOfCategory"
              },
              {
                data: {
                  image: "http://img.kaiyanapp.com/57472e13fd2b6c9655c8a600597daf4d.png?imageMogr2/quality/60/format/jpg",
                  title: "#广告",
                  dataType: "SquareCard",
                },
                type: "squareCardOfCategory"
              },
              {
                data: {
                  image: "http://img.kaiyanapp.com/57472e13fd2b6c9655c8a600597daf4d.png?imageMogr2/quality/60/format/jpg",
                  title: "#广告",
                  dataType: "SquareCard",
                },
                type: "squareCardOfCategory"
              },
              {
                data: {
                  image: "http://img.kaiyanapp.com/57472e13fd2b6c9655c8a600597daf4d.png?imageMogr2/quality/60/format/jpg",
                  title: "#广告",
                  dataType: "SquareCard",
                },
                type: "squareCardOfCategory"
              },
              {
                data: {
                  image: "http://img.kaiyanapp.com/57472e13fd2b6c9655c8a600597daf4d.png?imageMogr2/quality/60/format/jpg",
                  title: "#广告",
                  dataType: "SquareCard",
                },
                type: "squareCardOfCategory"
              },
              {
                data: {
                  image: "http://img.kaiyanapp.com/57472e13fd2b6c9655c8a600597daf4d.png?imageMogr2/quality/60/format/jpg",
                  title: "#广告",
                  dataType: "SquareCard",
                },
                type: "squareCardOfCategory"
              },
              {
                data: {
                  image: "http://img.kaiyanapp.com/57472e13fd2b6c9655c8a600597daf4d.png?imageMogr2/quality/60/format/jpg",
                  title: "#广告",
                  dataType: "SquareCard",
                },
                type: "squareCardOfCategory"
              },
              {
                data: {
                  image: "http://img.kaiyanapp.com/57472e13fd2b6c9655c8a600597daf4d.png?imageMogr2/quality/60/format/jpg",
                  title: "#广告",
                  dataType: "SquareCard",
                },
                type: "squareCardOfCategory"
              },
              {
                data: {
                  image: "http://img.kaiyanapp.com/57472e13fd2b6c9655c8a600597daf4d.png?imageMogr2/quality/60/format/jpg",
                  title: "#广告",
                  dataType: "SquareCard",
                },
                type: "squareCardOfCategory"
              },
              {
                data: {
                  image: "http://img.kaiyanapp.com/57472e13fd2b6c9655c8a600597daf4d.png?imageMogr2/quality/60/format/jpg",
                  title: "#广告",
                  dataType: "SquareCard",
                },
                type: "squareCardOfCategory"
              },
              {
                data: {
                  image: "http://img.kaiyanapp.com/57472e13fd2b6c9655c8a600597daf4d.png?imageMogr2/quality/60/format/jpg",
                  title: "#广告",
                  dataType: "SquareCard",
                },
                type: "squareCardOfCategory"
              },
              {
                data: {
                  image: "http://img.kaiyanapp.com/57472e13fd2b6c9655c8a600597daf4d.png?imageMogr2/quality/60/format/jpg",
                  title: "#广告",
                  dataType: "SquareCard",
                },
                type: "squareCardOfCategory"
              },
              {
                data: {
                  image: "http://img.kaiyanapp.com/57472e13fd2b6c9655c8a600597daf4d.png?imageMogr2/quality/60/format/jpg",
                  title: "#广告",
                  dataType: "SquareCard",
                },
                type: "squareCardOfCategory"
              },
              {
                data: {
                  image: "http://img.kaiyanapp.com/57472e13fd2b6c9655c8a600597daf4d.png?imageMogr2/quality/60/format/jpg",
                  title: "#广告",
                  dataType: "SquareCard",
                },
                type: "squareCardOfCategory"
              },
              {
                data: {
                  image: "http://img.kaiyanapp.com/57472e13fd2b6c9655c8a600597daf4d.png?imageMogr2/quality/60/format/jpg",
                  title: "#广告",
                  dataType: "SquareCard",
                },
                type: "squareCardOfCategory"
              },
            ]
          }
        } })
    }
  }
}