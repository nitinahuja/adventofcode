# Advent of code 20023 - Day3 Part 1
#BEGIN{FPAT="[[:digit:]]+|."; prev = ""; engine = 0}
BEGIN{FS=""; engine = 0; ratio = 0;}

function get_number(line, pos, dir)
{
    #loop until end of input
    if(typeof(line[pos]) == "strnum" && dir == "left") {return get_number(line, pos-1, "left") line[pos];}
    if(typeof(line[pos]) == "strnum" && dir == "right") {return line[pos] get_number(line, pos+1, "right");}

    return "";
}
{
    #Read up the entire matrix and process in the END block
    for (i=1; i<=NF; i++) {
        lines[NR][i] = $i;
    }
}
END {
    #Process each record
    for (i=1; i<=NR; i++) {
        for(j=1; j<=NF; j++) {
            if (match(lines[i][j],"[^[:digit:].]+")) { #If NOT digit or DOT
                #Store all adjacent numbers in array
                delete adjacent;
                count = 0;
                #Current line processing
                print lines[i][j];
                if(typeof(lines[i][j-1]) == "strnum")  { adjacent[count++] = get_number(lines[i], j-1,"left");}
                if(typeof(lines[i][j+1]) == "strnum")  { adjacent[count++] = get_number(lines[i], j+1,"right");}
                
                skip = 0;
                #Previous line
                if(i>1) {
                    #if number is exactly above the punct - process center, right and left
                    if(typeof(lines[i-1][j]) == "strnum") {
                        adjacent[count++] = get_number(lines[i-1], j-1,"left") lines[i-1][j] get_number(lines[i-1], j+1,"right");
                        skip = 1;
                    }

                    if(!skip && typeof(lines[i-1][j-1]) == "strnum")  { adjacent[count++] = get_number(lines[i-1], j-1,"left");}
                    if(!skip && typeof(lines[i-1][j+1]) == "strnum")  { adjacent[count++] =  get_number(lines[i-1], j+1,"right");}
                }
                skip = 0;
                #Next Line
                if(i!=NR) {
                    if(typeof(lines[i+1][j]) == "strnum") {
                        adjacent[count++] = get_number(lines[i+1], j-1,"left") lines[i+1][j] get_number(lines[i+1], j+1,"right");
                        skip = 1;
                    }

                    if(!skip && typeof(lines[i+1][j-1]) == "strnum")  { adjacent[count++] = get_number(lines[i+1], j-1,"left");}
                    if(!skip && typeof(lines[i+1][j+1]) == "strnum")  { adjacent[count++] = get_number(lines[i+1], j+1,"right");}
                    #if number is exactly above the punct - process center, right and left

                }
                for (part in adjacent) {
                    engine += adjacent[part];
                    print adjacent[part];
                }
                    #Puzzle part 2
                if (lines[i][j] == "*" && count == 2) {
                    print adjacent[0], adjacent[1];
                    ratio += adjacent[0] * adjacent[1];
                }

            }
        }
    }

    print engine, ratio;

}
