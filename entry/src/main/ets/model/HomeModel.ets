import { CommonType } from '../common/TypeAlias';
import { Cover, Follow } from './VideoBeanForClient';

/**
 * 发现、推荐、日报的数据都是同样的结构
 * */
export interface HomeModel {
  itemList: ItemList[];
  count: number;
  total: number;
  nextPageUrl?: string;
  adExist: boolean;
}


export interface ItemList {
  type?: string;
  data?: Data;
  trackingData?: CommonType;
  tag?: CommonType;
  id?: number;
  adIndex?: number;
}


export interface Data {
  dataType?: string;
  type?: string;
  header?: Header;
  itemList?: ItemList[];
  count?: number;
  adTrack?: string;
  footer?: CommonType;
  text?: string;
  follow?: Follow;
  rightText?: string;
  title?: string;
  image?: string;
  cover?: Cover;
  duration?: number;
  category?: string;
  library?: string;
  description?: string;
  icon?: string;
  label?: Label;
  content?: Content;
  ad?: boolean;
  titleList?: string[];
}


export interface Header {
  id?: number;
  title?: string;
  font?: string;
  subTitle?: string;
  subTitleFont?: string;
  textAlign?: string;
  cover?: string;
  label?: string;
  actionUrl?: string;
  labelList?: CommonType;
  rightText?: string;
  icon?: string;
  iconType?: string;
  description?: string;
  time?: number;
  showHateVideo?: boolean;
}


export interface Content {
  type?: string;
  data?: Data;
  trackingData?: CommonType;
  tag?: string;
  id?: number;
  adIndex?: number;
}

export interface Label {
  actionUrl?: string;
  text?: string;
  card?: string;
  detail?: string;
}


