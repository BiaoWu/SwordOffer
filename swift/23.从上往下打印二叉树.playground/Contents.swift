//: Playground - noun: a place where people can play
// 从上往下打印二叉树
// 乍一看 貌似无从下手
// 因为 前序 中序 后序 都是深度优先
// 这个是广度优先
// 简单画图后发现 输出队列的规律：输出某个节点时 会将它的左右子节点加入序列

import UIKit

func printBinaryTree<T>(node: BinaryTreeNode<T>) {
    var queue = [BinaryTreeNode<T>]()
    queue.append(node)
    
    var currentNode: BinaryTreeNode<T>!
    
    while queue.count > 0 {
        currentNode = queue.removeFirst()
        
        print(currentNode.value)
        
        if currentNode.left != nil {
            queue.append(currentNode.left!)
        }
        
        if currentNode.right != nil {
            queue.append(currentNode.right!)
        }
    }
}

func testPrintBinaryTree() {
    let root = BinaryTreeNode(1)
    root.left(BinaryTreeNode(2).left(4).right(5))
    root.right(BinaryTreeNode(3).left(6).right(7))
    
    printBinaryTree(root)
}

testPrintBinaryTree()

