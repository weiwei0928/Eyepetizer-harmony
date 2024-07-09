/*
 * Copyright (C) 2022 Huawei Device Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */
export class PullToRefreshConfigurator {
  private hasRefresh?: boolean = true; // 是否具有下拉刷新功能
  private hasLoadMore?: boolean = true; // 是否具有上拉加载功能
  private maxTranslate?: number = 100; // 可下拉上拉的最大距离
  private sensitivity?: number = 0.7; // 下拉上拉灵敏度
  private listIsPlacement?: boolean = true; // 滑动结束后列表是否归位
  private animDuration?: number = 150; // 滑动结束后，回弹动画执行时间
  private refreshHeight?: number = 30; // 下拉动画高度
  private refreshColor?: string = '#000000'; // 下拉动画颜色
  private refreshBackgroundColor?: ResourceColor = 'rgba(0,0,0,0)'; // 下拉动画区域背景色
  private refreshTextColor?: ResourceColor = '#999999'; // 下拉加载完毕后提示文本的字体颜色
  private refreshTextSize?: number | string | Resource = 18; // 下拉加载完毕后提示文本的字体大小
  private refreshAnimDuration?:number = 1000; // 下拉动画执行一次的时间
  private loadImgHeight?: number = 30; // 上拉图片高度
  private loadBackgroundColor?: ResourceColor = 'rgba(0,0,0,0)'; // 上拉动画区域背景色
  private loadTextColor?: ResourceColor = '#000000'; // 上拉文本的字体颜色
  private loadTextSize?: number | string | Resource = 16; // 上拉文本的字体大小
  private loadTextPullUp1?: string = '正在上拉刷新...'; // 上拉1阶段文本
  private loadTextPullUp2?: string = '放开刷新'; // 上拉2阶段文本
  private loadTextLoading?: string = '正在玩命加载中...'; // 上拉加载更多中时的文本

  setHasRefresh(hasRefresh: boolean) {
    this.hasRefresh = hasRefresh;
    return this;
  }

  getHasRefresh() {
    return this.hasRefresh;
  }

  setHasLoadMore(hasLoadMore: boolean) {
    this.hasLoadMore = hasLoadMore;
    return this;
  }

  getHasLoadMore() {
    return this.hasLoadMore;
  }

  setMaxTranslate(maxTranslate: number) {
    this.maxTranslate = maxTranslate;
    return this;
  }

  getMaxTranslate() {
    return this.maxTranslate;
  }

  setSensitivity(sensitivity: number) {
    this.sensitivity = sensitivity;
    return this;
  }

  getSensitivity() {
    return this.sensitivity;
  }

  setListIsPlacement(listIsPlacement: boolean) {
    this.listIsPlacement = listIsPlacement;
    return this;
  }

  getListIsPlacement() {
    return this.listIsPlacement;
  }

  setAnimDuration(animDuration: number) {
    this.animDuration = animDuration;
    return this;
  }

  getAnimDuration() {
    return this.animDuration;
  }

  getRefreshWidth() {
    return this.refreshHeight / 3 * 4;
  }

  setRefreshHeight(refreshHeight: number) {
    this.refreshHeight = refreshHeight;
    return this;
  }

  getRefreshHeight() {
    return this.refreshHeight;
  }

  setRefreshColor(refreshColor: string) {
    this.refreshColor = refreshColor;
    return this;
  }

  getRefreshColor() {
    return this.refreshColor;
  }

  setRefreshBackgroundColor(refreshBackgroundColor: ResourceColor) {
    this.refreshBackgroundColor = refreshBackgroundColor;
    return this;
  }

  getRefreshBackgroundColor() {
    return this.refreshBackgroundColor;
  }

  setRefreshTextColor(refreshTextColor: ResourceColor) {
    this.refreshTextColor = refreshTextColor;
    return this;
  }

  getRefreshTextColor() {
    return this.refreshTextColor;
  }

  setRefreshTextSize(refreshTextSize: number | string | Resource) {
    this.refreshTextSize = refreshTextSize;
    return this;
  }

  getRefreshTextSize() {
    return this.refreshTextSize;
  }

  setRefreshAnimDuration(refreshAnimDuration: number) {
    this.refreshAnimDuration = refreshAnimDuration;
    return this;
  }

  getRefreshAnimDuration() {
    return this.refreshAnimDuration;
  }

  setLoadImgHeight(loadImgHeight: number) {
    this.loadImgHeight = loadImgHeight;
    return this;
  }

  getLoadImgHeight() {
    return this.loadImgHeight;
  }

  setLoadBackgroundColor(loadBackgroundColor: ResourceColor) {
    this.loadBackgroundColor = loadBackgroundColor;
    return this;
  }

  getLoadBackgroundColor() {
    return this.loadBackgroundColor;
  }

  setLoadTextColor(loadTextColor: ResourceColor) {
    this.loadTextColor = loadTextColor;
    return this;
  }

  getLoadTextColor() {
    return this.loadTextColor;
  }

  setLoadTextSize(loadTextSize: number | string | Resource) {
    this.loadTextSize = loadTextSize;
    return this;
  }

  getLoadTextSize() {
    return this.loadTextSize;
  }

  setLoadTextPullUp1(loadTextPullUp1: string) {
    this.loadTextPullUp1 = loadTextPullUp1;
    return this;
  }

  getLoadTextPullUp1() {
    return this.loadTextPullUp1;
  }

  setLoadTextPullUp2(loadTextPullUp2: string) {
    this.loadTextPullUp2 = loadTextPullUp2;
    return this;
  }

  getLoadTextPullUp2() {
    return this.loadTextPullUp2;
  }

  setLoadTextLoading(loadTextLoading: string) {
    this.loadTextLoading = loadTextLoading;
    return this;
  }

  getLoadTextLoading() {
    return this.loadTextLoading;
  }
}