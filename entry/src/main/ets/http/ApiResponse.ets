/**
 * 定义接口响应包装类
 */
export interface ApiResponse<T = any> {
  errorCode: number
  errorMsg: string
  data: T | any;
}