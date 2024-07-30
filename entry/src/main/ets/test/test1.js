
/**
 * 1. 两数之和
 * 给定一个整数数组 nums 和一个整数目标值 target，请你在该数组中找出 和为目标值 target  的那 两个 整数，并返回它们的数组下标。
 * 
*/
var twoSum = (nums, target) => {
    const map = {}
    for (let i = 0; i < nums.length; i++) {
        if (map[target - nums[i]] != undefined) {
            return [map[target - nums[i]], i]
        }
        map[nums[i]] = i;
    }
}