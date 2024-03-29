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

## Sliding window
904 and 340
First attempt was to slide the window out at the end until boundry condition, the n increment the start by one and start sliding the window out again. This isn't a sliding window, it's a N! brute force match.

The key is to expand the window linearly along until the boundry condition is met, the slide the _start_ of the window forward until under the boundry condition again.
We don't need a seperate check for this. Just enumerate the set normally and on every iteration shrink the window from the front until boundry condition satisfied. If the boundry condition is met during that iteration then the start of the window won't need to move. The conditional is in this loop.

## 121.best-time-to-buy-and-sell-stock.rb
Data structure / technique: Sliding Window

This was pretty tricky. It requires a bit of thought and there is no simple technique that just works with it. Brute force solution is easy, but gives O(n!) complexity.

We can leverage the fact the max we are looking for must occuer AFTER the min: Store a result (our max profit) and min seen value. At each step check if the value is lower than the current min and update accordingly, and if the current value gives us more profit, using the current min, then our current profit. It's somewhat like a sliding window, but we don't need a subarray to track the min, just a single value.

## Two pointers
### 15.3sum.rb
Data structure / technique: Two pointers

Simple way is to just use 3 nested loops. Terrible performance, N^3? Trick for uniqness is to sort the elements that sum to target before you add them and then check if they are already present.

The n log n solution is a variation on 2 sum with two pointers, array must be sorted first. Iterate over the array and find any pairs that sum to the compliment of the current element. Searching for pairs uses a normal 2 pointer style approach, move left then sum is less than target and move right when sum is greater than target.
The trick to no duplicates is skipping any element that repeats. Before each iteration check if the current element is the same as the previous and if they are, skip the current element. This happens in the main loop before we look for pairs (where we must take care to not apply this check for the first element), and also whenever we find a pair; we need to increment the left pointer until we find a new element


### 11.container-with-most-water.rb
Got this one on the first try. Simple enough two pointer problem, move the left or right depending on which is smaller

## Binary Tree / Search

### 226 Invert
I made a mess of this. Recursive algorithms are not hard!:
    1. Handle the base case, which is generally the empty / nil case. e.x. Return if nil
    2. Continue to recurse / navigate to the base case, e.x. Calls for left and right node of current
    3. Do the work after the recursion is done. Swap the elements / take the smallest / whatever. e.x. Swap left and right node

### Binary Search
Managed to get this one first times after some fiddeling.
1. Stop the loop after the left OVERTAKES right, not when they are equal
2. Decrement / increment the pivot by one when assigning to right / left as we don't need to consider the pivot again. Also the loop will never finish if we don't
