# [4, 8, 12, 16, 23, 28, 32]
# l = 3, r = 4, mid = 5
def find(search_list, value):
    if len(search_list) == 0:
        raise ValueError("value not in array")

    l = 0
    r = len(search_list) - 1
    while l < r:
        mid = l + (r - l) // 2
        if search_list[mid] < value:
            l = mid + 1
        else:
            r = mid

    if search_list[l] != value:
        raise ValueError("value not in array")
    else:
        return l
