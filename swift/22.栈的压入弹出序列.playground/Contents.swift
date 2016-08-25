//: Playground - noun: a place where people can play
// 栈的压入、弹出序列
// 例如 1、2、3、4、5是栈的压入序列
// 那么 4、5、3、2、1是该栈的弹出序列
// 而   4、3、5、1、2 则不是

import UIKit

func checkOrder<T: Comparable>(stackOrder:[T], popOrder:[T]) -> Bool {
    if stackOrder.count == 0 || popOrder.count == 0 || stackOrder.count != popOrder.count {
        return false
    }
    
    // 指向stackOrder
    var p1 = 0
    
    // 指向popOrder
    var p2 = 0
    
    var stack = [T]()
    var stackValue: T!
    
    // 1. 所有值都会压入栈
    while p1 < stackOrder.count {
        stackValue = stackOrder[p1]
        stack.append(stackValue)

        // 2.比对栈顶值 与 弹出序列的首位
        while stackValue != nil && stackValue == popOrder[p2] {
            p2 += 1
            stack.removeLast()
            stackValue = stack.last
        }

        p1 += 1
    }
    
    // 3.如果弹出序列比对完时 刚好相等
    return p2 == popOrder.count
}

func testCheckOrder() {
    var stackOrder: [Int]!
    var popOrder: [Int]!
    
    stackOrder = [1, 2, 3, 4, 5]
    
    popOrder = [4, 5, 3, 2, 1]
    assert(checkOrder(stackOrder, popOrder: popOrder))
    
    popOrder = [4, 5, 3, 1, 2]
    assert(!checkOrder(stackOrder, popOrder: popOrder))
    
    
    stackOrder = [1]
    popOrder = [1]
    assert(checkOrder(stackOrder, popOrder: popOrder))
    
    popOrder = [2]
    assert(!checkOrder(stackOrder, popOrder: popOrder))
}

testCheckOrder()

