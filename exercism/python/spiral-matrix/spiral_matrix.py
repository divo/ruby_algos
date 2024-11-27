from pdb import set_trace as bp


def spiral_matrix(size):
    result = [[0 for x in range(size)] for y in range(size)]

    i = 0
    j = 0
    direction = 'right'
    for count in range(1, size * size + 1):
        result[i][j] = count
        if count == size * size:
            return result

        i, j, direction, size, result = step(i, j, direction, size, result)

    return result


def step(i, j, direction, size, matrix):
    if direction == 'down':
        if i == size - 1 or matrix[i + 1][j] != 0:
            return step(i, j, 'left', size, matrix)
        else:
            return (i + 1, j, direction, size, matrix)

    elif direction == 'right':
        if j == size - 1 or matrix[i][j + 1] != 0:
            return step(i, j, 'down', size, matrix)
        else:
            return (i, j + 1, direction, size, matrix)

    elif direction == 'up':
        if i == 0 or matrix[i - 1][j]:
            return step(i, j, 'right', size, matrix)
        else:
            return (i - 1, j, direction, size, matrix)

    elif direction == 'left':
        if j == 0 or matrix[i][j - 1] != 0:
            return step(i, j, 'up', size, matrix)
        else:
            return (i, j - 1, direction, size, matrix)


print(spiral_matrix(3))
