function ListNode(val, next) {
    this.val = val;
    this.next = next;
}


/**
 *
 * 234. 回文链表
 * @param {ListNode} head
 * @return {boolean}
 */
var isPalindrome = function (head) {
    let stack = [];
    let p = head;
    while (p != null) {
        stack.push(p.val);
        p = p.next
    }

    while (stack.length != 0) {
        if (head.val != stack.pop()) {
            return false;
        }
        head = head.next;
    }
    return true;
};
