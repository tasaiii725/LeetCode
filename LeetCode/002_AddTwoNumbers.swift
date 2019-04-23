//
//  002_AddTwoNumbers.swift
//  LeetCode
//
//  Created by toru-asai on 2019/04/17.
//  Copyright © 2019 Toru Asai. All rights reserved.
//

/*
 https://leetcode.com/problems/add-two-numbers/
 
 You are given two non-empty linked lists representing two non-negative integers. The digits are stored in reverse order and each of their nodes contain a single digit. Add the two numbers and return it as a linked list.
 
 You may assume the two numbers do not contain any leading zero, except the number 0 itself.
 
 Example:
 
 Input: (2 -> 4 -> 3) + (5 -> 6 -> 4)
 Output: 7 -> 0 -> 8
 Explanation: 342 + 465 = 807.

 */

import Foundation

class AddTwoNumbersSolution {
    class ListNode {
        public var val: Int
        public var next: ListNode?
        public init(_ val: Int) {
            self.val = val
            self.next = nil
        }
    }
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
        return dummy.next // because ListNode is class
    }
}
