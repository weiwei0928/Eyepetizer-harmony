
/**
 *49. 字母异位词分组
 * 给你一个字符串数组，请你将 字母异位词 组合在一起。可以按任意顺序返回结果列表。
 * 示例 1:
* 输入: strs = ["eat", "tea", "tan", "ate", "nat", "bat"]
* 输出: [["bat"],["nat","tan"],["ate","eat","tea"]]
 * 
*/
var groupAnagrams = function (strs) {
    const map = new Map();
    for (const str of strs) {
        let array = Array.from(str);
        array.sort();
        let key = array.toString();
        let arr = map.get(key) ? map.get(key) : new Array();
        arr.push(str)
        map.set(key,arr)
    }
    return [...map.values()]
};