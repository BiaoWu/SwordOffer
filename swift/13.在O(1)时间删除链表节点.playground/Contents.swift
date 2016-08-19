//: Playground - noun: a place where people can play
// 在O(1)时间删除链表节点

import UIKit

class ListNode<T> {
    var value: T!
    var next:ListNode<T>?
    
    init(_ value: T) {
        self.value = value
    }
}

class LinkedList<T> {
    var head: ListNode<T>?
    
    init(_ value: T) {
        self.head = ListNode(value)
    }
    
    init(_ head: ListNode<T>?) {
        self.head = head
    }
    
    //快速制造下一个节点 并返回它
    func appendNode(value: T) -> ListNode<T>? {
        let node = ListNode(value)
        appendNode(node)
        return node
    }
    
    func appendNode(node: ListNode<T>?) {
        if head == nil {
            head = node
        } else {
            var last = head
            while last!.next != nil {
                last = last!.next
            }
            last!.next = node
        }
    }
    
    func deleteNode<T>(inout deleteNode: ListNode<T>?) {
        // 不存在
        if head == nil || deleteNode  == nil {
            return
        }
        
        if head === deleteNode {
            head = nil
            return
        }
        
        // 当节点存在下一个时 把下一个的值弄过来 删除下一个节点。
        // 虽然不用遍历了，但是有点莫名其妙 你明明删的这个 却删的下一个。
        // 优点是时间是O(1), 缺点 没验证是否在当前head的链中
        if let next = deleteNode!.next {
            print("find by next!")
            deleteNode!.value = next.value
            deleteNode!.next = next.next
        } else {
            print("find by while!")
            var node = head
            while node != nil {
                if node?.next === deleteNode {
                    deleteNode = nil
                    node?.next = nil
                    break
                } else {
                    node = node?.next
                }
            }
        }
    }
    
    func printNode() {
        var node = head
        while node != nil {
            print("node.value = \(node!.value)")
            node = node!.next
        }
    }
}

func testDeleteNode() {
    let linkedList = LinkedList(1)
    linkedList.appendNode(2)
    var targetNode = linkedList.appendNode(3)
    linkedList.appendNode(4)
    
    print("original")
    linkedList.printNode()
    
    // 删中间节点
    print("delete targetNode -> \(targetNode!.value)")
    linkedList.deleteNode(&targetNode)
    linkedList.printNode()
    
    // 删尾节点
    print("delete targetNode -> \(targetNode!.value)")
    linkedList.deleteNode(&targetNode)
    linkedList.printNode()
    
    // 删除头节点
    print("delete targetNode -> \(linkedList.head!.value)")
    linkedList.deleteNode(&linkedList.head)
    linkedList.printNode()
    
}

testDeleteNode()

