@Entry
@Component
struct Index {
  @State message: string = 'Hello'

  build() {
    Row() {
      Column() {
        Text(this.message)
          .fontSize(50)
          .fontWeight(FontWeight.Bold)
      }
      // .width('100%')

      Text("哈哈哈哈")
        .fontSize(20)
    }
    // .alignItems(VerticalAlign.Center)
    .justifyContent(FlexAlign.SpaceEvenly)
    .height('100%')
    .width('100%')
  }
}