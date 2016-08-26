//: Playground - noun: a place where people can play
// 二叉树中和为某一值的路径
//

import UIKit

func findPath(root: BinaryTreeNode<Int>, targetSum: Int) {
    
    var stack = [Int]()
    var currentSum = 0
    
    findPath(root, targetSum: targetSum, stack: &stack, currentSum: &currentSum)
}


func findPath(node: BinaryTreeNode<Int>,
              targetSum: Int,
              inout stack: [Int],
                    inout currentSum: Int) {
    
    stack.append(node.value)
    currentSum += node.value
    
    if currentSum == targetSum {
        print(stack)
    } else if currentSum < targetSum {
        if node.left != nil {
            findPath(node.left!, targetSum: targetSum, stack: &stack,currentSum: &currentSum)
        }
        if node.right != nil {
            findPath(node.right!, targetSum: targetSum, stack: &stack,currentSum: &currentSum)
        }
    }
    
    stack.removeLast()
    currentSum -= node.value
}

func testFindPath() {
    var root: BinaryTreeNode<Int>!
    
    root = BinaryTreeNode(10)
        .left(BinaryTreeNode(5).left(4).right(7))
        .right(12)
    
    findPath(root, targetSum: 22)
    findPath(root, targetSum: 15)
    
    findPath(root, targetSum: 23)
}

testFindPath()
