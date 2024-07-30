
/**
 * 283. 移动零
 * 给定一个数组 nums，编写一个函数将所有 0 移动到数组的末尾，同时保持非零元素的相对顺序。
 * 
 * 
*/
var moveZeroes = function (nums) {
    for (let i = 0; i < nums.length; i++) {
        for (let j = 1; j < nums.length - i; j++) {
            if (nums[j] != 0 && nums[j - 1] == 0) {
                [nums[j - 1], nums[j]] = [nums[j], nums[j - 1]];
            }
        }
    }
};