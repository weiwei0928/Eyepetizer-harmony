import router from '@ohos.router'
import { CommonConstant } from '../common/constant/CommonConstant'
import showToast from '../common/utils/ToastUtil'
import searchViewModel from '../viewmodel/SearchViewModel'

@Entry
@Component
struct SearchPage {
  @State changeValue: string = ''
  @State submitValue: string = ''
  controller: SearchController = new SearchController()
  @State data: string[] = []

  pageTransition() {
    // 定义页面进入时的效果，从Top侧滑入，时长为1000ms
    // PageTransitionEnter({ type: RouteType.Push, duration: 1000 })
    //   .slide(SlideEffect.Top)
    // 定义页面进入时的效果，从top侧滑入，时长为1200ms，无论页面栈发生push还是pop操作均可生效
    PageTransitionEnter({ type: RouteType.None, duration: 500 })
      .slide(SlideEffect.Top)
    // 定义页面退出时的效果，向左侧滑出，时长为1000ms，无论页面栈发生push还是pop操作均可生效
    // PageTransitionExit({ type: RouteType.None, duration: 500 })
    //   .slide(SlideEffect.Top)
  }

  aboutToAppear() {
    // windowManager.settingStatusBarDark()
    // windowManager.disableFullScreen()
    this.getData()
  }

  getData() {
    searchViewModel.getSearchData((result) => {
      this.data = result
    })
  }

  build() {
    Column() {
      Row() {
        Search({
          value: this.changeValue,
          placeholder: '搜索视频、作者、用户及标签',
          controller: this.controller
        })
          .height(34)
          .backgroundColor('#F5F5F5')
          .placeholderColor(Color.Grey)
          .placeholderFont({ size: 14 })
          .textFont({ size: 14 })
          .onSubmit((value: string) => {
            this.submitValue = value
          })
          .onChange((value: string) => {
            this.changeValue = value
          })
          .width('85%')
        Text('取消')
          .onClick(() => {
            // 设置光标位置到输入的第一个字符后
            // this.controller.caretPosition(1)
            router.back()
          })
          .margin({ left: 15, right: 15 })
      }
      .width(CommonConstant.MATCH_PARENT)

      Text($r('app.string.hot_keywords'))
        .fontSize($r('app.float.font_size_25fp'))
        .textAlign(TextAlign.Start)
        .fontWeight(FontWeight.Bold)
        .width(CommonConstant.MATCH_PARENT)
        .margin({ left: $r('app.float.size_20'), top: 20 })

      List({ space: 20, initialIndex: 0 }) {
        ForEach(this.data, (item: string) => {
          ListItem() {
            Text(item)
              .fontSize(16)
              .textAlign(TextAlign.Center)
              .fontColor(Color.Blue)
          }
        }, (item: string) => item)
      }
      .listDirection(Axis.Vertical) // 排列方向
      .divider({ strokeWidth: 1 })
      .margin({ left: 20, top: 20 })
      .onClick(() => {
        showToast($r('app.string.currently_not_supported'))
      })
    }
    .width(CommonConstant.MATCH_PARENT)
    .height(CommonConstant.MATCH_PARENT)
    .margin({ top: AppStorage.get('topHeight') as number })
  }
}