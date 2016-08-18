//: Playground - noun: a place where people can play
// 数值的整数次方

import UIKit

func myPow(base: Double, _ exponent: Int) -> Double {
    if base == 0 {
        return 0
    }
    
    if exponent < 0 {
        return powNegative(base, exponent)
    } else {
        return powPositive(base, exponent)
    }
}

private func powNegative(base: Double, _ exponent: Int) -> Double {
    //todo
    return 0
}

private func powPositive(base: Double, _ exponent: Int) -> Double {
    if exponent == 0 {
        return 1
    }
    
    if exponent == 1 {
        return base
    }
    
    var result = powPositive(base, exponent >> 1)
    result *= result
    if exponent & 0x1 == 1 {
        result *= base
    }
    
    return result
}


func testPow() {
    //特殊底数 0 和 1
    assert(myPow(0.0, 0) == pow(0.0, 3))
    assert(myPow(1.0, 21) == pow(1.0, 38))
    
    //特殊指数 0
    assert(myPow(118.0, 0) == pow(119.0, 0))
    
    //普通指数和底数
    assert(myPow(2.0, 2) == pow(2.0, 2))
    assert(myPow(2.0, 3) == pow(2.0, 3))
    assert(myPow(5.0, 7) == pow(5.0, 7))
    assert(myPow(15.0, 7) == pow(15.0, 7))
    assert(myPow(15.0, 23) == pow(15.0, 23))
}


testPow()
