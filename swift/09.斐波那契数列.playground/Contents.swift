//: Playground - noun: a place where people can play
// 斐波那契数列

import UIKit

func fibonacci(n: Int) -> Int {
    if n < 0 {
        return -1
    }
    
    if n == 0 {
        return 0
    }

    if n == 1 {
        return 1
    }
    
    var p1 = 0
    var p2 = 1
    var sum = 0
    
    for _ in 2...n {
        sum = p1 + p2
        
        p1 = p2
        p2 = sum
    }
    
    return sum
}

func testFibonacci() {
    assert(fibonacci(-10) == -1)
    assert(fibonacci(0) == 0)
    assert(fibonacci(1) == 1)
    assert(fibonacci(2) == 1)
    
    assert(fibonacci(3) == 2)
    assert(fibonacci(4) == 3)
    assert(fibonacci(5) == 5)
    assert(fibonacci(6) == 8)
    assert(fibonacci(7) == 13)
}

testFibonacci()