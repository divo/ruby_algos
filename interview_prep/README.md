# Interview prep
Notes for different interview questions. Data structure etc notes are in Obsiden

## two_sum.rb
Naive solution is N^2 and pretty easy to figure out. Only trick regarding `each_with_index` is the inner loop index will be relative so you need to add the outher loop index to it.

O(n) solution builds a hash of the input and then iterates the numbers looking for the current compliment in the hash.

I gather the "real" interview way is to use two pointers coming from each end of the array. If the result is lower than target, increment the right pointer, if the result is higher decrement the left pointer.

## valid_parens.swift
Fairly simple stack question for matching paires of braces. My low-level Swift knowledge is very rusty.

You don't need a base case for the first character.

