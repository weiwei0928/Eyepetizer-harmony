import hilog from '@ohos.hilog';


export class Printer {
  private enable: boolean = true;

  getEnablePrint() {
    return this.enable;
  }

  enablePrint(enablePrint: boolean) {
    this.enable = enablePrint
  }

  debug(data: any, prefix?: string, stackTrace?: Error) {
    if (!this.enable) {
      return;
    }
    this.jsonPrint(data, PrinterLevel.DEBUG, prefix, stackTrace)
  }

  info(data: any, prefix?: string, stackTrace?: Error) {
    if (!this.enable) {
      return;
    }
    this.jsonPrint(data, PrinterLevel.INFO, prefix, stackTrace)
  }

  warn(data: any, prefix?: string, stackTrace?: Error) {
    if (!this.enable) {
      return;
    }
    this.jsonPrint(data, PrinterLevel.WARN, prefix, stackTrace)
  }

  error(data: any, prefix?: string, stackTrace?: Error) {
    if (!this.enable) {
      return;
    }
    this.jsonPrint(data, PrinterLevel.ERROR, prefix, stackTrace)
  }

  private jsonPrint(data: any, level: PrinterLevel, prefix?: string, stackTrace?: Error) {

    let top =
      "┌------------------------------------------------------------------------------------------------------------------------------------------┐";
    let bottom =
      "└------------------------------------------------------------------------------------------------------------------------------------------┘";

    if (stackTrace != undefined && stackTrace != null) {
      let stackInfo = stackTrace.stack;
      stackInfo = "------ " + stackInfo.substring(
        stackInfo.indexOf("(") + 1, stackInfo.lastIndexOf(")")) + " ";
      top = top.replace("-------------------", stackInfo)
      bottom = bottom.replace("-------------------", stackInfo)
    }
    this._print(top, level, prefix);

    if (prefix != undefined && prefix != null && prefix.trim().length != 0) {
      this._print('|\t' + prefix, level, prefix);
    }

    let s = "";
    if (data != undefined) {
      s = JSON.stringify(data, null, 2)
      const ss = s.split('\n')
      ss.forEach((value: string, _: number, __: string[]) => {
        this._print('|\t' + value, level, prefix)
      })
    } else {
      this._print(s, level, prefix)
    }

    this._print(bottom, level, prefix);
  }

  private _print(content: any, level: PrinterLevel, tag: string) {
    switch (level) {
      case PrinterLevel.DEBUG:
        hilog.debug(0x0000, tag, 'DEBUG--> %{public}s', content);
        break;
      case PrinterLevel.INFO:
        hilog.info(0x0000, tag, 'INFO--> %{public}s', content);
        break
      case PrinterLevel.WARN:
        hilog.warn(0x0000, tag, 'WARN--> %{public}s', content);
        break
      case PrinterLevel.ERROR:
        hilog.error(0x0000, tag, 'ERROR--> %{public}s', content);
        break
    }
  }
}

enum PrinterLevel {
  DEBUG = 3,
  INFO = 4,
  WARN = 5,
  ERROR = 6,
}


let printer: Printer = new Printer();

export default printer;
