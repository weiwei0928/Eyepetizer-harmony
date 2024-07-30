function ListNode(val, next) {
    this.val = val;
    this.next = next;
}


/**
 *
 * 给你一个链表的头节点 head ，判断链表中是否有环。
 * @param {ListNode} head
 * @return {boolean}
 */
var hasCycle = function (head) {
    if (head == null || head.next == null) {
        return false;
    }
    let slow = head;
    let fast = head.next;
    while (fast != null && fast.next != null) {
        if (slow == fast) {
            return true;
        }
        slow = slow.next;
        fast = fast.next.next;
    }
    return false;
};
