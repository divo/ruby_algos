# Interview prep
Notes for different interview questions. Data structure etc notes are in Obsiden

Only describing question that I found challenging / didn't figure out immediately

Using https://github.com/clearloop/leetcode-cli for leetcode interface
Config file for language is in ~/.leetcode/leetcode.toml

## two_sum.rb
Data structure / technique: Two pointer

Naive solution is N^2 and pretty easy to figure out. Only trick regarding `each_with_index` is the inner loop index will be relative so you need to add the outher loop index to it.

O(n) solution builds a hash of the input and then iterates the numbers looking for the current compliment in the hash.

I gather the "real" interview way is to use two pointers coming from each end of the array. If the result is lower than target, increment the right pointer, if the result is higher decrement the left pointer.

## valid_parens.swift
Data structure / technique: Stack

Fairly simple stack question for matching paires of braces. My low-level Swift knowledge is very rusty.

You don't need a base case for the first character.

## 125.valid-palindrome.rb
Data structyre / technique: Two pointers

Fairly simple question, strip the string of all :punct: then traverse from both ends matching as you go. No need to distinguish odd and even length strings.

If using arrays, split the input in 2, reverse one and compare, you will need to distinguish different length strings. Don't use arrays

## 15.3sum.rb
Data structure / technique: Two pointers

Simple way is to just use 3 nested loops. Terrible performance, N^3? Trick for uniqness is to sort the elements that sum to target before you add them and then check if they are already present.

Proper way is to modify two sum, for each pair search the list for their compliment. Or something, I don't really care.

## 21.merge-two-sorted-lists.rb
Data structure / technique: Two pointers (Linked list traversal)

Requires two pointers, for the left and right. Don't check current.next or anything, just look at the current pointers.

Keep a reference to the result and to the current head of the list. You traverse the current head and return the result.

Easy way to initalize a result is to make an empty node and just return `result.next`.

Make sure to handle one list ending before the other, by appending the remainder of the list to the result.

## 26.remove duplicates
Data structure / technique: Two pointers

This one gave me a LOT of difficulty. Maybe it's something to do with the nagative case but I can't wrap my feable brain around this.

Keep a pointer to the last non duplicate, starting at 0. Iterate the array from 1, as the first element cannot be a duplicate. If the current number is not equal to the last non duplicate, replace the number AFTER the last known duplicate with it, then advance the position of the last known duplicate.
Remember to compensate for array size vs index when returning last non duplicate

## 345.reverse-vowels-of-a-string.rb
Data structure / technique: Two pointer

Iterate from either end until you find a vowel on each side, swap them, repeat. This gives O(n).

A worse solution is build a stack of vowels and then iterate the string again, swaping vowels off the stack as you go. This gives O(2n).

## 121.best-time-to-buy-and-sell-stock.rb
Data structure / technique: Sliding Window

This was pretty tricky. It requires a bit of thought and there is no simple technique that just works with it. Brute force solution is easy, but gives O(n!) complexity.

We can leverage the fact the max we are looking for must occuer AFTER the min: Store a result (our max profit) and min seen value. At each step check if the value is lower than the current min and update accordingly, and if the current value gives us more profit, using the current min, then our current profit. It's somewhat like a sliding window, but we don't need a subarray to track the min, just a single value.
