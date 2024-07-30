
/**
 * 3. 无重复字符的最长子串
 * 给定一个字符串 s ，请你找出其中不含有重复字符的 最长 子串的长度。
 *  * @param {string} s
 * @return {number}
 * 
*/
var lengthOfLongestSubstring = function (s) {
    let l = 0;
    let r = 0;
    let ans = 0;
    const set = new Set();

    while (r < s.length) {
        while (set.has(s[r])) {
            set.delete(s[l])
            l++;
        }
        set.add(s[r]);
        ans = Math.max(ans, r - l + 1);

        r++;
    }
    return ans;
};