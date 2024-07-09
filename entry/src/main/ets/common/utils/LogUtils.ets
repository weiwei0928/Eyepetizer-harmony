
import hilog from '@ohos.hilog';
import printer from './Printer';

const prefix: string = 'eyepetizer_harmony';

const format = `%{public}s, %{public}s`
const domain = 0xFF00

export function logDebug(...args: string[]) {
  hilog.debug(domain, prefix, format, args);
}

export function logInfo(...args: string[]) {
  hilog.info(domain, prefix, format, args);
}

export function logWarn(...args: string[]) {
  hilog.warn(domain, prefix, format, args);
}

export function loge(...args: string[]) {
  hilog.error(domain, prefix, format, args);
}

export function logFatal(...args: string[]) {
  hilog.fatal(domain, prefix, format, args);
}

export function logJson(data: any, prefix?: string) {
  printer.info(data, prefix)
}