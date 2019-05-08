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
    
    func lengthOfLongestSubstring1(_ s: String) -> Int {
        let n = s.count
        var set = Set<Character>()
        var ans = 0, i = 0, j = 0
        
        while i < n && j < n {
            if !set.contains(s[s.index(s.startIndex, offsetBy: j)]) {
                j += 1
                set.insert(s[s.index(s.startIndex, offsetBy: j)])
                ans = max(ans, j - i)
            } else {
                i += 1
                set.remove(s[s.index(s.startIndex, offsetBy: i)])
            }
        }
        return ans
    }
}

print(Solution().lengthOfLongestSubstring("abcabcbb"))
print(Solution().lengthOfLongestSubstring("bbbbb"))
print(Solution().lengthOfLongestSubstring("pwwkew"))

print(Solution().lengthOfLongestSubstring1("abcabcbb"))
print(Solution().lengthOfLongestSubstring1("bbbbb"))
print(Solution().lengthOfLongestSubstring1("pwwkew"))
