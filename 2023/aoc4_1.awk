# Advent of code 20023 - Day4 Part 1
BEGIN{FS="\\||:"; tot_points = 0;}

{
    #Remove leading and trailing spaces
    gsub(/^[ \t]+|[ \t]+$/, "", $2);
    
    #Create an alternation regex from the winning numbers
    win_nums = gensub(/ +/, "|", "g", $2); 
    #Wrap each number in word boundary
    win_nums = gensub(/([0-9]+)/, "\\\\y\\1\\\\y", "g", win_nums)
    
    
    
    #Match for winning numbers
    point = counter = won = 0;
    delete my_win_nums;
    won = patsplit($3, my_win_nums, win_nums);
    #print "Win-->", win_nums, "$3-->", $3
    
    for(num in my_win_nums) {
        point = (0 == counter++)? 1 : point *= 2;

    }
    #Add current card as won - for part 2
    copies[NR]++;

    if(won > 0) {
        print "Game:", NR, won;
        tot_points += point;
        for(copy = NR + 1; copy <= NR + won; copy++) {
            copies[copy] += copies[NR]; 
        }
    }

}

END {
    for(copy in copies) {
        tot_cards += copies[copy];
    }
    print "part1", tot_points, "part2", tot_cards;
}