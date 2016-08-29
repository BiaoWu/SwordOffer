//: Playground - noun: a place where people can play
// 复杂链表的复制
// 刚看到这个题目真的无从下手
// 链表可以高效复制，但sibling节点必须有个哈希表映射才能高效，但空间效率又低了
// 所以只能看题主的答案了，果然666

import UIKit

// 思路
// 1. 先插入新的clone节点到每一个节点的next, 所以很明显奇数是旧的 偶数是新的
// 2. 而要指向的clone sibling节点正好在原sibling的next
// 3. 最后通过奇偶分割链表得到
// 下面就撸代码了

class ComplexListNode<T> {
    var value: T!
    var next: ComplexListNode?
    var sibling: ComplexListNode?
    
    init(_ value: T) {
        self.value = value
    }
}

func insetCloneNode<T>(head: ComplexListNode<T>) {
    var node: ComplexListNode<T>? = head
    var cloneNode: ComplexListNode<T>?
    
    while node != nil {
        cloneNode = ComplexListNode(node!.value)
        cloneNode?.next = node!.next
        cloneNode?.sibling = nil
        
        node!.next = cloneNode
        node = cloneNode?.next
    }
}

func connectSiblingNode<T>(head: ComplexListNode<T>) {
    var node: ComplexListNode<T>? = head
    var cloneNode: ComplexListNode<T>?
    
    while node != nil {
        cloneNode = node?.next
        
        if let sibling = node?.sibling {
            cloneNode?.sibling = sibling.next
        }
        
        node = cloneNode?.next
    }
}

func splitAndReturnTheNewHead<T>(head: ComplexListNode<T>) -> ComplexListNode<T>? {
    let cloneHead: ComplexListNode<T>? = head.next
    
    var cloneNode: ComplexListNode<T>?
    var node: ComplexListNode<T>? = head
    
    while node != nil {
        cloneNode = node!.next
        node!.next = cloneNode?.next
        
        node = cloneNode?.next
        cloneNode?.next = node?.next
    }
    
    return cloneHead
}

func cloneComplexListNode<T>(head: ComplexListNode<T>) -> ComplexListNode<T>? {
    insetCloneNode(head)
    connectSiblingNode(head)
    return splitAndReturnTheNewHead(head)
}

// 测试例子中5个节点
func testCloneFiveNodes() {
    var head: ComplexListNode<Int>!
    var node1: ComplexListNode<Int>!
    var node2: ComplexListNode<Int>!
    var node3: ComplexListNode<Int>!
    var node4: ComplexListNode<Int>!
    
    head = ComplexListNode(0)
    node1 = ComplexListNode(1)
    node2 = ComplexListNode(2)
    node3 = ComplexListNode(3)
    node4 = ComplexListNode(4)
    
    head.next = node1
    node1.next = node2
    node2.next = node3
    node3.next = node4
    node4.next = nil
    
    head.sibling = node2
    node1.sibling = node4
    node3.sibling = node1
    
    let cloneHead = cloneComplexListNode(head)
    assert(cloneHead?.value == 0)
    assert(cloneHead?.sibling?.value == 2)
    
    node1 = cloneHead?.next
    assert(node1?.value == 1)
    assert(node1?.sibling?.value == 4)
    
    node2 = node1.next
    assert(node2?.value == 2)
    assert(node2?.sibling == nil)
    
    node3 = node2.next
    assert(node3?.value == 3)
    assert(node3?.sibling?.value == 1)
    
    node4 = node3.next
    assert(node4?.value == 4)
    assert(node4?.sibling == nil)
}

// 测试只有一个节点
func testCloneOnlyOneNode() {
    var head: ComplexListNode<Int>!
    
    head = ComplexListNode(0)
    
    let cloneHead = cloneComplexListNode(head)
    assert(cloneHead?.value == 0)
    assert(cloneHead?.sibling == nil)
}

// 测试指向自己
func testClonePointerSelf() {
    var head: ComplexListNode<Int>!
    var node1: ComplexListNode<Int>!
    var node2: ComplexListNode<Int>!
    
    head = ComplexListNode(0)
    node1 = ComplexListNode(1)
    node2 = ComplexListNode(2)
    
    head.next = node1
    node1.next = node2
    node2.next = nil
    
    head.sibling = head
    node1.sibling = node1
    node2.sibling = node2
    
    let cloneHead = cloneComplexListNode(head)
    assert(cloneHead?.value == 0)
    assert(cloneHead?.sibling?.value == 0)
    
    node1 = cloneHead?.next
    assert(node1?.value == 1)
    assert(node1?.sibling?.value == 1)
    
    node2 = node1.next
    assert(node2?.value == 2)
    assert(node2?.sibling?.value == 2)
}

// 测试环状
func testCloneRingNodes() {
    var head: ComplexListNode<Int>!
    var node1: ComplexListNode<Int>!
    var node2: ComplexListNode<Int>!
    
    head = ComplexListNode(0)
    node1 = ComplexListNode(1)
    node2 = ComplexListNode(2)
    
    head.next = node1
    node1.next = node2
    node2.next = nil
    
    head.sibling = node2
    node1.sibling = nil
    node2.sibling = head
    
    let cloneHead = cloneComplexListNode(head)
    assert(cloneHead?.value == 0)
    assert(cloneHead?.sibling?.value == 2)
    
    node1 = cloneHead?.next
    assert(node1?.value == 1)
    assert(node1?.sibling == nil)
    
    node2 = node1.next
    assert(node2?.value == 2)
    assert(node2?.sibling?.value == 0)
}

func testCloneComplexListnode() {
    testCloneFiveNodes()
    testCloneOnlyOneNode()
    testClonePointerSelf()
    testCloneRingNodes()
}

testCloneComplexListnode()

