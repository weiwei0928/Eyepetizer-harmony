import { CommonType } from '../common/TypeAlias'
import { CommunityRecommend } from '../model/CommunityRecommendModel'
import { FollowModel } from '../model/FollowModel'
import { HomeModel } from '../model/HomeModel'
import axiosClient from './AxiosClient'
import { EyepetizerApi } from './EyepetizerApi'

export class ApiService {
  getHomeData(url?: string) {
    return axiosClient.get<HomeModel>({
      url: url,
      showLoading: false,
    })
  }

  getDiscoveryData() {
    return axiosClient.get<HomeModel>({
      url: EyepetizerApi.HOME_DISCOVERY,
      showLoading: false,
    })
  }

  getDailyData(url?: string) {
    return axiosClient.get<HomeModel>({
      url: url,
      showLoading: false,
    })
  }

  getRecommendData(url?: string) {
    return axiosClient.get<CommunityRecommend>({
      url: url,
      showLoading: true
    })
  }

  getFollowData(url?: string) {
    return axiosClient.get<FollowModel>({
      url: url,
      showLoading: false
    })
  }

  getSearchData() {
    return axiosClient.get<string[]>({
      url: EyepetizerApi.SEARCH_URL,
      showLoading: true,
    })
  }
}

let apiService = new ApiService()

export default apiService as ApiService