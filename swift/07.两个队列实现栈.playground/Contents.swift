//: Playground - noun: a place where people can play
// 两个队列实现栈

import UIKit

// 队列
class Queue<T> {
    private var items = [T]()
    
    // 排队
    func appendTail(t: T) {
        items.append(t)
    }
    
    // 出队
    func deleteHead() -> T? {
        return items.count > 0 ? items.removeFirst() : nil
    }
    
    func size() -> Int {
        return items.count
    }
}

// 两个队列实现的栈
class Stack<T> {
    private var queue1 = Queue<T>()
    private var queue2 = Queue<T>()
    
    // 数据只压入queue1
    func push(t: T) {
        queue1.appendTail(t)
    }
    
    func pop() -> T? {
        // 找到最后一个
        while queue1.size() > 1 {
            queue2.appendTail(queue1.deleteHead()!)
        }
        let result = queue1.deleteHead()
        
        //交换引用 保证数据只压入queue1中
        if queue2.size() > 0 {
            let tempQueue = queue1
            queue1 = queue2
            queue2 = tempQueue
        }
        
        return result
    }
}

func testStack() {
    let stack = Stack<Int>()
    
    assert(stack.pop() == nil)
    
    stack.push(1)
    assert(stack.pop() == 1)
    
    stack.push(2)
    stack.push(3)
    stack.push(4)
    
    assert(stack.pop() == 4)
    assert(stack.pop() == 3)
    assert(stack.pop() == 2)
    assert(stack.pop() == nil)
}

testStack()
