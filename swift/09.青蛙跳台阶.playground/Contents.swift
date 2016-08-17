//: Playground - noun: a place where people can play
// 青蛙跳台阶

import UIKit

/*
 一次能跳1阶或2阶
 
 n=0 时 f(0)=1
 n=1 时 f(1)=1
 n=2 时 f(2)=f(1)+f(0)
 n=3 时 f(3)=f(2)+f(1)
 n=4 时 f(4)=f(3)+f(2)
 ...
 
 f(n)=f(n-1)+f(n-2)
 */
func frogJump1or2(n: Int) -> Int {
    if n < 0 {
        return -1
    }
    
    if n == 0 {
        return 1
    }
    
    if n == 1 {
        return 1
    }
    
    var p1 = 1
    var p2 = 1
    var sum = 0
    
    for _ in 2...n {
        sum = p1 + p2
        
        p1 = p2
        p2 = sum
    }
    
    return sum
}

/*
 一次能跳n阶
 n=0 时 f(0)=1
 n=1 时 f(1)=1
 n=2 时 f(2)=f(1)+f(0)
 n=3 时 f(3)=f(2)+f(1)+f(0)
 n=4 时 f(4)=f(3)+f(2)+f(1)+f(0)
 f(4)-f(3)=(f3)
 f(4)=2f(3)
 
 ...
 
 f(n)=2f(n-1)
 */
func frogJumpN(n: Int) -> Int {
    if n < 0 {
        return -1
    }
    
    if n == 0 {
        return 1
    }
    
    if n == 1 {
        return 1
    }
    
    var p1 = 1
    var p2 = 0
    
    for _ in 2...n {
        p2 = 2 * p1
        
        p1 = p2
    }
    
    return p2
}

func testFrogJump1or2() {
    assert(frogJump1or2(-10) == -1)
    assert(frogJump1or2(0) == 1)
    assert(frogJump1or2(1) == 1)
    assert(frogJump1or2(2) == 2)
    assert(frogJump1or2(3) == 3)
    assert(frogJump1or2(4) == 5)
    assert(frogJump1or2(5) == 8)
}

func testFrogJumpN() {
    assert(frogJumpN(-10) == -1)
    assert(frogJumpN(0) == 1)
    assert(frogJumpN(1) == 1)
    assert(frogJumpN(2) == 2)
    assert(frogJumpN(3) == 4)
    assert(frogJumpN(4) == 8)
    assert(frogJumpN(5) == 16)
}

testFrogJump1or2()
testFrogJumpN()
