//: Playground - noun: a place where people can play
// 重建二叉树
// 前序遍历：先根 后左 再右
// 中序遍历：先左 后根 再右
// 后序遍历：先左 后右 再根

import UIKit

class BinaryTreeNode {
    var value: Int!
    var left: BinaryTreeNode?
    var right: BinaryTreeNode?
    
    init(value: Int){
        self.value = value
    }
    
    init(value: Int, left: BinaryTreeNode?, right: BinaryTreeNode?){
        self.value = value
        self.left = left
        self.right = right
    }
}

func checkOrder(preOrder: [Int], _ midOrder: [Int]) -> Bool {
    //todo
    return true
}

// 根据给定前序 和 中序 还原出根节点
func rebuildTreeByPreAndMidOrder(preOrder: [Int], _ midOrder: [Int]) -> BinaryTreeNode? {
    if !checkOrder(preOrder, midOrder) {
        return nil
    }
    
    let rootValue = preOrder[0]
    
    // 前序的第一位 就是根节点
    let root = BinaryTreeNode(value: rootValue)
    
    // 在中序 找到根节点
    let rootIndexInMid = midOrder.indexOf(rootValue)
    
    // 根据中序的特点：根节点左边就是左，右边就是右. 就可以得到左右的个数
    if rootIndexInMid > 0 {
        root.left = rebuildTreeByPreAndMidOrder(Array(preOrder[1...rootIndexInMid!]), Array(midOrder[0..<rootIndexInMid!]))
    }
    if rootIndexInMid < midOrder.count - 1 {
        root.right = rebuildTreeByPreAndMidOrder(Array(preOrder[rootIndexInMid! + 1..<preOrder.count]), Array(midOrder[rootIndexInMid! + 1..<midOrder.count]))
    }
    
    return root
}

// 构建 前序
func buildPre(root: BinaryTreeNode) -> [Int] {
    var values = [Int]()
    func pre(root: BinaryTreeNode){
        values.append(root.value)
        if root.left != nil {
            pre(root.left!)
        }
        if root.right != nil {
            pre(root.right!)
        }
    }
    pre(root)
    return values
}

// 构建 中序
func buildMid(root: BinaryTreeNode) -> [Int] {
    var values = [Int]()
    func mid(root: BinaryTreeNode){
        if root.left != nil {
            mid(root.left!)
        }
        values.append(root.value)
        if root.right != nil {
            mid(root.right!)
        }
    }
    mid(root)
    return values
}

func testRebuildTreeByPreAndMidOrder() {
    let preOrder = [1,2,4,7,3,5,6,8]
    let midOrder = [4,7,2,1,5,3,8,6]
    
    let root = rebuildTreeByPreAndMidOrder(preOrder, midOrder)
    
    let resultPre = buildPre(root!)
    print("resultPre = \(resultPre)")
    assert(resultPre == preOrder)
    
    let resultMid = buildMid(root!)
    print("resultMid = \(resultMid)")
    assert(resultMid == midOrder)
}

testRebuildTreeByPreAndMidOrder()