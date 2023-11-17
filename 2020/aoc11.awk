function to_flip(seat, i, j) {
    # Count the number of empty or occupied 
    around = seat[i-1][j+1] + seat[i][j+1] + seat[i+1][j+1] + seat[i+1][j] + seat[i+1][j-1] + seat[i][j-1] + seat[i-1][j-1];
   # print around, seat[i][j], seat[i-1][j+1], seat[i][j+1],  seat[i+1][j+1],  seat[i+1][j],  seat[i+1][j-1], seat[i][j-1] , seat[i-1][j-1]; 
    if(seat[i][j] && around >= 4) {return 1;} #Flip this
    if(!seat[i][j] && around == 0 ) { return 1;} # Empty seats around - flip it

    return 0;
}

function swap(grid1, grid2) {
    changed =0;
    for(i in grid1) {
        for(j in grid1) {
            if(to_flip(grid1, i, j)) {
                grid2[i][j] = !grid1[i][j];
                changed = 1;
                
            }
        }
    }
    return changed;
}

function sum(grid){
    tot = 0;
    for(i in grid) {
        for(j in grid) {
            print grid[i][j];
            
            if(grid[i][j]) {

                tot += grid[i][j];
            }
        }
    }
    return tot;
}

BEGIN {
    FS="";
}
{
    for(i = 1; i <= NF; i++) {
        grid1[NF][i] = grid2[NF][i] = ($i == "L")?0:$i #empty seat = 0, occupied seat = 1
    }
}
END {
    changed = 0;
    do {
        changed = swap(grid1, grid2);
        use = 0;
        print changed, use;
        if(changed) {
            changed = swap(grid2, grid1);
            use = 1;
            print changed, use;
        }
    } while(changed)
    print (use)?sum(grid2) : sum(grid1);



}