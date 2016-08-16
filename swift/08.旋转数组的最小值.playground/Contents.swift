//: Playground - noun: a place where people can play
// 旋转数组的最小值
// 例如：[3, 4, 5, 1, 2] 是 [1, 2, 3, 4, 5]的一个旋转
// 特殊的 [1, 0, 1, 1, 1]

import UIKit

enum MinError: ErrorType {
    case Empty
}

func min(arr: [Int]) throws -> Int {
    if arr.count == 0 {
        throw MinError.Empty
    }
    
    if arr.count == 1 {
        return arr[0]
    }
    
    var head = 0
    var tail = arr.count - 1
    var mid: Int!
    
    // 移动“指针“ 目标剩下最后两个数
    while tail - head > 1 {
        // 特殊情况 头尾相等 只能顺序移动头或者尾
        if arr[head] == arr[tail] {
            head += 1
            continue
        }
        
        // 如果头小于尾 就是头了
        if arr[head] < arr[tail] {
            return arr[head]
        }
        
        // 正常情况
        mid = (head + tail) / 2
        // 中间值大于头 头移动到中间，或者中间值小于尾 尾移动到中间
        if arr[mid] >= arr[head] {
            head = mid
        } else if arr[mid] <= arr[tail] {
            tail = mid
        }
    }
    
    // 剩下两个 谁小就是谁了
    return arr[tail] > arr[head] ? arr[head] : arr[tail]
}


func testMin() {
    do {
        var arr: [Int]!
        var result: Int!
        
        arr = [3, 4, 5, 1, 2]
        result = try min(arr)
        assert(result == 1)
        
        arr = [1, 2, 3, 4, 5]
        result = try min(arr)
        assert(result == 1)
        
        arr = [1, 0, 1, 1, 1]
        result = try min(arr)
        assert(result == 0)
        
        arr = [1, 1, 1, 0, 1]
        result = try min(arr)
        assert(result == 0)
        
        arr = [0, 1]
        result = try min(arr)
        assert(result == 0)
        
        arr = [0]
        result = try min(arr)
        assert(result == 0)
        
        // just test
        arr = []
        try min(arr)
    }catch MinError.Empty {
        print("Arr cannot be empty")
    }catch{
         print("Error")
    }
}

testMin()