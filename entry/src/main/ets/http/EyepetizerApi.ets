export const baseUrl = "https://baobab.kaiyanapp.com/"

export class EyepetizerApi {
  static readonly HOME_DISCOVERY = baseUrl + "api/v7/index/tab/discovery"
  static readonly HOME_RECOMMEND = baseUrl + "api/v5/index/tab/allRec"
  static readonly HOME_DAILY = baseUrl + "api/v5/index/tab/feed"
  static readonly SEARCH_URL = baseUrl + "api/v3/queries/hot"
  static readonly COMMUNITY_RECOMMEND_URL = baseUrl + "api/v7/community/tab/rec"
  static readonly FOLLOW_URL = baseUrl + "api/v6/community/tab/follow"
}