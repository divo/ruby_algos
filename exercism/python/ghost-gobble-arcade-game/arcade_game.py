"""Functions for implementing the rules of the classic arcade game Pac-Man."""


def eat_ghost(power_pellet_active, touching_ghost):
    return power_pellet_active and touching_ghost


def score(touching_power_pellet, touching_dot):
    return touching_power_pellet or touching_dot


def lose(power_pellet_active, touching_ghost):
    return touching_ghost and not power_pellet_active


def win(has_eaten_all_dots, power_pellet_active, touching_ghost):
    if touching_ghost and not power_pellet_active:
        return False
        
    return has_eaten_all_dots

