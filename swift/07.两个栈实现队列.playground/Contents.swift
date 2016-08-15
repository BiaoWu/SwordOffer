//: Playground - noun: a place where people can play
// 两个栈实现队列

import UIKit

// 栈
class Stack<T> {
    private var items = [T]()
   
    // 压栈
    func push(t: T) {
        items.append(t)
    }
    
    // 出栈
    func pop() -> T? {
        return items.popLast()
    }
}

// 两个栈实现的队列
class Queue<T> {
    private var stack1 = Stack<T>()
    private var stack2 = Stack<T>()
    
    func appendTail(t: T) {
        stack1.push(t)
    }
    
    func deleteHead() -> T? {
        var item = stack1.pop()
        while item != nil {
            stack2.push(item!)
            item = stack1.pop()
        }
        return stack2.pop()
    }
}

func testQueue() {
    let queue = Queue<Int>()
    
    assert(queue.deleteHead() == nil)
    
    queue.appendTail(1)
    assert(queue.deleteHead() == 1)
    
    queue.appendTail(2)
    queue.appendTail(3)
    queue.appendTail(4)
    
    assert(queue.deleteHead() == 2)
    assert(queue.deleteHead() == 3)
    assert(queue.deleteHead() == 4)
    assert(queue.deleteHead() == nil)
}

testQueue()
