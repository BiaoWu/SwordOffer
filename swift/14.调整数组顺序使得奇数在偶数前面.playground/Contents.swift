//: Playground - noun: a place where people can play
// 调整数组顺序使得奇数在偶数前面

import UIKit

func isEven(n: Int) -> Bool {
    return n & 0x1 == 0
}

func reOrder(inout arr: [Int], by: (Int) -> Bool) {
    var p1 = 0
    var p2 = arr.count - 1
    
    var temp: Int!
    
    while p1 < p2 {
        while p1 < p2 && !by(arr[p1]) {
            p1 += 1
        }
        while p1 < p2 && by(arr[p2]) {
            p2 -= 1
        }
        
        if p1 < p2 {
            temp = arr[p1]
            arr[p1] = arr[p2]
            arr[p2] = temp
        }
    }
}

func testReOrder() {
    var arr = [1,2,3,4,5]
    reOrder(&arr, by: isEven)
    assert(arr == [1,5,3,4,2])
}

testReOrder()
