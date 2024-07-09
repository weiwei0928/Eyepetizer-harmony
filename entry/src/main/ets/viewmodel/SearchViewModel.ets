import List from '@ohos.util.List';
import apiService from '../http/ApiService';
import { BaseViewModel, ResultCallback } from '../viewmodel/BaseViewModel';

class SearchViewModel extends BaseViewModel {
  async getSearchData(result?: ResultCallback<string[]>) {
    await this.httpRequest(apiService.getSearchData())
      .then((response) => {
        result?.(response)
      })
  }
}

let searchViewModel = new SearchViewModel();

export default searchViewModel as SearchViewModel;