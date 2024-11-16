import { CommonType } from "../common/TypeAlias";

/**
 * 定义接口响应包装类
 */
export interface ApiResponse<T = CommonType> {
  errorCode: number
  errorMsg: string
  data: T | CommonType;
}