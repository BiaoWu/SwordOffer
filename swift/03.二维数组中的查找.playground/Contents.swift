//: Playground - noun: a place where people can play
// 在一个二维数组中，每一行都以从左到右递增的顺序排列，每一列都按照从上到下的顺序排列。 
// 请完成一个函数，输入这样一个二维数组和一个整数，判断数组中是否含有该整数
import UIKit

// 每一行都以从左到右递增的顺序排列，每一列都按照从上到下的顺序排列。
var arr = [
    [1, 2, 8, 9],
    [2, 4, 9, 12],
    [4, 7, 10, 13],
    [6, 8, 11, 15],
]

func findTarget(arr: [[Int]], target: Int) -> Bool {
    var found = false

    let rows = arr.count
    let columns = arr[0].count
   
    // 选择右上位置（起始位置可选 右上 或 左下）
    var row = 0
    var column = columns - 1
    
    // 因为选的右上，所以row不断增加，column则是不断减小的
    while row < rows && column >= 0 {
        if arr[row][column] == target {
            found = true
            break
        }
        
        // 当前数大于目标 左移 否则 下移
        if arr[row][column] > target {
            column -= 1
        } else{
            row += 1
        }
    }
    
    return found
}

//存在的
assert(findTarget(arr, target: 1))
assert(findTarget(arr, target: 15))
assert(findTarget(arr, target: 7))
assert(findTarget(arr, target: 10))

//不存在的
assert(!findTarget(arr, target: 23))
assert(!findTarget(arr, target: 3))
assert(!findTarget(arr, target: -3))
