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
  tag?: any;
  id?: number;
  adIndex?: number;
}


export interface Data {
  adTrack?: any;
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
  labelList?: any;
  showHateVideo?: boolean;
  tagId?: number;
  tagName?: string;
  time?: number;
  topShow?: boolean;
}


export interface Content {
  type?: string;
  data?: FollowCard;
  tag?: any;
  id?: number;
  adIndex?: number;
}


export interface FollowCard {
  ad?: boolean,
  adTrack?: any,
  author?: Author,
  brandWebsiteInfo?: any,
  campaign?: any,
  category?: string,
  collected?: boolean,
  consumption?: Consumption,
  cover?: Cover,
  dataType?: string,
  date?: number,
  description?: string,
  descriptionEditor?: string,
  descriptionPgc?: any,
  duration?: number,
  favoriteAdTrack?: any,
  id?: number,
  idx?: number,
  ifLimitVideo?: boolean,
  label?: any,
  labelList?: any,
  lastViewTime?: any,
  library?: string,
  playInfo?: PlayInfo[],
  playUrl?: string,
  played?: boolean,
  playlists?: any,
  promotion?: any,
  provider?: Provider,
  reallyCollected?: boolean,
  releaseTime?: number,
  remark?: string,
  resourceType?: string,
  searchWeight?: number,
  shareAdTrack?: any,
  slogan?: any,
  src?: any,
  subtitles?: any,
  tags?: Tag[],
  thumbPlayUrl?: any,
  title?: string,
  titlePgc?: any,
  type?: string,
  waterMarks?: any,
  webAdTrack?: any,
  webUrl?: WebUrl
}

export interface Label {
  actionUrl?: string;
  text?: string;
  card?: string;
  detail?: any;
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

