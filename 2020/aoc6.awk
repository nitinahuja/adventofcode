BEGIN { RS=""; FS="" ; answers = 0}
{
    
    gsub(/\n*/, "");
    
    for(i=1; i<= NF; i++) {rec[$i] = 1; } 
    answers+=length(rec); delete rec;
}
END {
    print answers;
}