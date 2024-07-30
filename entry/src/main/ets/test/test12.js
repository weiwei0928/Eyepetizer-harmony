/**
 * @param {number[][]} intervals
 * @return {number[][]}
 */
var merge = function (intervals) {
    intervals.sort((a, b) => a[0] - b[0]);
    let res = [];
    for (const interval of intervals) {
        const length = res.length
        if (length && interval[0] <= res[length - 1][1]) {
            res[length - 1][1] = Math.max(interval[1], res[length - 1][1])
        } else {
            res.push(interval);
        }
    }
};
