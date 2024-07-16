/**
 * Tab item info.
 */
export class TabItem {
  /**
   * Tab item index.
   */
  index: number = 0;
  /**
   * Tab item title.
   */
  title: string = "";
  /**
   * Image activated.
   */
  imageActivated: Resource = $r("app.media.background");
  /**
   * Image original.
   */
  imageOriginal: Resource = $r("app.media.background");
}