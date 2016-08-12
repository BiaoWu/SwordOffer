//: Playground - noun: a place where people can play
// swift中：三元运算符（a？b：c） 和 默认的赋值符（＝）是不可重载的
// 那就玩玩其他的吧。。

import UIKit

struct CMyString {
    var data: String!
    
    init(data: String){
        self.data =  data
    }
    
    init(str: CMyString){
        self.data = str.data
    }
}

// 重载 ＋
func + (left: CMyString, right: CMyString) -> CMyString {
    return CMyString(data: left.data + right.data)
}

// 测试
func testPlus() {
    let str1 = CMyString(data: "Hello")
    let str2 = CMyString(data: "Playground")
    
    let str3 = str1 + str2
    
    assert(str3.data == "HelloPlayground")
}

testPlus()
        
