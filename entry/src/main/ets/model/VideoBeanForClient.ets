import { CommonType } from '@ohos/pulltorefresh/src/main/ets/components/PullToRefresh/TypeAlias'

export interface VideoBeanForClient {
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
  descriptionPgc?: string,
  duration?: number,
  favoriteAdTrack?: CommonType,
  id?: number,
  idx?: number,
  ifLimitVideo?: boolean,
  label?: CommonType,
  labelList?: CommonType,
  lastViewTime?: CommonType,
  library?: string,
  playInfo?: CommonType,
  playUrl?: string,
  played?: boolean,
  playlists?: CommonType,
  promotion?: CommonType,
  provider?: Provider,
  reallyCollected?: boolean,
  recallSource?: CommonType,
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
  titlePgc?: string,
  type?: string,
  waterMarks?: CommonType,
  webAdTrack?: CommonType,
  webUrl?: WebUrl
}

export interface Author {
  adTrack: CommonType,
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
  adTrack?: CommonType,
  bgPicture?: string,
  childTagIdList?: CommonType,
  childTagList?: CommonType,
  communityIndex?: number,
  desc?: string,
  haveReward?: boolean,
  headerImage?: string,
  id?: number,
  ifNewest?: boolean,
  name?: string,
  newestEndTime?: CommonType,
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

