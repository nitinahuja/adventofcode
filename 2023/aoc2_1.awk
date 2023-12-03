BEGIN { FS=":|;|\n"; id_sum = 0;
#Max available cubes
max["red"] = 12;
max["green"] = 14;
max["blue"] = 15;
}
{
    print $0
    #Loop through the games and check if any cube count is over max
    for(i=2; i<= NF; i++)
    {
        flag = 1
        patsplit($i, cubes, "[[:digit:]]+ (red|green|blue)")
        for(x in cubes) {

            #print cubes[x];
            split(cubes[x], cube, " ")
            # print "count:", cube[1], "color:", cube[2]
            if (cube[1] > max[cube[2]]) {
                #set a flag and break - no need to continue
                print "Skipping", NR, "count:", cube[1], "color:", cube[2]
                flag = 0;
                break;
            }
        }
        if (flag == 0) {
            print "Skipping", NR
            next; # Move to the next record if any game is not going to succeed.
        }
    }
    print "Adding", NR
    id_sum = id_sum + NR;
    print "Total =", id_sum
}
END {
    print id_sum;
}