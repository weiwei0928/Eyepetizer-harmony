import { CommunityRecommend, ItemList } from './CommunityRecommendModel';


export class WaterFlowDataSource implements IDataSource {
  private dataArray: ItemList[] = [];
  private listeners: DataChangeListener[] = [];

  public setDataArray(productDataArray: ItemList[]): void {
    this.dataArray = productDataArray;
  }

  public totalCount(): number {
    return this.dataArray.length;
  }

  public getData(index: number): ItemList {
    return this.dataArray[index];
  }

  registerDataChangeListener(listener: DataChangeListener): void {
    if (this.listeners.indexOf(listener) < 0) {
      this.listeners.push(listener);
    }
  }

  unregisterDataChangeListener(listener: DataChangeListener): void {
    let pos = this.listeners.indexOf(listener);
    if (pos >= 0) {
      this.listeners.splice(pos, 1);
    }
  }
}