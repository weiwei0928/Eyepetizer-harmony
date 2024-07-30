
/**
 * 128. 最长连续序列
 * 给定一个未排序的整数数组 nums ，找出数字连续的最长序列（不要求序列元素在原数组中连续）的长度。
 *  示例 1：

输入：nums = [100,4,200,1,3,2]
输出：4
解释：最长数字连续序列是 [1, 2, 3, 4]。它的长度为 4。
 * 
 * 
*/
var longestConsecutive = function (nums) {
    let set = new Set();
    nums.forEach(num => {
        set.add(num);
    });
    let curMax = 0;
    let curAns = 0;
    let ans = 0;
    for (const n of set) {
        if (!set.has(n + 1)) {
            curMax = n;
            curAns = 1;
            while (set.has(curMax - 1)) {
                curAns++;
                curMax = curMax - 1;
            }
        }
        ans = Math.max(ans, curAns);
    }
    return ans;
};