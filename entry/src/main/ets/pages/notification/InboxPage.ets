import { CommonConstant } from '../../common/constant/CommonConstant'
import { NotificationLoginTips } from './NotificationLoginTips'

@Component
export struct InboxPage {
  build() {
    Column() {
      NotificationLoginTips()
    }
    .width(CommonConstant.MATCH_PARENT)
    .height(CommonConstant.MATCH_PARENT)
  }
}