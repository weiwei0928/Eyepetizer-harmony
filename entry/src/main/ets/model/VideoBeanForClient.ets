export interface VideoBeanForClient {
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
  descriptionPgc?: string,
  duration?: number,
  favoriteAdTrack?: any,
  id?: number,
  idx?: number,
  ifLimitVideo?: boolean,
  label?: any,
  labelList?: any,
  lastViewTime?: any,
  library?: string,
  playInfo?: any,
  playUrl?: string,
  played?: boolean,
  playlists?: any,
  promotion?: any,
  provider?: Provider,
  reallyCollected?: boolean,
  recallSource?: any,
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
  titlePgc?: string,
  type?: string,
  waterMarks?: any,
  webAdTrack?: any,
  webUrl?: WebUrl
}

export interface Author {
  adTrack: any,
  approvedNotReadyVideoCount?: number,
  description?: string,
  expert?: boolean,
  follow?: Follow,
  icon?: string,
  id?: number,
  ifPgc?: boolean,
  latestReleaseTime?: number,
  link?: string,
  name?: string,
  recSort?: number,
  shield?: Shield,
  videoNum?: number
}

export interface Follow {
  followed?: boolean,
  itemId?: number,
  itemType?: string
}

export interface Shield {
  itemId?: number,
  itemType?: string,
  shielded?: boolean
}

export interface Provider {
  alias?: string,
  icon?: string,
  name?: string
}

export interface Tag {
  actionUrl?: string,
  adTrack?: any,
  bgPicture?: string,
  childTagIdList?: any,
  childTagList?: any,
  communityIndex?: number,
  desc?: string,
  haveReward?: boolean,
  headerImage?: string,
  id?: number,
  ifNewest?: boolean,
  name?: string,
  newestEndTime?: any,
  tagRecType?: string
}

export interface WebUrl {
  forWeibo?: string,
  raw?: string
}

export interface Cover {
  blurred?: string,
  detail?: string,
  feed?: string,
  homepage?: string,
  sharing?: string
}

export interface Consumption {
  collectionCount?: number,
  realCollectionCount?: number,
  replyCount?: number,
  shareCount?: number
}

