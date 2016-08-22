//: Playground - noun: a place where people can play
// 合并两个排序的链表

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

func mergeList<T: Comparable>(head1: ListNode<T>, _ head2: ListNode<T>) -> ListNode<T> {
    
    let head = head1.value < head2.value ? head1 : head2
    
    var currentNode = head
    var p1 = head === head1 ? head1.next : head1
    var p2 = head === head2 ? head2.next : head2
    
    while p1 != nil || p2 != nil {
        if p1 == nil {
            currentNode.next = p2
            currentNode = p2!
            p2 = p2!.next
        } else if p2 == nil {
            currentNode.next = p1
            currentNode = p1!
            p1 = p1!.next
        } else {
            if p1!.value < p2!.value {
                currentNode.next = p1
                currentNode = p1!
                p1 = p1!.next
            } else {
                currentNode.next = p2
                currentNode = p2!
                p2 = p2!.next
            }
        }
    }
    
    return head
}

func printNode<T>(node: ListNode<T>) {
    print("node.value = \(node.value)")
    if node.next != nil {
        printNode(node.next!)
    }
}

func testMergeList() {
    var head1 = ListNode(1)
    head1.next(3).next(5).next(7)
    
    var head2 = ListNode(2)
    head2.next(4).next(6).next(8)
    
    var result = mergeList(head1, head2)
    printNode(result)
    
    head1 = ListNode(10)
    head2 = ListNode(18)
    result = mergeList(head1, head2)
    printNode(result)
}

testMergeList()
