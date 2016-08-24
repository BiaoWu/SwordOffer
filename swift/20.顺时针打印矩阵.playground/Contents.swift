//: Playground - noun: a place where people can play
// 顺时针打印矩阵

import UIKit

enum Direction {
    case Right
    case Down
    case Left
    case Up
    
    func next() -> Direction {
        switch self {
        case .Right:
            return .Down
        case .Down:
            return .Left
        case .Left:
            return .Up
        case .Up:
            return .Right
        }
    }
}

func checkMatrix<T>(matrix: [[T]]) -> Bool {
    // 可检查每行数组的长度是否相等
    return matrix.count > 0 && matrix[0].count > 0
}

//  ---->
//  ^   |
//  |   V
//  <----
func printMatrix<T>(matrix: [[T]]) {
    if !checkMatrix(matrix) {
        return
    }
    
    // 当前位置
    var currentRow = 0
    var currentColumn = 0
    
    // 控制方向
    var direction = Direction.Right
    
    // 控制范围
    var minRow = 0
    var minColumn = 0
    var maxRow = matrix.count - 1
    var maxColumn = matrix[0].count - 1
    
    // 范围内
    while maxRow >= minRow && maxColumn >= minColumn {
        print("\(matrix[currentRow][currentColumn])", terminator: " ")
        
        switch direction {
        case .Right:
            if currentColumn < maxColumn {
                currentColumn += 1
            } else {
                minRow += 1
                currentRow += 1
                direction = direction.next()
            }
        case .Down:
            if currentRow < maxRow {
                currentRow += 1
            } else {
                maxColumn -= 1
                currentColumn -= 1
                direction = direction.next()
            }
        case .Left:
            if currentColumn > minColumn {
                currentColumn -= 1
            } else {
                maxRow -= 1
                currentRow -= 1
                direction = direction.next()
            }
        case .Up:
            if currentRow > minRow {
                currentRow -= 1
            } else {
                minColumn += 1
                currentColumn += 1
                direction = direction.next()
            }
        }
    }
    
    print()
}

func testPrintMatrix() {
    var matrix = [
        [ 1,  2,  3,  4],
        [ 5,  6,  7,  8],
        [ 9, 10, 11, 12],
        ]
    printMatrix(matrix)
    
    matrix = [
        [ 1,  2,  3,  4],
        [ 5,  6,  7,  8],
        [ 9, 10, 11, 12],
        [13, 14, 15, 16],
    ]
    printMatrix(matrix)
    
    matrix = [
        [ 1,  2,  3],
        [ 4,  5,  6],
        [ 7,  8,  9],
        [10, 11, 12],
    ]
    printMatrix(matrix)
}

testPrintMatrix()
