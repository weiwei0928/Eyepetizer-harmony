import { CommonConstant } from '../../../common/constant/CommonConstant'
import { ItemList } from '../../../model/HomeModel'


@Component
export struct HorizontalScrollCard {
  private swiperController: SwiperController = new SwiperController()
  @State data: ItemList = {}

  build() {
    Stack() {
      Swiper(this.swiperController) {
        ForEach(this.data.data?.itemList, (item: ItemList, index) => {
          Stack() {
            Image(item.data?.image)
              // 占位图
              .alt("#ccededed")
              .width(CommonConstant.MATCH_PARENT)
              .height(CommonConstant.MATCH_PARENT)
              .objectFit(ImageFit.Cover)
                // 图片插值
              .interpolation(ImageInterpolation.High)
                // 设置图片的渲染模式为原色
              .renderMode(ImageRenderMode.Original)
              .borderRadius("4vp")

            if (item?.data?.title != undefined && item?.data?.title != null) {
              Stack() {
                Text(item.data.title)
                  .fontColor(Color.White)
                  .fontSize("10fp")
                  .fontFamily($r("app.string.font_family_name_fz_lan_ting_hei_s_db1_gb_regular"))
              }
              .height("20vp")
              .backgroundColor("#4d000000")
              .borderColor("#33ffffff")
              .borderRadius("2vp")
              .margin("8vp")
              .padding({ left: "8vp", right: "8vp" })
            }
          }
          .margin({ top: "10vp", bottom: "12vp" })
          .padding({ left: "14vp", right: "14vp" })
          .alignContent(Alignment.TopStart)
        })
      }
      // 循环播放
      .loop(true)
      // 自动轮播
      .autoPlay(false)
      // 导航点样式
      .indicatorStyle({
        size: "8vp",
        color: "#999999",
        selectedColor: Color.White,
        bottom: "8vp"
      })
      .indicator(true)
      // 轮播方向
      .vertical(false)
      // 每页显示多个子页面
      .displayCount(1)
    }
    .width(CommonConstant.MATCH_PARENT)
    .height("208vp")
    .backgroundColor(Color.White)
  }
}


@Preview
@Component
export struct HorizontalScrollCardPreview {
  build() {
    Stack() {
      HorizontalScrollCard({
        data: {
          data: {
            itemList: [
              {
                data: {
                  title: "mini杂志",
                  image: "http://img.kaiyanapp.com/fdf4a517025bf46a72dc01887a235bb1.jpeg?imageMogr2/quality/60/format/jpg"
                },
              },
              {
                data: {
                  title: "mini杂志",
                  image: "http://img.kaiyanapp.com/fdf4a517025bf46a72dc01887a235bb1.jpeg?imageMogr2/quality/60/format/jpg"
                },
              },
              {
                data: {
                  title: "mini杂志",
                  image: "http://img.kaiyanapp.com/fdf4a517025bf46a72dc01887a235bb1.jpeg?imageMogr2/quality/60/format/jpg"
                },
              },
              {
                data: {
                  title: "mini杂志",
                  image: "http://img.kaiyanapp.com/fdf4a517025bf46a72dc01887a235bb1.jpeg?imageMogr2/quality/60/format/jpg"
                },
              },
            ]
          },
        }
      })
    }
  }
}