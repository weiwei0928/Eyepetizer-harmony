import { CommonType } from '../common/TypeAlias';
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
  tag?: string;
  id?: number;
  adIndex?: number;
}


export interface Data {
  adTrack?: string;
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
  tag?: string;
  id?: number;
  adIndex?: number;
}


export interface FollowCard {
  ad?: boolean,
  adTrack?: string,
  author?: Author,
  brandWebsiteInfo?: string,
  campaign?: string,
  category?: string,
  collected?: boolean,
  consumption?: Consumption,
  cover?: Cover,
  dataType?: string,
  date?: number,
  description?: string,
  descriptionEditor?: string,
  descriptionPgc?: string,
  duration?: number,
  favoriteAdTrack?: string,
  id?: number,
  idx?: number,
  ifLimitVideo?: boolean,
  label?: string,
  labelList?: CommonType,
  lastViewTime?: string,
  library?: string,
  playInfo?: PlayInfo[],
  playUrl?: string,
  played?: boolean,
  playlists?: CommonType,
  promotion?: string,
  provider?: Provider,
  reallyCollected?: boolean,
  releaseTime?: number,
  remark?: string,
  resourceType?: string,
  searchWeight?: number,
  shareAdTrack?: string,
  slogan?: string,
  src?: string,
  subtitles?: string,
  tags?: Tag[],
  thumbPlayUrl?: string,
  title?: string,
  titlePgc?: string,
  type?: string,
  waterMarks?: string,
  webAdTrack?: string,
  webUrl?: WebUrl
}

export interface Label {
  actionUrl?: string;
  text?: string;
  card?: string;
  detail?: string;
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

