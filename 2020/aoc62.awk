BEGIN { RS=""; FS="\n*" ; answers = 0}
{
    for(i=1; i<= NF; i++) {
        split($i, rec, ""); 
        for(idx in rec){
            ans[rec[idx]] += 1;
        } 
    }
    for(idx in ans) {
        if(ans[idx] == NF) {answers++}
    }
    delete ans; delete rec;
}
END {
    print answers;
}