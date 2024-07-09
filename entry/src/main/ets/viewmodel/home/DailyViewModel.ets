import apiService from '../../http/ApiService';
import { HomeModel } from '../../model/HomeModel';
import { BaseViewModel, ResultCallback } from '../BaseViewModel';

class DailyViewModel extends BaseViewModel {

  async getDailyData(url?: string, result?: ResultCallback<HomeModel>) {
    await this.httpRequest(apiService.getDailyData(url))
      .then((response) => {
        result?.(response)
      })
  }
}

let dailyViewModel = new DailyViewModel();

export default dailyViewModel as DailyViewModel;