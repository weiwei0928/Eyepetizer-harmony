import apiService from '../http/ApiService';
import { HomeModel } from '../model/HomeModel';
import { BaseViewModel, ResultCallback } from './BaseViewModel';


/**
 * 主页ViewModel
 */
class IndexViewModel extends BaseViewModel {

  async getHomeData(url?: string, result?: ResultCallback<HomeModel>){
    await this.httpRequest(apiService.getHomeData(url))
      .then((response) => {
        result?.(response)
      })
  }
}

/**
 * 主页底部标签
 */
export class IndexTab {
  title: string;
  iconActive: Resource;
  iconOriginal: Resource;

  constructor(title: string, iconActive: Resource, iconOriginal: Resource) {
    this.title = title
    this.iconActive = iconActive
    this.iconOriginal = iconOriginal
  }
}

let indexViewModel = new IndexViewModel();

export default indexViewModel as IndexViewModel;