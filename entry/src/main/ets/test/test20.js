function ListNode(val) {
    this.val = val;
    this.next = null;
}


/**
 * @param {ListNode} head
 * @returns {ListNode}
 *
 */
var reverseList = function (head) {
    if (head == null || head.next == null) {
        return head;
    }

    let pre = null;
    let next = null;
    let cur = head;
    while (cur != null) {
        next = cur.next;
        cur.next = pre;
        pre = cur;
        cur = next;
    }
    return pre;
};
