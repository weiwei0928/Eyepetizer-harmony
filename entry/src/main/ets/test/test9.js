
/**
 * 438. 找到字符串中所有字母异位词
 * 给定两个字符串 s 和 p，找到 s 中所有 p 的 异位词 的子串，返回这些子串的起始索引。不考虑答案输出的顺序。
 * 异位词 指由相同字母重排列形成的字符串（包括相同的字符串）。
 * @param {string} s
 * @param {string} p
 * @return {number[]}
 * 
*/
var findAnagrams = function (s, p) {
    const count = new Array(26).fill(0);
    let l = 0;
    let r = 0;
    let ans = [];

    for (let i = 0; i < p.length; i++) {
        count[p.charCodeAt(i) - 'a'.charCodeAt()]++;
    }

    while (r < s.length) {
        count[s.charCodeAt(r) - 'a'.charCodeAt()]--;

        while (count[s.charCodeAt(r) - 'a'.charCodeAt()] < 0) {
            count[s.charCodeAt(l) - 'a'.charCodeAt()]++;
            l++;
        }
        if ((r - l + 1) == p.length) {
            ans.push(l);
        }
        r++;
    }
    return ans;
};