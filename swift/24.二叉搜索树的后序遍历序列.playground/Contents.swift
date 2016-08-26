//: Playground - noun: a place where people can play
// 二叉搜索树的后序遍历序列
// 1. 已经排序
// 2. 后序 也就是 左 右 根
// 例如[5, 7, 6, 9, 11, 10, 8]
// 首先最后一个8 是根节点
// 因为是有序的 所以左边比8小 右边比8大 所以[5, 7, 6] 是左 ，[9, 11, 10]是右, 然后思想递归

import UIKit

// 目前不支持有相同的值 todo
func verifyOrderBinaryTree<T: Comparable>(arr: [T]) -> Bool {
    if arr.count == 0 {
        return false
    } else if arr.count == 1 {
        return true
    }
    
    var rightStartIndex = -1
    for i in 0..<arr.count - 1 {
        if arr[i] > arr[arr.count - 1] {
            rightStartIndex = i
            break
        }
    }
    var leftVerify = true
    if rightStartIndex == -1 {
        leftVerify = verifyOrderBinaryTree(Array(arr[0..<arr.count - 1]))
    } else if rightStartIndex > 0 {
        leftVerify = verifyOrderBinaryTree(Array(arr[0..<rightStartIndex]))
    }
    
    var rightVerify = true
    if rightStartIndex >= 0  {
        rightVerify = verifyOrderBinaryTree(Array(arr[rightStartIndex..<arr.count - 1]))
    }
    
    return leftVerify && rightVerify
}

func testVerifyOrderBinaryTree() {
    var orderArr: [Int]!
    
    orderArr = [5, 7, 6, 9, 11, 10, 8]
    assert(verifyOrderBinaryTree(orderArr))
    
    orderArr = [4, 6, 7, 5]
    assert(verifyOrderBinaryTree(orderArr))
    
    orderArr = [1, 2, 3, 4, 5]
    assert(verifyOrderBinaryTree(orderArr))
    
    orderArr = [5, 4, 3, 2, 1]
    assert(verifyOrderBinaryTree(orderArr))
    
    orderArr = [1]
    assert(verifyOrderBinaryTree(orderArr))
}

testVerifyOrderBinaryTree()
