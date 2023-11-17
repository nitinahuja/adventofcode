BEGIN {acc =0;}
{
    inp[NR] = split(/^[a-z]/)
}
END {
    for(i in inp) {
        print inp[i];
        if(match())
    }
}