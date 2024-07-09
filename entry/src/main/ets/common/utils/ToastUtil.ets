import promptAction from '@ohos.promptAction'


export default function showToast(message: string | Resource, duration: number = 1000, bottom: string | number = "center") {
  try {
    promptAction.showToast({
      message: message,
      duration: duration,
      bottom: bottom,
    })
  } catch (error) {
    console.error(`showToast args error code is ${error.code}, message is ${error.message}`);
  }
}
