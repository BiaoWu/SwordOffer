//: Playground - noun: a place where people can play

import UIKit

class Singleton01 {
    static let instance = Singleton01()
    
    private init() {}
}

class Singleton02 {
    private init() {}
    
    static var sharedInstance: Singleton02 {
        struct Singleton {
            static let instance = Singleton02()
        }
        return Singleton.instance
    }
}

func testSingleton01() {
    let s1 = Singleton01.instance
    let s2 = Singleton01.instance
    
    assert(unsafeAddressOf(s1) == unsafeAddressOf(s2))
}

func testSingleton02() {
    let s1 = Singleton02.sharedInstance
    let s2 = Singleton02.sharedInstance
    
    assert(unsafeAddressOf(s1) == unsafeAddressOf(s2))
}

testSingleton01()
testSingleton02()
