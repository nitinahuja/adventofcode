from pathlib import Path
import re

table = {"one":1, "two":2, "three":3, "four":4, "five":5, "six":6, "seven":7, "eight":8, "nine":9}

def aoc1_2(line):
    regexp = r"(?=(\d|one|two|three|four|five|six|seven|eight|nine))"
    result = re.findall(regexp, line)
    print(f"{line}, {result[0]}, {result[-1]}") 
    one = result[0] if result[0] in '123456789' else table[result[0]]
    two = result[-1] if result[-1] in '123456789' else table[result[-1]]
    return str(one) + str(two)

if __name__ == '__main__':
    sum = 0
    p = Path(__file__).with_name("aoc1_2.txt")
    with p.open("r") as file:
        while line := file.readline():
            number = aoc1_2(line.rstrip())
            sum += int(number)
    print(sum)

