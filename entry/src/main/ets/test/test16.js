/**
 * @param {number[][]} matrix
 * @return {number[]}
 */
var spiralOrder = function (matrix) {
    let res = [];
    let t = 0, b = matrix.length, l = 0, r = matrix[0].length;
    while (l <= r && t <= b) {
        for (let i = l; i < r; i++) {
            res.push(matrix[t][i]);
        }
        for (let i = t; i < b; i++) {
            res.push(matrix[i][r]);
        }
        for (let i = r; i > l && t < b; i--) {
            res.push(matrix[b][i]);
        }
        for (let i = b; i > t && l < r; i--) {
            res.push(matrix[i][l]);
        }
        l++;
        r--;
        t++;
        b--;
    }
    return res;
};
