import { ItemList } from '../../model/HomeModel'
import { Banner } from './view/Banner'
import { Banner3 } from './view/Banner3'
import { ColumnCardList } from './view/ColumnCardList'
import { FollowCard } from './view/FollowCard'
import { HorizontalScrollCard } from './view/HorizontalScrollCard'
import { InformationCard } from './view/InformationCard'
import { SpecialSquareCardCollection } from './view/SpecialSquareCardCollection'
import { TagBriefCard } from './view/TagBriefCard'
import { TextCardFooter2 } from './view/TextCardFooter2'
import { TextCardFooter3 } from './view/TextCardFooter3'
import { TextCardHeader5 } from './view/TextCardHeader5'
import { TextCardHeader7 } from './view/TextCardHeader7'
import { TopicBriefCard } from './view/TopicBriefCard'
import { VideoSmallCard } from './view/VideoSmallCard'

@Component
export struct HomeItem {
  item: ItemList = {}

  build() {
    Stack() {
      if (this.item.type == "textCard") {
        if (this.item.data.type == "header5") {
          TextCardHeader5({ data: this.item })
        } else if (this.item.data.type == "header7" || this.item.data.type == "header8") {
          TextCardHeader7({ data: this.item })
        } else if (this.item.data.type == "footer2") {
          TextCardFooter2({ data: this.item })
        } else if (this.item.data.type == "footer3") {
          TextCardFooter3({ data: this.item })
        }
      } else if (this.item.type == "specialSquareCardCollection") {
        if (this.item.data.dataType == "ItemCollection") {
          SpecialSquareCardCollection({ data: this.item })
        }
      } else if (this.item.type == "columnCardList") {
        if (this.item.data.dataType == "ItemCollection") {
          ColumnCardList({ data: this.item })
        }
      } else if (this.item.type == "horizontalScrollCard") {
        if (this.item.data.dataType == "HorizontalScrollCard") {
          HorizontalScrollCard({ data: this.item })
        }
      } else if (this.item.type == "videoSmallCard") {
        if (this.item.data.dataType == "VideoBeanForClient") {
          VideoSmallCard({ data: this.item })
        }
      } else if (this.item.type == "briefCard") {
        if (this.item.data.dataType == "TagBriefCard") {
          TagBriefCard({ data: this.item })
        } else if (this.item.data.dataType == "TopicBriefCard") {
          TopicBriefCard({ data: this.item })
        }
      } else if (this.item.type == "banner") {
        if (this.item.data.dataType == "Banner") {
          Banner({ data: this.item })
        }
      } else if (this.item.type == "banner3") {
        if (this.item.data.dataType == "Banner") {
          Banner3({ data: this.item })
        }
      } else if (this.item.type == "followCard") {
        if (this.item.data.dataType == "FollowCard") {
          FollowCard({ data: this.item })
        }
      } else if (this.item.type == "informationCard") {
        if (this.item.data.dataType == "InformationCard") {
          InformationCard({ data: this.item })
        }
      }
    }
  }
}