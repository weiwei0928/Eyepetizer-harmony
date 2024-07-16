import { CommonType } from '@ohos/pulltorefresh/src/main/ets/components/PullToRefresh/TypeAlias';
import { Author, Consumption, Cover, Provider, Tag, WebUrl } from './VideoBeanForClient';

export interface FollowModel {
  itemList: Item[];
  count: number;
  total: number;
  nextPageUrl?: string;
  adExist: boolean;
}


export interface Item {
  type?: string;
  data?: Data;
  tag?: CommonType;
  id?: number;
  adIndex?: number;
}


export interface Data {
  adTrack?: CommonType;
  content?: Content;
  header?: Header;
  dataType?: string;
  type?: string;
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
  tagId?: number;
  tagName?: string;
  time?: number;
  topShow?: boolean;
}


export interface Content {
  type?: string;
  data?: FollowCard;
  tag?: CommonType;
  id?: number;
  adIndex?: number;
}


export interface FollowCard {
  ad?: boolean,
  adTrack?: CommonType,
  author?: Author,
  brandWebsiteInfo?: CommonType,
  campaign?: CommonType,
  category?: string,
  collected?: boolean,
  consumption?: Consumption,
  cover?: Cover,
  dataType?: string,
  date?: number,
  description?: string,
  descriptionEditor?: string,
  descriptionPgc?: CommonType,
  duration?: number,
  favoriteAdTrack?: CommonType,
  id?: number,
  idx?: number,
  ifLimitVideo?: boolean,
  label?: CommonType,
  labelList?: CommonType,
  lastViewTime?: CommonType,
  library?: string,
  playInfo?: PlayInfo[],
  playUrl?: string,
  played?: boolean,
  playlists?: CommonType,
  promotion?: CommonType,
  provider?: Provider,
  reallyCollected?: boolean,
  releaseTime?: number,
  remark?: string,
  resourceType?: string,
  searchWeight?: number,
  shareAdTrack?: CommonType,
  slogan?: CommonType,
  src?: CommonType,
  subtitles?: CommonType,
  tags?: Tag[],
  thumbPlayUrl?: CommonType,
  title?: string,
  titlePgc?: CommonType,
  type?: string,
  waterMarks?: CommonType,
  webAdTrack?: CommonType,
  webUrl?: WebUrl
}

export interface Label {
  actionUrl?: string;
  text?: string;
  card?: string;
  detail?: CommonType;
}
export interface PlayInfo {
  height?: number;
  name?: string;
  type?: string;
  url?: string;
  urlList?: Url[];
  width?: number;
}
export interface Url {
  name?: string;
  size?: string;
  url?: string;
}

