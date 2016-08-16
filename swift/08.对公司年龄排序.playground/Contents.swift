//: Playground - noun: a place where people can play
// 对公司年龄排序

import UIKit

enum MyError: ErrorType {
    case AgeError(age: Int)
}

func sortAges(inout ages: [Int]) throws {
    // 辅助空间 index代表岁数（0～99岁），value值是 年龄出现的次数
    var timesOfAge = Array<Int>(count: 100, repeatedValue: 0)
    
    // 统计出现次数
    for age in ages {
        if age <= 0 || age >= 100 {
            throw MyError.AgeError(age: age)
        }
        
        timesOfAge[age] += 1
    }
    
    var index = 0
    for i in 1..<timesOfAge.count {
        if timesOfAge[i] == 0 {
            continue
        }
        // 根据次数 对原数组重新赋值
        for _ in 1...timesOfAge[i] {
            ages[index] = i
            index += 1
        }
    }
}

func testSortAgeHelper(inout ages: [Int]) {
    do {
        try sortAges(&ages)
        print(ages)
    } catch MyError.AgeError(let age) {
        print("age(\(age)) out of range")
    } catch {
        print("Other Error")
    }
}

func testSortAge() {
    var ages = [31, 18, 15, 25, 33, 22, 19, 34, 31, 18, 32, 40, 25]
    testSortAgeHelper(&ages)
    assert(ages == [15, 18, 18, 19, 22, 25, 25, 31, 31, 32, 33, 34, 40])
    
    ages = []
    testSortAgeHelper(&ages)
    assert(ages == [])
    
    ages = [1]
    testSortAgeHelper(&ages)
    assert(ages == [1])
}

testSortAge()
