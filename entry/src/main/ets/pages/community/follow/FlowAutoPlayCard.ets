import { CommonConstant } from '../../../common/constant/CommonConstant';
import { Item } from '../../../model/FollowModel';
import dayjs from 'dayjs';
import { VideoComponent } from '../../../common/widget/VideoComponent';

@Component
export default struct FlowAutoPlayCard {
  @State item: Item = {}
  @State playIndex: number = -1
  @State index: number = -1
  @State isAutoPlay: boolean = true
  @State showControls: boolean = true
  @State playUrl?: string = ""

  build() {
    RelativeContainer() {
      Image(this.item?.data?.header?.icon)
        .alt($r('app.media.ic_avatar_gray_76dp'))
        .width($r('app.float.size_40'))
        .height($r('app.float.size_40'))
        .margin({ top: $r('app.float.size_8'), left: $r('app.float.size_10') })
        .alignRules({
          top: { anchor: "__container__", align: VerticalAlign.Top },
          left: { anchor: "__container__", align: HorizontalAlign.Start }
        })
        .borderRadius($r('app.float.size_20'))
        .id("ivAvatar")
      Text(dayjs(this.item?.data?.content?.data?.releaseTime).format('HH:mm'))
        .fontColor($r('app.color.color_888888'))
        .fontSize($r('app.float.size_12'))
        .alignRules({
          bottom: { anchor: "ivAvatar", align: VerticalAlign.Bottom },
          left: { anchor: "ivAvatar", align: HorizontalAlign.End },
        })
        .margin({ left: $r('app.float.size_8')})
        .id("tvTime")
      Text("发布：")
        .fontColor($r('app.color.color_888888'))
        .fontSize($r('app.float.size_12'))
        .alignRules({
          bottom: { anchor: "tvTime", align: VerticalAlign.Bottom },
          top: { anchor: "tvTime", align: VerticalAlign.Top },
          left: { anchor: "tvTime", align: HorizontalAlign.End },
        })
        .id("tvRelease")
      Text(this.item?.data?.content?.data?.title)
        .fontSize($r('app.float.size_14'))
        .maxLines(1)
        .textOverflow({ overflow: TextOverflow.Ellipsis })
        .alignRules({
          bottom: { anchor: "tvRelease", align: VerticalAlign.Bottom },
          top: { anchor: "tvRelease", align: VerticalAlign.Top },
          left: { anchor: "tvRelease", align: HorizontalAlign.End },
          right: { anchor: "__container__", align: HorizontalAlign.End },
        })
        .margin({ right: $r('app.float.size_16') })

        .id("tvTitle")
      Text(this.item?.data?.content?.data?.author?.name)
        .fontSize($r('app.float.size_14'))
        .maxLines(1)
        .textOverflow({ overflow: TextOverflow.Ellipsis })
        .alignRules({
          bottom: { anchor: "tvTime", align: VerticalAlign.Top },
          left: { anchor: "tvTime", align: HorizontalAlign.Start },
          top: { anchor: "ivAvatar", align: VerticalAlign.Top }
        })
        .fontWeight(FontWeight.Bold)
        .margin({ left: $r('app.float.size_8'), top: $r('app.float.size_4')})
        .id("tvNickname")
      Text(this.item?.data?.content?.data?.description)
        .fontSize($r('app.float.size_14'))
        .maxLines(2)
        .textOverflow({ overflow: TextOverflow.Ellipsis })
        .alignRules({
          left: { anchor: "__container__", align: HorizontalAlign.Start },
          right: { anchor: "__container__", align: HorizontalAlign.End },
          top: { anchor: "ivAvatar", align: VerticalAlign.Bottom }
        })
        .margin({ top: $r('app.float.size_5'), left: $r('app.float.size_10'), right: $r('app.float.size_10') })
        .id("tvContent")

      this.videoPlayer(this.item, this.index)
      Row() {
        this.followRowContent($r('app.media.ic_favorite_border_black_20dp'), this.item?.data?.content?.data?.consumption?.collectionCount?.toString())
        this.followRowContent($r('app.media.ic_reply_gray_20dp'), this.item?.data?.content?.data?.consumption?.replyCount?.toString())
        this.followRowContent($r('app.media.ic_star_gray_20dp'), '收藏')
        this.followRowContent($r('app.media.ic_share_gray_20dp'), '')
      }
      .id('follow_row')
      .padding({ top: $r('app.float.size_10'), bottom: $r('app.float.size_10') })
      .margin({ top: $r('app.float.size_5'), left: $r('app.float.size_10'), right: $r('app.float.size_10') })
      .alignRules({
        top: { anchor: "videoPlayer", align: VerticalAlign.Bottom },
        left: { anchor: "__container__", align: HorizontalAlign.Start },
        right: { anchor: "__container__", align: HorizontalAlign.End }
      })
      .justifyContent(FlexAlign.SpaceBetween)

    }
    .width(CommonConstant.MATCH_PARENT)
    .height('340vp')

  }

  @Builder
  followRowContent(resource: Resource, text?: string) {
    Row() {
      Image(resource)
        .width($r('app.float.size_20'))
        .height($r('app.float.size_20'))

      Text(text)
        .fontSize($r('app.float.size_13'))
        .fontColor($r('app.color.color_888888'))
    }
  }

  /**
   * videoPlayer
   */
  @Builder
  videoPlayer(item: Item, index: number) {
    Column() {
      if (this.playIndex == index) {
        VideoComponent({
          showControls: $showControls,
          playUrl: $playUrl,
          isAutoPlay: this.isAutoPlay
        })
          .width('100%')
          .height($r('app.float.size_210'))
      } else {
        Stack() {
          Image(item?.data?.content?.data?.cover?.feed)
            .width("100%")
            .height($r('app.float.size_210'))

          Image($r('app.media.icon_play'))
            .width($r('app.float.size_45'))
            .height($r('app.float.size_45'))
            .onClick(() => {
              this.playIndex = index
              this.playUrl = item?.data?.content?.data?.playUrl
            })
        }
      }
    }
    .alignRules({
      top: { anchor: "tvContent", align: VerticalAlign.Bottom },
      left: { anchor: "__container__", align: HorizontalAlign.Start },
      right: { anchor: "__container__", align: HorizontalAlign.End }
    })
    .margin({ top: $r('app.float.size_5'), left: $r('app.float.size_10'), right: $r('app.float.size_10') })
    .id('videoPlayer')
  }
}

