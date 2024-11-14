/**
 * MainAbility的ViewModel
 */
import { TabItem } from '../common/model/TabItem';

export class MainViewModel {
  /**
   * 首页底部Tab显示数据
   */
  tabTitle: Array<TabItem> = [
    {
      index: 0,
      title: "首页",
      imageActivated: $r('app.media.btn_home_page_selected'),
      imageOriginal: $r('app.media.btn_home_page_normal')
    },
    {
      index: 1,
      title: "社区",
      imageActivated: $r('app.media.btn_community_selected'),
      imageOriginal: $r('app.media.btn_community_normal')
    },
    {
      index: 2,
      title: "通知",
      imageActivated: $r('app.media.btn_notification_selected'),
      imageOriginal: $r('app.media.btn_notification_normal')
    },
    {
      index: 3,
      title: "我的",
      imageActivated: $r('app.media.btn_mine_selected'),
      imageOriginal: $r('app.media.btn_mine_normal')
    }
  ]
}

let mainViewModel = new MainViewModel();

export default mainViewModel as MainViewModel;