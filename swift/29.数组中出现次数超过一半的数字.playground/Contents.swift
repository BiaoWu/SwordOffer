//: Playground - noun: a place where people can play
// 数组中出现次数超过一半的数字

import UIKit

// 常规思路：如果存在这个数 那么在排序好的数组中，中间的那个数肯定是. 缺点是要修改原数组
// 鬼才思路：既然次数多那遇到相同就＋＋不同就－－ 如果存在这个数最后肯定大于或者等于1

func findMoreThanHalfValue(arr: [Int]) -> Int {
    
    var result = arr[0]
    var times = 1
    
    for i in 1..<arr.count {
        if times == 0 {
            result = arr[i]
            times = 1
        } else if arr[i] == result {
            times += 1
        } else {
            times -= 1
        }
    }
    
    return isMoreThanHalf(arr, result: result) ? result : 0
}

func isMoreThanHalf(arr: [Int], result: Int) -> Bool {
    var times = 0
    for i in 0..<arr.count {
        if arr[i] == result {
            times += 1
        }
    }
    
    return times * 2 > arr.count
}

func testFindMoreThanHalfValue() {
    var arr: [Int]!
    
    arr = [2, 1, 2, 1, 2]
    assert(findMoreThanHalfValue(arr) == 2)
    
    
    arr = [2, 1, 2, 1, 3]
    assert(findMoreThanHalfValue(arr) == 0)
    
    
    arr = [2, 2, 2, 1, 3]
    assert(findMoreThanHalfValue(arr) == 2)
    
    
    arr = [4, 2, 2, 2, 3]
    assert(findMoreThanHalfValue(arr) == 2)
}

testFindMoreThanHalfValue()
