//: Playground - noun: a place where people can play
// 反转链表

import UIKit

class ListNode<T> {
    var value: T!
    var next: ListNode<T>?
    
    init(_ value: T){
        self.value = value
    }
    
    func next(value: T) -> ListNode<T> {
        let node = ListNode(value)
        next = node
        return node
    }
}

func reverseList<T>(head: ListNode<T>) -> ListNode<T> {
    var node = head
    var next: ListNode<T>? = node.next
    var nextNext: ListNode<T>?
    
    while next != nil {
        nextNext = next!.next
        
        next!.next = node
        node = next!
        next = nextNext
    }
    
    return node
}

func testReverseList() {
    var head = ListNode(1)
    head.next(2).next(3).next(4).next(5)
    var newHead = reverseList(head)
    assert(newHead.value == 5)
    
    head = ListNode(10)
    newHead = reverseList(head)
    assert(newHead.value == 10)
}

testReverseList()
