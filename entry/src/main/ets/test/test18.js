/**
 * @param {number[][]} matrix
 * @param {number} target
 * @return {boolean}
 */
var searchMatrix = function (matrix, target) {
    let t = 0, b = matrix.length-1, l = 0, r = matrix[0].length-1;
    while(l<=r&&t<=b){
        if(target>matrix[t][r]){
            t++;
        }else if(target<matrix[t][r]){
            r--;
        }else if(target==matrix[t][r]){
            return true;
        }
    }
    return false;
};
