/**
 * @param {number[]} nums
 * @return {number[]}
 */
var productExceptSelf = function (nums) {
    let left = [];
    left[0] = 1;
    for (let i = 1; i < nums.length; i++) {
        left[i] = nums[i - 1] * left[i - 1]
    }

    let right = [];
    right[nums.length - 1] = 1;

    for (let i = nums.length - 2; i >= 0; i--) {
        right[i] = right[i + 1] * nums[i + 1]
    }

    let ans = [];
    for (let i = 0; i < nums.length; i++) {
        ans[i] = left[i] * right[i];
    }
    return ans;
};
