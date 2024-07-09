import apiService from '../../http/ApiService';
import { CommunityRecommend } from '../../model/CommunityRecommendModel';
import { BaseViewModel, ResultCallback } from '../BaseViewModel';

class RecommendViewModel extends BaseViewModel {

  async getRecommendData(url?: string, result?: ResultCallback<CommunityRecommend>) {
    await this.httpRequest(apiService.getRecommendData(url))
      .then((response) => {
        result?.(response)
      })
  }
}

let recommendViewModel = new RecommendViewModel();

export default recommendViewModel as RecommendViewModel;