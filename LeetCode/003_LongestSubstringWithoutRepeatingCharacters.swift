//
//  003_LongestSubstringWithoutRepeatingCharacters.swift
//  LeetCode
//
//  Created by toru-asai on 2019/04/23.
//  Copyright © 2019 Toru Asai. All rights reserved.
//

/*
 
 https://leetcode.com/problems/longest-substring-without-repeating-characters/
 
 Given a string, find the length of the longest substring without repeating characters.
 
 Example 1:
 
 Input: "abcabcbb"
 Output: 3
 Explanation: The answer is "abc", with the length of 3.
 Example 2:
 
 Input: "bbbbb"
 Output: 1
 Explanation: The answer is "b", with the length of 1.
 Example 3:
 
 Input: "pwwkew"
 Output: 3
 Explanation: The answer is "wke", with the length of 3.
 Note that the answer must be a substring, "pwke" is a subsequence and not a substring.
 
 */

import Foundation

class LengthOfLongestSubstringSolution {
//    func lengthOfLongestSubstring(_ s: String) -> Int {
//        var result: Int = 0
//
//        var temp: [Character] = []
//        for (i1, c1) in s.enumerated() {
//            temp.append(c1)
//            for i2 in (i1+1)..<s.count {
//                let c = s[s.index(s.startIndex, offsetBy: i2)]
//                if !temp.contains(c) {
//                    temp.append(c)
//                } else {
//                    break
//                }
//            }
//            if result < temp.count {
//                result = temp.count
//            }
//            temp.removeAll()
//        }
//
//        return result
//    }
    
    func lengthOfLongestSubstring(_ s: String) -> Int {
        var result: Int = 0
        
        var temp: [Character] = []
        for (i1, c1) in s.enumerated() {
            temp.append(c1)
            for i2 in (i1+1)..<s.count {
                let c = s[s.index(s.startIndex, offsetBy: i2)]
                if !temp.contains(c) {
                    temp.append(c)
                } else {
                    break
                }
            }
            if result < temp.count {
                result = temp.count
            }
            temp.removeAll()
        }
        
        return result
    }

}
