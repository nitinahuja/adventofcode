BEGIN {
    acc =0
}
{
    line[NR][1] = $1; #operator
    line[NR][2] = $2; #value
    line[NR][3] = 0; # visited

    print $1, $2;
}
END {
    num = 1;
    do {
        print acc, num, line[num][1], line[num][2], line[num][3]
        if(line[num][3] == 1) {break;}
        
        switch(line[num][1]) {
            case "nop" : nextline = num +1; 
                         line[num][3] = 1; 
                         break;
            case "acc" : acc+=line[num][2]; 
                        line[num][3] = 1; 
                        nextline = num +1; 
                        break;
            case "jmp" : nextline = num + line[num][2]; 
                        line[num][3] = 1; 
                        break;
        }
        num = nextline;
        print acc, num, line[num][1], line[num][2], line[num][3], "----";

    } while(1)

    print acc;
}