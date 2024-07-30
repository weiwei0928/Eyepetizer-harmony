/**
 * @param {number[]} nums
 * @param {number} k
 * @return {void} Do not return anything, modify nums in-place instead.
 */
var rotate = function (nums, k) {
    const length = nums.length;
    const array1 = nums.slice(0, length - k % length);
    const array2 = nums.slice(length - (k % length), length);

    let array = [...array2, ...array1];
    return array;
};

const nums = [1,2,3,4,5,6,7];
const k = 3;
console.log(rotate(nums,k))
