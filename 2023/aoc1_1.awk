# Advent of code 2023 Day 1 - both puzzles.

BEGIN { FPAT="[[:digit:]]|one|two|three|four|five|six|seven|eight|nine"; sum = 0
#  Add lookup table 
table["one"] =1;
table["two"] =2;
table["three"] =3;
table["four"] =4;
table["five"] =5;
table["six"] =6;
table["seven"] =7;
table["eight"] =8;
table["nine"] =9;

}
{
    one = int($1)? $1: table[$1]
    two = int($NF)? $NF: table[$NF]
    print $0, $1, $NF, one two

    sum = sum + int(one two)
}
END {
    print sum;
}