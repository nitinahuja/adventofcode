BEGIN { RS=""; valid = 0}
{
    
    if(NF == 8) {++valid; next;}
    if(NF == 7  && !match($0, "cid")) { ++valid;} 
}
END {
    print valid;
}
