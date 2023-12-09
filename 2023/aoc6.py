
import math
import sys
import re
import functools
from pathlib import Path

"""Advent of code day 6 - Part 1 and Part 2
"""
    #Solve the quadratic equation for each pair
    # D = Distance traveled - provided 
    # h = button hold time (the unknown)
    # T = The time values = provided
    # That gives D = hT - h^2

def roots(D:int, T:int):
    disc = math.sqrt(T*T - 4*D)
    r1 = (-T + disc)/2
    r2 = (-T - disc)/2

    return math.ceil(r1) - math.floor(r2) - 1


if __name__ == '__main__':
    p = Path(__file__).with_name("day6.txt")
    with p.open("r") as file:
        times = re.findall("(\d+)",file.readline().strip())
        distance = re.findall("(\d+)",file.readline().strip())
    distance = list(map(int, distance))
    times = list(map(int,times))
    
    p = map(roots, distance, times )
    #p = [roots(d,t) for d, t in zip(distance, times)]
    part1 = math.prod(p)
    part2 = roots(int("".join(map(str, distance))), int("".join(map(str, times))))
    print(f"Part 1 -> {part1}, part 2 -> {part2}")
