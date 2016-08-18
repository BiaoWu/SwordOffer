//: Playground - noun: a place where people can play
// 打印1到最大的n位数

import UIKit

// 普通整数打印
func printNumber01(n: Int) {
    
    var max = 1
    var i = 0
    while i < n {
        max *= 10
        i += 1
    }
    
    for i in 0..<max {
        print(i)
    }
}

// index = chars[index]
let chars = [0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10]

// 转换成字符串打印
func printNumber(n: Int) {
    if n <= 0 {
        print("\(n) error")
        return
    }
    var strs = Array<Int>(count: n, repeatedValue: chars[0])
    
    let lastIndex = strs.count - 1
    
    let lastCharIndex = chars.count - 1
    
    q: while true {
        for charIndex in 1...lastCharIndex {
            strs[lastIndex] = chars[charIndex]
            
            if charIndex == lastCharIndex {
                checkDecimalism(&strs, lastIndex)
                
                // 当首位都需要进位了 到终点了
                if strs[0] == chars[lastCharIndex] {
                    print("end -> \(strs)")
                    break q
                }
            }
            
            printStr(strs)
        }
    }
}

// 检查当前index 是否需要进位
private func checkDecimalism(inout strs: [Int], _ index: Int) {
    // 该进位了
    if strs[index] == chars[chars.count - 1] {
        // 不是首位时
        if index > 0 {
            // 当前位变成0
            strs[index] = chars[0]
            // 前一位＋1 不过这里没做计算 只是向右移了一位
            strs[index - 1] = chars[strs[index - 1] + 1]
            // 继续检查前一位是否需要进位
            checkDecimalism(&strs, index - 1)
        }
    }
}

// 打印目标数组 过滤0
private func printStr(strs: Array<Int>) {
    var skip = true
    for i in 0..<strs.count {
        if skip && strs[i] == 0 {
            continue
        } else {
            skip = false
            print("\(strs[i])", terminator: "")
        }
    }
    print("")
}

//printNumber(1)
//printNumber(2)
//printNumber(3)

printNumber(-1)
printNumber(0)
