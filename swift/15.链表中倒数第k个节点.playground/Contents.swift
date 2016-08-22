//: Playground - noun: a place where people can play
// 链表中倒数第k个节点

import UIKit

class ListNode<T> {
    var value: T!
    var next: ListNode<T>?
    
    init(_ value: T) {
        self.value = value
    }
    
    func next(value: T) -> ListNode<T> {
        let node = ListNode(value)
        next = node
        return node
    }
}

func findKthToTail<T>(head: ListNode<T>, k: Int) -> ListNode<T>? {
    if k <= 0 {
        return nil
    }
    
    //目标 p1 与 p2 的间隔是k个，最终p1 就是第k个
    var p1 = head
    var p2 = head
    for _ in 1..<k {
        if p2.next != nil {
            p2 = p2.next!
        } else {
            return nil
        }
    }
    
    while p2.next != nil {
        p1 = p1.next!
        p2 = p2.next!
    }
    
    return p1
}

func testFindKthToTail() {
    let head = ListNode(1)
    head.next(2).next(3).next(4).next(5)
    
    assert(findKthToTail(head, k: 1)?.value == 5)
    assert(findKthToTail(head, k: 2)?.value == 4)
    assert(findKthToTail(head, k: 5)?.value == 1)
    
    assert(findKthToTail(head, k: 0) == nil)
    assert(findKthToTail(head, k: 10) == nil)
}

testFindKthToTail()
