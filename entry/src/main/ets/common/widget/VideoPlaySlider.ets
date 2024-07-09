/**
 * video slider component
 */
import { CommonConstant } from '../constant/CommonConstant';

@Component
export struct VideoSlider {
  @Consume isOpacity: boolean;
  private controller: VideoController = new VideoController();
  @Consume currentStringTime: string;
  @Consume currentTime: number;
  @Consume durationTime: number;
  @Consume durationStringTime: string;
  @Consume isPlay: boolean;
  @Consume flag: boolean;
  @Consume isLoading: boolean;
  @Consume progressVal: number;

  build() {
    Row({ space: '12vp'}) {
      Image(this.isPlay ? $r('app.media.ic_pause') : $r('app.media.ic_play'))
        .width($r('app.float.size_24'))
        .height($r('app.float.size_24'))
        .margin({ left: $r('app.float.size_12')})
        .onClick(() => {
          this.iconOnclick();
        })
      Text(this.currentStringTime)
        .fontSize($r('app.float.font_size_16fp'))
        .fontColor(Color.White)
        .margin({ left: $r('app.float.size_12')})
      Slider({
        value: this.currentTime,
        min: 0,
        max: this.durationTime,
        step: 1,
        style: SliderStyle.OutSet
      })
        .blockColor($r('app.color.white'))
        .width('46.7%')
        .trackColor(Color.Gray)
        .selectedColor($r("app.color.white"))
        .showSteps(true)
        .showTips(true)
        .trackThickness(this.isOpacity ? 2 : 4)
        .onChange((value: number, mode: SliderChangeMode) => {
          this.sliderOnchange(value, mode);
        })
      Text(this.durationStringTime)
        .fontSize($r('app.float.font_size_16fp'))
        .margin({ right: $r('app.float.size_12') })
        .fontColor(Color.White)
    }
    .opacity(this.isOpacity ?  Number.parseFloat('0.2') : 1)
    .width(CommonConstant.MATCH_PARENT)
    .alignItems(VerticalAlign.Center)
    .justifyContent(FlexAlign.Center)
  }

  /**
   * icon onclick callback
   */
  iconOnclick() {
    if (this.isPlay === true) {
      this.controller.pause()
      this.isPlay = false;
      this.isOpacity = false;
      return;
    }
    if (this.flag === true) {
      this.controller.start();
      this.isPlay = true;
      this.isOpacity = true;
    } else {
      this.isLoading = true;
      // The video loading is not complete. The loading action is displayed.
      let intervalLoading = setInterval(() => {
        if (this.progressVal >= 100) {
          this.progressVal = 0;
        } else {
          this.progressVal += 10;
        }
      }, 100)
      // The scheduled task determines whether the video loading is complete.
      let intervalFlag = setInterval(() => {
        if (this.flag === true) {
          this.controller.start();
          this.isPlay = true;
          this.isOpacity = true;
          this.isLoading = false;
          clearInterval(intervalFlag);
          clearInterval(intervalLoading);
        }
      }, 100);
    }
  }

  /**
   * video slider component onchange callback
   */
  sliderOnchange(value: number, mode: SliderChangeMode) {
    this.currentTime = Number.parseInt(value.toString());
    this.controller.setCurrentTime(Number.parseInt(value.toString()), SeekMode.Accurate);
    if (mode === SliderChangeMode.Begin || mode === SliderChangeMode.Moving) {
      this.isOpacity = false;
    }
    if (mode === SliderChangeMode.End) {
      this.isOpacity = true;
    }
  }
}