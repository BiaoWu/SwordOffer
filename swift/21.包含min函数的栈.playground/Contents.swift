//: Playground - noun: a place where people can play
// 包含min函数的栈
// 代码很简单，想到是关键

import UIKit

class Stack<T: Comparable> {
    var data = [T]()
    
    var mins = [T]()
    
    func pop() -> T? {
        mins.popLast()
        return data.popLast()
    }
    
    func push(t: T) {
        data.append(t)
        
        if let last = mins.last {
            mins.append(t < last ? t : last)
        } else {
            mins.append(t)
        }
    }
    
    func min() -> T? {
        return mins.last
    }
}

func testStack() {
    let stack = Stack<Int>()
    
    assert(stack.min() == nil)
    
    stack.push(3)
    assert(stack.min() == 3)
    
    stack.push(4)
    assert(stack.min() == 3)
    
    stack.push(5)
    assert(stack.min() == 3)
    
    stack.push(1)
    assert(stack.min() == 1)
    
    stack.push(2)
    assert(stack.min() == 1)
    
    assert(stack.pop() == 2)
    assert(stack.min() == 1)
    
    assert(stack.pop() == 1)
    assert(stack.min() == 3)
    
    assert(stack.pop() == 5)
    assert(stack.min() == 3)
    
    assert(stack.pop() == 4)
    assert(stack.min() == 3)
    
    assert(stack.pop() == 3)
    assert(stack.min() == nil)
}

testStack()
