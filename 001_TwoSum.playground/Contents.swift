/*
 https://leetcode.com/problems/two-sum/
 */

import Foundation

class Solution {
    
    // O(n^2) ブルートフォース データ構造作らずに探索
    func twoSum(_ nums: [Int], _ target: Int) -> [Int] {
        for index in (0 ..< nums.endIndex) {
            for index1 in (index + 1 ..< nums.endIndex) {
                if nums[index] + nums[index1] == target {
                    return [index, index1]
                }
            }
        }
        return []
    }
    
    // O(n) データ構造を作ってから探索
    func twoSum1(_ nums: [Int], _ target: Int) -> [Int] {
        var dictionary: [Int: Int] = [:]
        for (index, num) in nums.enumerated() {
            dictionary[num] = index
        }
        
        for (index, num) in nums.enumerated() {
            let newTarget = target - num
            if let newIndex = dictionary[newTarget], newIndex != index {
                return [index, newIndex]
            }
        }
        
        return []
    }
    
    // O(n) データ構造を作りながら探索
    func twoSum2(_ nums: [Int], _ target: Int) -> [Int] {
        var dictionary: [Int: Int] = [:]
        
        for (index, num) in nums.enumerated() {
            let newTarget = target - num
            if let newIndex = dictionary[newTarget], newIndex != index {
                return [index, newIndex]
            } else {
                dictionary[num] = index
            }
        }
        
        return []
    }
}

let answer = Solution().twoSum([2, 7, 11, 15], 9)
print(answer)

let answer1 = Solution().twoSum1([2, 7, 11, 15], 9)
print(answer1)

let answer2 = Solution().twoSum2([2, 7, 11, 15], 9)
print(answer2)
