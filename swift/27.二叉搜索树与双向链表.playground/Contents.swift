//: Playground - noun: a place where people can play
// 二叉搜索树与双向链表
// 将一个二叉搜索树转换成一个双向链表。
// 不能创建新节点

import UIKit

//
//       A
//     /   \
//    B     E
//   / \   / \
//  C   D F   G

// 遍历从A开始
// 左边部分 处理 B <=> C <=> D 后 返回D节点 因为右边最大，如果没有右边则返回中间节点
// 右边部分 处理 F <=> E <=> G 后 返回F节点 因为左边最小，如果没有左边则返回中间节点
// 对于A来说 连接左右返回的最大或最小节点即可

func convert<T>(root: BinaryTreeNode<T>?) -> BinaryTreeNode<T>? {
    if root == nil {
        return nil
    }
    
    // 从返回的节点一直向左 找到head返回
    var node = convertCore(root)
    print("before node : \(node?.value)")
    
    while node?.left != nil {
        node = node!.left
    }
    
    print("after node : \(node?.value)")
    return node
}

private func convertCore<T>(node: BinaryTreeNode<T>?, fromLeft: Bool = true) -> BinaryTreeNode<T>? {
    if node == nil {
        return nil
    }
    
    if node?.left != nil {
        let left = convertCore(node?.left)
        
        left?.right = node
        node?.left = left
    }
    
    if node?.right != nil {
        let right = convertCore(node?.right, fromLeft: false)
        
        right?.left = node
        node?.right = right
    }
    
    return (fromLeft ? node?.right : node?.left) ?? node
}

func testFullTree() {
    let root = BinaryTreeNode(5)
    
    root.left(BinaryTreeNode(3).left(2).right(4))
    root.right(BinaryTreeNode(8).left(7).right(9))
    
    let linkedList = convert(root)
    
    var node = linkedList
    assert(node?.value == 2)
    
    node = node?.right
    assert(node?.value == 3)
    
    node = node?.right
    assert(node?.value == 4)
    
    node = node?.right
    assert(node?.value == 5)
    
    node = node?.right
    assert(node?.value == 7)
    
    node = node?.right
    assert(node?.value == 8)
    
    node = node?.right
    assert(node?.value == 9)
}


func testNoRightTree() {
    let root = BinaryTreeNode(5)
    
    root.left(BinaryTreeNode(3).left(2))
    
    let linkedList = convert(root)
    
    var node = linkedList
    assert(node?.value == 2)
    
    node = node?.right
    assert(node?.value == 3)
    
    node = node?.right
    assert(node?.value == 5)
}


func testNoLeftTree() {
    let root = BinaryTreeNode(5)
    
    root.right(BinaryTreeNode(8).right(9))
    
    let linkedList = convert(root)
    
    var node = linkedList
    assert(node?.value == 5)
    
    node = node?.right
    assert(node?.value == 8)
    
    node = node?.right
    assert(node?.value == 9)
}

func testOnlyOneNodeTree() {
    let root = BinaryTreeNode(5)
    
    let linkedList = convert(root)
    
    assert(linkedList?.value == 5)
}

func testNilTree() {
    // 有泛型无法传入nil。。。
    //    let linkedList = convert(nil)
    //    assert(linkedList == nil)
}

func testConverBinaryTree2LinkedList() {
    testFullTree()
    testNoRightTree()
    testNoLeftTree()
    testOnlyOneNodeTree()
    testNilTree()
}

testConverBinaryTree2LinkedList()
