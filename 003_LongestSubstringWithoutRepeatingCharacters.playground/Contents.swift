/*
 https://leetcode.com/problems/longest-substring-without-repeating-characters/
 */

import Foundation

class Solution {
    // O(n^2) ブルートフォース
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

print(Solution().lengthOfLongestSubstring("abcabcbb"))
print(Solution().lengthOfLongestSubstring("bbbbb"))
print(Solution().lengthOfLongestSubstring("pwwkew"))
