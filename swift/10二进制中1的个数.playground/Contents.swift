//: Playground - noun: a place where people can play
// 二进制中1的个数

import UIKit

// 二进制中1的个数
func count01(n: Int) -> Int {
    if n == 0 {
        return 0
    }
    
    var count = 0
    var flag = 1
    // 64位 每次都要比对64次
    while flag != 0 {
        
        if n & flag > 0 {
            count += 1
        }
        
        flag = flag << 1
    }
    
    return count;
}

// 二进制中1的个数 高效实现
func count02(n: Int) -> Int {
    var count = 0
    var tempN = n
    while tempN > 0 {
        count += 1
        
        // 例如
        // 1100 - 1    = 1011
        // 1100 & 1011 = 1000
        // 1000 - 1    = 0111
        // 1000 & 0111 = 0000
        tempN &= tempN - 1
    }
    
    return count;
}

func testCount(count: (Int) -> Int) {
    assert(count(0) == 0)
    assert(count(1) == 1)
    assert(count(0x7fffffff) == 31)
    assert(count(0x80000000) == 1)
    assert(count(0xffffffff) == 32)
}

testCount(count01)
testCount(count02)
