BEGIN {FS=""; pos = 4; tree = 0}
NR > 1 {

        if(match($pos, "#")) {++tree}
        # Step right 3
        pos = pos + 3
        if(pos > length($0)) { 
            pos = pos % length($0) 
            if(pos == 0) {
                pos = 1
            } 
        }
}
END {
    print tree;
}
