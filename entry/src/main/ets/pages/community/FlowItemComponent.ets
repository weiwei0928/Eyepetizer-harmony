import { CommonConstant } from '../../common/constant/CommonConstant';
import { ItemList } from '../../model/CommunityRecommendModel';


@Component
export default struct FlowItemComponent {
  @State item: ItemList = {}

  build() {
    Stack() {
      // Flex({ direction: FlexDirection.Column }) {
      Column() {
        Image(this.item?.data?.content?.data?.cover?.feed)
          .objectFit(ImageFit.Contain)
          .width(CommonConstant.MATCH_PARENT)
          .margin({
            bottom: $r('app.float.size_4'),
          })
          .alt("#ccededed")
          // .layoutWeight(1)
          // .autoResize(true)
          // .aspectRatio(this.getAspectRatio())
        Text(this.item?.data?.content?.data?.description)
          .fontSize(CommonConstant.FONT_SIZE_12)
          .maxLines(3)
        Row() {
          Image(this.item?.data?.content?.data?.owner?.avatar)
            .objectFit(ImageFit.Contain)
            .width($r('app.float.size_20'))
            .height($r('app.float.size_20'))
          Text(this.item?.data?.content?.data?.owner?.nickname)
            .fontSize(CommonConstant.FONT_SIZE_12)
            .fontColor($r('app.color.color_888888'))
          Blank()
          Text(this.item?.data?.content?.data?.consumption?.collectionCount.toString())
            .fontSize(CommonConstant.FONT_SIZE_12)
          Image($r('app.media.ic_favorite_border_black_20dp'))
            .objectFit(ImageFit.Contain)
            .width($r('app.float.size_18'))
            .height($r('app.float.size_18'))
            .margin({left: $r('app.float.size_8'), right: $r('app.float.size_4')})


        }
        .width(CommonConstant.MATCH_PARENT)
        .margin({
          top: $r('app.float.size_4'),
          bottom: $r('app.float.size_4')
        })
      }
      .width(CommonConstant.MATCH_PARENT)
    }
  }
}

@Preview
@Component
export struct FlowItemComponentPreview {
  build() {
    Stack() {
      FlowItemComponent({ item: {
        "data": {
          "dataType": "FollowCard",
          "header": {
            "id": 315396,
            "actionUrl": "eyepetizer://pgc/detail/303343704/?title=%E4%B9%8C%E8%8B%8F%E5%B0%91%E5%B9%B4&userType=NORMAL&tabIndex=0",
            "labelList": null,
            "icon": "http://ali-img.kaiyanapp.com/f7892c6ac9d6e9611cbad07deeef172f.jpeg?image_process=image/auto-orient,1/resize,w_360/format,webp/interlace,1/quality,q_80",
            "iconType": "round",
            "time": 1661916434000,
            "showHateVideo": false,
            "followType": "user",
            "tagId": 0,
            "tagName": null,
            "issuerName": "乌苏少年",
            "topShow": false
          },
          "content": {
            "type": "video",
            "data": {
              "dataType": "UgcVideoBean",
              "id": 315396,
              "title": "",
              "description": "时隔六年，他的声音，再次唤醒了我们对平凡生活的向往。",
              "library": "DEFAULT",
              "tags": [{
                "id": 1604,
                "name": "跟着电影去旅行",
                "actionUrl": "eyepetizer://tag/1604/?title=%E8%B7%9F%E7%9D%80%E7%94%B5%E5%BD%B1%E5%8E%BB%E6%97%85%E8%A1%8C",
                "adTrack": null,
                "desc": "打卡荧幕上的同款风景",
                "bgPicture": "http://img.kaiyanapp.com/0c5a833dd888f324ec20458babce2ed0.jpeg?imageMogr2/quality/60/format/jpg",
                "headerImage": "http://img.kaiyanapp.com/0c5a833dd888f324ec20458babce2ed0.jpeg?imageMogr2/quality/60/format/jpg",
                "tagRecType": "NORMAL",
                "childTagList": null,
                "childTagIdList": null,
                "haveReward": false,
                "ifNewest": false,
                "newestEndTime": null,
                "communityIndex": 2
              }],
              "consumption": {
                "collectionCount": 64,
                "shareCount": 0,
                "replyCount": 0,
                "realCollectionCount": 5
              },
              "resourceType": "ugc_video",
              "uid": 303343704,
              "createTime": 1661916434000,
              "updateTime": 1662480155000,
              "collected": false,
              "reallyCollected": false,
              "owner": {
                "uid": 303343704,
                "nickname": "乌苏少年",
                "avatar": "http://ali-img.kaiyanapp.com/f7892c6ac9d6e9611cbad07deeef172f.jpeg?image_process=image/auto-orient,1/resize,w_360/format,webp/interlace,1/quality,q_80",
                "userType": "NORMAL",
                "ifPgc": false,
                "description": "人生就是一场孤独的旅行",
                "area": null,
                "gender": "male",
                "registDate": 1571538610000,
                "releaseDate": 1718871354000,
                "cover": "http://ali-img.kaiyanapp.com/f9a3fddd3f0941404f4b1d30235c2952.png?imageMogr2/quality/60/format/jpg",
                "actionUrl": "eyepetizer://pgc/detail/303343704/?title=%E4%B9%8C%E8%8B%8F%E5%B0%91%E5%B9%B4&userType=NORMAL&tabIndex=0",
                "followed": false,
                "limitVideoOpen": false,
                "library": "BLOCK",
                "birthday": 0,
                "country": "中国",
                "city": "成都市",
                "university": "",
                "job": "自由职业者",
                "expert": false
              },
              "cover": {
                "feed": "http://ali-img.kaiyanapp.com/b91c10d2018fc84b2c7678c23693fc7d.jpeg?imageMogr2/quality/60/format/jpg",
                "detail": "http://ali-img.kaiyanapp.com/b91c10d2018fc84b2c7678c23693fc7d.jpeg?imageMogr2/quality/60/format/jpg",
                "blurred": null,
                "sharing": null,
                "homepage": null
              },
              "selectedTime": null,
              "checkStatus": "CHECKED",
              "area": "成都市",
              "city": "成都市",
              "longitude": 104.1779758,
              "latitude": 30.5690633,
              "ifMock": false,
              "validateStatus": "SUBMIT",
              "validateResult": "DEFAULT",
              "width": 1920,
              "height": 1080,
              "addWatermark": true,
              "recentOnceReply": null,
              "privateMessageActionUrl": "eyepetizer://privateMessage/detail?privateMessageId=-1&anotherUid=303343704&nick=%E4%B9%8C%E8%8B%8F%E5%B0%91%E5%B9%B4",
              "source": "",
              "playUrl": "http://baobab.kaiyanapp.com/api/v1/playUrl?vid=315396&resourceType=ugc_video&editionType=default&source=aliyun&playUrlType=url_oss&udid=ef57fbfab81bbdc2",
              "status": "ONLINE",
              "releaseTime": 1661916434000,
              "duration": 99,
              "transId": null,
              "type": "COMMON",
              "validateTaskId": "vi7TDqQqeQ4YZ4Eh9gipw9so-1wL7Mj",
              "playUrlWatermark": "http://baobab.kaiyanapp.com/api/v1/playUrl?vid=315396&resourceType=ugc_video&editionType=default&source=aliyun&playUrlType=play_url_watermark&udid=ef57fbfab81bbdc2"
            },
            "trackingData": null,
            "tag": null,
            "id": 0,
            "adIndex": -1
          },
          "adTrack": null
        },
        "trackingData": null,
        "tag": null,
        "id": 837358,
        "adIndex": -1
      } })
    }
  }
}