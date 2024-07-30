
/**
 * 560. 和为 K 的子数组
 * 给给你一个整数数组 nums 和一个整数 k ，请你统计并返回 该数组中和为 k 的子数组的个数 。
 * @param {number[]} nums
 * @param {number} k
 * @return {number}
 */
var subarraySum = function (nums, k) {
    let ans = 0;
    for (let i = 0; i < nums.length; i++) {
        let sum = 0;
        for (let j = i; j >= 0; j--) {
            sum += nums[j];
            if (sum == k) {
                ans++;
            }
        }
    }
    return ans;
};

let nums = [1,2,1,4];
console.log(subarraySum(nums,3));
