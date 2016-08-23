//: Playground - noun: a place where people can play
// 树的子结构

import UIKit

class BinaryTreeNode<T: Comparable> {
    var value: T!
    
    var left: BinaryTreeNode<T>?
    var right: BinaryTreeNode<T>?
    
    init(_ value: T) {
        self.value = value
    }
    
    func left(value: T) -> BinaryTreeNode<T> {
        return left(BinaryTreeNode(value))
    }
    
    func left(node: BinaryTreeNode<T>) -> BinaryTreeNode<T> {
        self.left = node
        return self
    }
    
    func right(value: T) -> BinaryTreeNode<T> {
        return right(BinaryTreeNode(value))
    }
    
    func right(node: BinaryTreeNode<T>) -> BinaryTreeNode<T> {
        self.right = node
        return self
    }
    
    func contains(target: BinaryTreeNode<T>) -> Bool {
        return contains(self, target: target)
    }
    
    private func contains(node: BinaryTreeNode<T>?, target: BinaryTreeNode<T>?) -> Bool {
        if node == nil || target == nil {
            return false
        }
        
        // 先看当前节点是否符合，不符合看它左边和右边
        return containsCore(node, target: target)
            || contains(node!.left, target: target)
            || contains(node!.right, target: target)
    }
    
    private func containsCore(node: BinaryTreeNode<T>?, target: BinaryTreeNode<T>?) -> Bool {
        // 3.1 目标节点 已经没有左右节点了
        guard let target = target else {
            return true
        }
        
        // 3.2 目标节点还有左右节点 但parent 没有节点了
        guard let node = node else {
            return false
        }
        
        // 1. 比对节点值
        if node.value != target.value {
            return false
        }
        
        // 2. 当节点比对ok后 左右节点都ok才行
        return containsCore(node.left, target: target.left) && containsCore(node.right, target: target.right)
    }
}

func testBinaryTree() {
    let root = BinaryTreeNode(1)
        .left(BinaryTreeNode(2).left(4).right(5))
        .right(BinaryTreeNode(3).left(6).right(7))
    
    var target = BinaryTreeNode(2).left(4).right(5)
    assert(root.contains(target))
    
    target = BinaryTreeNode(3).left(6)
    assert(root.contains(target))
    
    target = BinaryTreeNode(1).left(2).right(3)
    assert(root.contains(target))
    
    target = BinaryTreeNode(7)
    assert(root.contains(target))
}

testBinaryTree()
