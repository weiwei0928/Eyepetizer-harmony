import apiService from '../../http/ApiService';
import { HomeModel } from '../../model/HomeModel';
import { BaseViewModel, ResultCallback } from '../BaseViewModel';

class DailyViewModel extends BaseViewModel {

   getDailyData(url?: string, result?: ResultCallback<HomeModel>) {
     return this.httpRequest(apiService.getDailyData(url))
      .then((response) => {
        result?.(response)
      })
  }
}

let dailyViewModel = new DailyViewModel();

export default dailyViewModel as DailyViewModel;