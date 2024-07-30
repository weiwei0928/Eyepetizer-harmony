
/**
 * 53. 最大子数组和
 * 给你一个整数数组 nums ，请你找出一个具有最大和的连续子数组（子数组最少包含一个元素），返回其最大和。子数组是数组中的一个连续部分。
 * @param {number[]} nums
 * @return {number}
 */
var maxSubArray = function (nums) {
    let sum = 0;
    let max = nums[0];
    for (const num of nums) {
        sum = Math.max(num, num + sum);
        max = Math.max(max, sum);
    }
    return max;
};
