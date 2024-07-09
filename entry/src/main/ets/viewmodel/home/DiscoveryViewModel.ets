import apiService from '../../http/ApiService';
import { HomeModel } from '../../model/HomeModel';
import { BaseViewModel, ResultCallback } from '../BaseViewModel';

export class DiscoveryViewModel extends BaseViewModel {
  async getDiscoveryData(result?: ResultCallback<HomeModel>) {
    await this.httpRequest(apiService.getDiscoveryData())
      .then((response) => {
        result?.(response)
      })
  }
}

let discoveryViewModel = new DiscoveryViewModel();

export default discoveryViewModel as DiscoveryViewModel;