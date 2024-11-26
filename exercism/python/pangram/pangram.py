from pdb import set_trace as bp


# The better way is with a set, which I will come to later
def is_pangram(sentence):
    counts = [0] * 26

    for c in sentence.lower():
        index = ord(c) - 97
        if index >= 0 and index <= 26:
            counts[ord(c) - 97] = 1

    return sum(counts) == 26
