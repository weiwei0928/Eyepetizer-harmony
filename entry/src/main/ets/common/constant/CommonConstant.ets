
export class CommonConstant {


  static readonly TAB_ITEM_FONT_WEIGHT: number = 500;
  static readonly WebConstant_WIDTH: string = '93.3%';

  static readonly HTTP_CODE_200: number = 200;
  static readonly FULL_WIDTH: string = '100%';
  static readonly FULL_HEIGHT: string = '100%';
  static readonly MATCH_PARENT: string = '100%';
  static readonly TEN_PERCENT: string = '10%';
  static readonly TWENTY_PERCENT: string = '20%';
  static readonly THIRTY_PERCENT: string = '30%';
  static readonly FORTY_PERCENT: string = '40%';
  static readonly FIFTY_PERCENT: string = '50%';
  static readonly SIXTY_PERCENT: string = '60%';
  static readonly SEVENTY_PERCENT: string = '70%';
  static readonly EIGHTY_PERCENT: string = '80%';
  static readonly NINETY_PERCENT: string = '90%';
  static readonly FONT_SIZE_20: string = '20fp';
  static readonly FONT_SIZE_12: string = '12fp';
  static readonly FONT_SIZE_13: string = '13fp';
  static readonly FONT_SIZE_14: string = '14fp';
  static readonly FONT_SIZE_16: string = '16fp';
  static readonly FONT_SIZE_18: string = '18fp';

  static readonly WATER_FLOW_COLUMNS_TEMPLATE: string = '1fr 1fr';


  public static readonly ItemViewType = {
    UNKNOWN: -1, //未知类型，使用EmptyViewHolder容错处理。

    CUSTOM_HEADER: 0, //自定义头部类型。

    TEXT_CARD_HEADER1: 1,

    TEXT_CARD_HEADER2: 2,

    TEXT_CARD_HEADER3: 3,

    TEXT_CARD_HEADER4: 4, //type:textCard -> dataType:TextCard,type:header4

    TEXT_CARD_HEADER5: 5, //type:textCard -> dataType:TextCard -> type:header5

    TEXT_CARD_HEADER6: 6,

    TEXT_CARD_HEADER7: 7, //type:textCard -> dataType:TextCardWithRightAndLeftTitle,type:header7

    TEXT_CARD_HEADER8: 8, //type:textCard -> dataType:TextCardWithRightAndLeftTitle,type:header8

    TEXT_CARD_FOOTER1: 9,

    TEXT_CARD_FOOTER2: 10, //type:textCard -> dataType:TextCard,type:footer2

    TEXT_CARD_FOOTER3: 11, //type:textCard -> dataType:TextCardWithTagId,type:footer3

    BANNER: 12, //type:banner -> dataType:Banner

    BANNER3: 13, //type:banner3-> dataType:Banner

    FOLLOW_CARD: 14, //type:followCard -> dataType:FollowCard -> type:video -> dataType:VideoBeanForClient

    TAG_BRIEFCARD: 15, //type:briefCard -> dataType:TagBriefCard

    TOPIC_BRIEFCARD: 16, //type:briefCard -> dataType:TopicBriefCard

    COLUMN_CARD_LIST: 17, //type:columnCardList -> dataType:ItemCollection

    VIDEO_SMALL_CARD: 18, //type:videoSmallCard -> dataType:VideoBeanForClient

    INFORMATION_CARD: 19, //type:informationCard -> dataType:InformationCard

    AUTO_PLAY_VIDEO_AD: 20, //type:autoPlayVideoAd -> dataType:AutoPlayVideoAdDetail

    HORIZONTAL_SCROLL_CARD: 21, //type:horizontalScrollCard -> dataType:HorizontalScrollCard

    SPECIAL_SQUARE_CARD_COLLECTION: 22, //type:specialSquareCardCollection -> dataType:ItemCollection

    UGC_SELECTED_CARD_COLLECTION: 23, //type:ugcSelectedCardCollection -> dataType:ItemCollection

    MAX: 100   //避免外部其他类型与此处包含的某个类型重复。
  }

  public static readonly URL = {
    AUTHOR_LOGIN: "http://open.eyepetizer.net/#!/login",

    AUTHOR_REGISTER: "http://open.eyepetizer.net/#!/register",

    FORGET_PASSWORD: "http://open.eyepetizer.net/#!/forget",

    USER_AGREEMENT: "http://www.eyepetizer.net/agreement.html",

    VIDEO_FUNCTION_STATEMENT: "http://www.eyepetizer.net/right.html",

    LEGAL_NOTICES: "http://www.kaiyanapp.com/legal_notices.html",

    AUTHOR_OPEN: "http://open.eyepetizer.net/#!/landing",

    GITHUB_URL: "https://github.com/weiwei0928",
  };
}

export const enum ViewStateConstant {
  //加载中
  VIEW_STATE_LOADING = "view_state_loading",
  //成功
  VIEW_STATE_SUCCESS = "view_state_success",
  //错误
  VIEW_STATE_ERROR = "view_state_error",
  //网络异常
  VIEW_STATE_NETWORK_ERROR = "view_state_network_error",
  //空页面
  VIEW_STATE_EMPTY = "view_state_empty",
}

export const enum RefreshState {
  DropDown = 0,
  Release = 1,
  Refreshing = 2,
  Success = 3,
  Fail = 4
}

/**
 * The newsList state enum.
 */
export const enum PageState {
  Loading = 0,
  Success = 1,
  Fail = 2
}

/**
 * The request content type enum.
 */
export const enum ContentType {
  JSON = 'application/json'
}