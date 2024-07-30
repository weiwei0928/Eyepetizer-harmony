function TreeNode(val, left, right) {
    this.val = (val === undefined ? 0 : val);
    this.left = (left === undefined ? null : left);
    this.right = (right === undefined ? null : right);
}


/**
 * @param {TreeNode} root
 * @return {number[]}
 */
var inorderTraversal = function (root) {
    let ans = [];
    inorder(root, ans);
    return ans;
};

var inorder = (root, ans) => {
    if (root == null) {
        return;
    }
    if (root.left != null) {
        inorder(root.left, ans);
    }
    ans.push(root.val);
    if (root.right != null) {
        inorder(root.right, ans);
    }
}
