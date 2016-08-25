//
//  BinaryTreeNode.swift
//
//
//  Created by BiaoWu on 16/8/23.
//
//

import Foundation

public class BinaryTreeNode<T: Comparable> {
    public var value: T!
    
    public var left: BinaryTreeNode<T>?
    public var right: BinaryTreeNode<T>?
    
    public init(_ value: T) {
        self.value = value
    }
}

extension BinaryTreeNode {
    public func left(value: T) -> BinaryTreeNode<T> {
        return left(BinaryTreeNode(value))
    }
    
    public func left(node: BinaryTreeNode<T>) -> BinaryTreeNode<T> {
        self.left = node
        return self
    }
    
    public func right(value: T) -> BinaryTreeNode<T> {
        return right(BinaryTreeNode(value))
    }
    
    public func right(node: BinaryTreeNode<T>) -> BinaryTreeNode<T> {
        self.right = node
        return self
    }
}

extension BinaryTreeNode {
    public func printByPreOrder() {
        printByPreOrder(self)
    }
    
    func printByPreOrder(node: BinaryTreeNode?) {
        guard let node = node else {
            return
        }
        
        print(node.value)
        printByPreOrder(node.left)
        printByPreOrder(node.right)
    }
    
    public func printByMidOrder() {
        printByMidOrder(self)
    }
    
    func printByMidOrder(node: BinaryTreeNode?) {
        guard let node = node else {
            return
        }
        
        printByPreOrder(node.left)
        print(node.value)
        printByPreOrder(node.right)
    }
    
    public func printByAfterOrder() {
        printByAfterOrder(self)
    }
    
    func printByAfterOrder(node: BinaryTreeNode?) {
        guard let node = node else {
            return
        }
        
        printByPreOrder(node.left)
        printByPreOrder(node.right)
        print(node.value)
    }
}