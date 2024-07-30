function ListNode(val) {
    this.val = val;
    this.next = null;
}

/**
 * @param {ListNode} headA
 * @param {ListNode} headB
 * @return {ListNode}
 */
var getIntersectionNode = function (headA, headB) {
    if (headA == null || headB == null) {
        return null;
    }

    let pA = headA;
    let pB = headB;

    while (pA != pB) {
        pA = pA != null ? pA.next : headB;
        pB = pB != null ? pB.next : headA;
    }
    return pA;
};
