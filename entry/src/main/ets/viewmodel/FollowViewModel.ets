import apiService from '../http/ApiService';
import { FollowModel } from '../model/FollowModel';
import { BaseViewModel, ResultCallback } from './BaseViewModel';

class FollowViewModel extends BaseViewModel {

  async getFollowData(url?: string, result?: ResultCallback<FollowModel>) {
    await this.httpRequest(apiService.getFollowData(url))
      .then((response) => {
        result?.(response)
      })
  }
}

let recommendViewModel = new FollowViewModel();

export default recommendViewModel as FollowViewModel;