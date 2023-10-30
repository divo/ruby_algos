# Interview prep
Notes for different interview questions. Data structure etc notes are in Obsiden

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

## Merge two lists
Data structure / technique: Two pointers (Linked list traversal)

Requires two pointers, for the left and right. Don't check current.next or anything, just look at the current pointers.

Keep a reference to the result and to the current head of the list. You traverse the current head and return the result.

Easy way to initalize a result is to make an empty node and just return `result.next`.

Make sure to handle one list ending before the other, by appending the remainder of the list to the result.
