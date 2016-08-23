//: Playground - noun: a place where people can play
// 二叉树的镜像
// 实际上这题的代码很简单，只不过光想不容易想
// 画图 就很容易发现规律

import UIKit

func mirror<T>(node: BinaryTreeNode<T>) {
    let left = node.left
    node.left = node.right
    node.right = left
    
    if node.left != nil {
        mirror(node.left!)
    }
    
    if node.right != nil {
        mirror(node.right!)
    }
}

func testMirror() {
    let root = BinaryTreeNode(1)
        .left(BinaryTreeNode(2).left(4).right(5))
        .right(BinaryTreeNode(3).left(6).right(7))
    
    mirror(root)
    assert(root.value == 1)
    assert(root.left?.value == 3)
    assert(root.left?.left?.value == 7)
    assert(root.left?.right?.value == 6)
    
    assert(root.right?.value == 2)
    assert(root.right?.left?.value == 5)
    assert(root.right?.right?.value == 4)
}

testMirror()
