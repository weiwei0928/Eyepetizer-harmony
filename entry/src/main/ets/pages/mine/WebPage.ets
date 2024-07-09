import router from '@ohos.router';
import webview from '@ohos.web.webview';
import prompt from '@ohos.promptAction';
import { CommonConstant } from '../../common/constant/CommonConstant';

@Entry
@Component
struct WebPage {
  webController: webview.WebviewController = new webview.WebviewController();
  @State params: object = router.getParams();
  @State progressVal: number = 0;
  @State isLoading: boolean = true;
  @State intervalLoading: number = -1;

  aboutToAppear() {
    this.intervalLoading = setInterval(() => {
      this.progressVal = this.progressVal >= 100 ? 0 : (this.progressVal + 10);
    }, 100);
  }

  build() {
    Stack({ alignContent: Alignment.TopStart }) {
      Column() {
        Web({ src: this.params['path'], controller: this.webController })
          .zoomAccess(false)
          .width(CommonConstant.MATCH_PARENT)
          .height(CommonConstant.MATCH_PARENT)// .aspectRatio(1)
            // .onConfirm((event) => {
            //   AlertDialog.show({
            //     message: WEB_ALERT_DIALOG_TEXT_VALUE + event?.message,
            //     confirm: {
            //       value: $r('app.string.web_alert_dialog_button_value'),
            //       action: () => {
            //         event?.result.handleConfirm();
            //       }
            //     },
            //     cancel: () => {
            //       event?.result.handleCancel();
            //     }
            //   });
            //   return true;
            // })
          .onErrorReceive((event) => {
            if (event?.error.getErrorInfo() === 'ERR_INTERNET_DISCONNECTED') {
              prompt.showToast({
                message: '网络加载失败！',
                duration: 3000
              })
            }
            if (event?.error.getErrorInfo() === 'ERR_CONNECTION_TIMED_OUT') {
              prompt.showToast({
                message: '网络加载失败！',
                duration: 3000
              })
            }
          })
          .onProgressChange((event) => {
            if (event?.newProgress === 100) {
              this.isLoading = false;
              clearInterval(this.intervalLoading);
              this.intervalLoading = -1;
            }
          })

      }
      .width(CommonConstant.MATCH_PARENT)
      .height(CommonConstant.MATCH_PARENT)
      .margin({ top: '17.2%' })

      Row() {
        Image($r('app.media.ic_public_back'))
          .width($r('app.float.size_20'))
          .height($r('app.float.size_20'))
          .margin({ top: '10%', left: '2.3%' })
          .onClick(() => {
            router.back()
          })
      }
      .width(CommonConstant.MATCH_PARENT)

      if (this.isLoading) {
        Progress({
          value: 0,
          total: 100,
          type: ProgressType.ScaleRing
        })
          .color(Color.Grey)
          .value(this.progressVal)
          .width(80)
          .style({
            strokeWidth: 15,
            scaleCount: 15,
            scaleWidth: 5
          })
          .zIndex(1)
          .position({
            x: '40%',
            y: '30%'
          })
      }
    }
    .backgroundColor('#F1F3F5')
    .width(CommonConstant.MATCH_PARENT)
  }
}