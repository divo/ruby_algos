from pdb import set_trace as bp


def is_pangram(sentence):
    counts = [0] * 26

    for c in sentence.lower():
        index = ord(c) - 97
        if index >= 0 and index <= 26:
            counts[ord(c) - 97] = 1

    sum = 0
    for n in counts:
        sum += n

    return sum == 26
