//
//  001_TwoSum.swift
//  LeetCode
//
//  Created by Toru Asai on 2019/04/01.
//  Copyright © 2019 Toru Asai. All rights reserved.
//

/*
 https://leetcode.com/problems/two-sum/
 
 Given an array of integers, return indices of the two numbers such that they add up to a specific target.
 
 You may assume that each input would have exactly one solution, and you may not use the same element twice.
 
 Example:
 
 Given nums = [2, 7, 11, 15], target = 9,
 
 Because nums[0] + nums[1] = 2 + 7 = 9,
 return [0, 1].
 
 */

import Foundation

class TwoSumSolution {
    
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
    func twoSum0(_ nums: [Int], _ target: Int) -> [Int] {
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
    func twoSum1(_ nums: [Int], _ target: Int) -> [Int] {
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
