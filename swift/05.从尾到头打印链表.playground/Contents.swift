//: Playground - noun: a place where people can play
// 输入一个链表的头节点，从尾到头打印没个节点的值

import UIKit

class ListNode {
    var value: Int!
    var next: ListNode?
    
    init (value: Int, next: ListNode?){
        self.value = value;
        self.next = next
    }
}

// 循环
func printListNodeReverse(head: ListNode) {
    var stack = Array<ListNode>()
    stack.append(head)
    
    var node = head.next
    while node != nil {
        stack.append(node!)
        node = node?.next
    }
    
    while stack.count > 0 {
        node = stack.removeLast()
        
        print("node.value = \(node!.value)")
    }
}

// 递归
func printNode(node: ListNode) {
    if node.next != nil {
        printNode(node.next!)
    }
    print("node.value = \(node.value)")
}

// 测试数据
func provideTestHeadNodes() -> [ListNode] {
    var testHeadNodes = [ListNode]()
    
    let head01 = ListNode(value: 11, next: nil)
    var node = head01
    for i in 22...25 {
        let newNode = ListNode(value: i, next: nil)
        node.next = newNode
        node = newNode
    }
    testHeadNodes.append(head01)
    
    let head02 = ListNode(value: 88, next: nil)
    testHeadNodes.append(head02)
    
    return testHeadNodes
}

// 循环测试
func testPrintListNodeReverse() {
    let heads = provideTestHeadNodes()
    
    for head in heads {
        printListNodeReverse(head)
        print("-----testPrintListNodeReverse-----")
    }
}

// 递归测试
func testPrintNode() {
    let heads = provideTestHeadNodes()
    
    for head in heads {
        printNode(head)
        print("-----testPrintNode-----")
    }
}

testPrintListNodeReverse()
testPrintNode()
