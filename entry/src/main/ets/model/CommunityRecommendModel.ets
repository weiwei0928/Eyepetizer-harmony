import { CommonType } from '../common/TypeAlias';
import { Label } from './HomeModel';
import { Consumption, Cover, Tag } from './VideoBeanForClient';

export interface CommunityRecommend {
  itemList: ItemList[];
  count: number;
  total: number;
  nextPageUrl?: string;
  adExist: boolean;
}

export interface ItemList {
  type?: string;
  data?: Data;
  trackingData?: string;
  tag?: string;
  id?: number;
  adIndex?: number;
}

export interface Data {
  adTrack?: string;
  content?: Content;
  count?: number;
  dataType?: string;
  footer?: CommonType;
  header?: Header;
  itemList?: ItemX[];
}

export interface Header {
  actionUrl?: string;
  followType?: string;
  icon?: string;
  iconType?: string;
  id?: number;
  issuerName?: string;
  labelList?: CommonType;
  showHateVideo?: boolean;
  tagId: number,
  tagName: string,
  time?: number;
  topShow: boolean

}

export interface Content {
  type?: string;
  data?: DataX;
  trackingData?: string;
  tag?: string;
  id?: number;
  adIndex?: number;
}

export interface ItemX {
  data?: DataXX;
  type?: string;
  tag?: string;
  id?: number;
  adIndex?: number;
}

export interface DataX {
  addWatermark?: Boolean,
  area?: string,
  checkStatus?: string,
  city?: string,
  collected?: Boolean,
  consumption?: Consumption,
  cover?: Cover;
  createTime?: number,
  dataType?: string;
  description?: string;
  duration?: number;
  height?: number,
  id?: number,
  ifMock?: boolean,
  latitude?: number,
  library?: string;
  longitude?: number,
  owner?: Owner,
  playUrl?: string,
  playUrlWatermark?: string,
  privateMessageActionUrl?: string,
  source?: string,
  reallyCollected?: boolean,
  recentOnceReply?: RecentOnceReply,
  releaseTime?: number,
  resourceType?: string,
  selectedTime?: number,
  status?: string,
  title?: string;
  tags?: Tag[],
  transId?: string,
  type?: string;
  uid?: number,
  updateTime?: number,
  url?: string,
  urls?: string[],
  urlsWithWatermark?: string[],
  validateResult?: string,
  validateStatus?: string,
  validateTaskId?: string,
  width?: number
}

export interface Owner {
  actionUrl?: string,
  area?: CommonType,
  avatar?: string,
  birthday?: number,
  city?: string,
  country?: string,
  cover?: string,
  description?: string,
  expert?: boolean,
  followed?: boolean,
  gender?: string,
  ifPgc?: boolean,
  job?: string,
  library?: string,
  limitVideoOpen?: boolean,
  nickname?: string,
  registDate?: number,
  releaseDate?: number,
  uid?: number,
  university?: string,
  userType?: string
}


export interface RecentOnceReply {
  actionUrl?: string;
  contentType?: CommonType;
  dataType?: string;
  message?: string;
  nickname?: string;
}

export interface DataXX {
  actionUrl?: string,
  adTrack?: string,
  autoPlay?: boolean,
  bgPicture?: string,
  dataType?: string,
  description?: string,
  header?: HeaderX,
  id?: number;
  image?: string,
  label?: Label,
  labelList?: CommonType,
  shade?: boolean,
  subTitle?: string,
  title?: string
}
export interface HeaderX {
  actionUrl?: string,
  cover?: string,
  description?: string,
  font?: string,
  icon?: string,
  id?: number,
  label?: string,
  labelList?: CommonType,
  rightText?: string,
  subTitle?: string,
  subTitleFont?: CommonType,
  textAlign?: string,
  title?: string
}
