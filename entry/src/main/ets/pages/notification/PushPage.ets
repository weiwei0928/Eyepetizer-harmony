import { CommonConstant } from '../../common/constant/CommonConstant'
import { NotificationLoginTips } from './NotificationLoginTips'

@Entry
@Component
export struct PushPage {
  build() {
    Column(){
      NotificationLoginTips()
    }
    .width(CommonConstant.MATCH_PARENT)
    .height(CommonConstant.MATCH_PARENT)
  }
}