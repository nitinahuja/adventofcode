"""Advent of code day 13
"""
from pathlib import Path


def get_reflection(mirror: str)->int:
    #Check rows for reflection
    m = mirror.split('\n')
    rows_count = len(m)
    prev = ''
    sum = 0
    for i, row in enumerate(m):
        if row == prev:
            #we have a reflection
            sum += i*100
        prev = row
    return sum

if __name__ == "__main__":
    p = Path(__file__).with_name("test.txt")
    with p.open("r") as file:
        mirrors = file.read().split('\n\n')
    for mirror in mirrors:
        get_reflection(mirror)