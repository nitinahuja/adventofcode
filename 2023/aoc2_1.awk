# Advent of code 20023 - Day2 Part 1 and Part 2

BEGIN { FPAT="[[:digit:]]+ (red|green|blue)"; id_sum = 0; power = powersum = 0;
#Max available cubes
max["red"] = 12;
max["green"] = 13;
max["blue"] = 14;
}

function max_num(a,b) {return (a > b)?a:b; }

{
    #print $0
    #Loop through the games and check if any cube count is over max
    r=g=b = 0;
    for(i=1; i<= NF; i++)
    {
        split($i, cube, " ")
        r = (cube[2] == "red")? max_num(r, cube[1]):r
        g = (cube[2] == "green")? max_num(g, cube[1]):g
        b = (cube[2] == "blue")? max_num(b, cube[1]):b
    }

    power = r*g*b;
    powersum += power;
    #Check for part 1
    if (r <= max["red"] && g <= max["green"] && b <= max["blue"]) {
        id_sum = id_sum + NR;
    }
    
}
END {
    print "Part 1", id_sum, "Part 2", powersum;
}