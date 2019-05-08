/*
 https://leetcode.com/problems/add-two-numbers/
 */

import Foundation

public class ListNode {
    public var val: Int
    public var next: ListNode?
    public init(_ val: Int) {
        self.val = val
        self.next = nil
    }
}

class Solution {
    
    func addTwoNumbers(_ l1: ListNode?, _ l2: ListNode?) -> ListNode? {
        let dummy = ListNode(0)
        var l1 = l1, l2 = l2, carry = 0
        var node: ListNode? = dummy
        
        while l1 != nil || l2 != nil {
            let x = l1?.val ?? 0
            let y = l2?.val ?? 0
            let sum = carry + x + y
            carry = sum / 10
            node?.next = ListNode(sum % 10)
            node = node?.next
            if l1 != nil {
                l1 = l1?.next
            }
            if l2 != nil {
                l2 = l2?.next
            }
        }
        if carry > 0 {
            node?.next = ListNode(carry)
        }
        return dummy.next // ListNodeはクラス（参照）なのでdummyに値が入っている
    }
}

let l1 = ListNode(2)
l1.next = ListNode(4)
l1.next?.next = ListNode(3)

let l2 = ListNode(5)
l2.next = ListNode(6)
l2.next?.next = ListNode(4)

let answer = Solution().addTwoNumbers(l1, l2)
print(answer?.val)
print(answer?.next?.val)
print(answer?.next?.next?.val)
