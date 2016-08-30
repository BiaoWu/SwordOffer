//: Playground - noun: a place where people can play
// 字符串的排列
// abc
// acb
// bac
// bca
// ...
// a            b               c
// fromIndex    replaceIndex
// 交换fromIndex与replaceIndex的位置

import UIKit

func printString(str: String) {
    let count = str.characters.count
    if count <= 1 {
        print(str)
    } else {
        printString(str, from: 0)
    }
}


private func printString(str: String, from: Int) {
    let count = str.characters.count
    
    guard from + 1 < count else {
        print(str)
        return
    }
    
    for replace in from..<count {
        var newStr = String(str)
        let fromIndex = str.startIndex.advancedBy(from)
        let replaceIndex = str.startIndex.advancedBy(replace)
        let fromChar = str[fromIndex]
        newStr.replaceRange(fromIndex...fromIndex, with: String(str[replaceIndex]))
        newStr.replaceRange(replaceIndex...replaceIndex, with: String(fromChar))
        printString(newStr, from: from + 1)
    }
}

func testPrintString() {
    printString("a")
    printString("abc")
}

testPrintString()
