BEGIN {FS=""; steps[1] = 2; steps[2] = 4; steps[3] = 6; steps[4] = 8; steps[5] = 2;}
NR > 1 {

        if(match($pos, "#")) {++tree}
        print $pos, pos, tree, (NR), "----", $0
        # Step right 3
        pos = pos + 3
        if(pos > length($0)) { 
            pos = pos % length($0) 
            if(pos == 0) {
                pos = 1
            } 
        }
}
NR >1 && NR%2{
    print $2, NR
}
END {
    print tree;
}

function nextSteps(step)