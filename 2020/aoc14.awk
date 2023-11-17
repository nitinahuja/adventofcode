
func bin2dec(i, t,a,c){a=1;for(c=length(i);c>0;c--){t+=substr(i,c,1)=="1"?a:0; a;a*=2}return t}
BEGIN {OFS=",";}
/mask/{
    
    gsub(/mask = /, "")
    a = o = $0
    gsub(/X/, 1, a);
    gsub(/X/, 0, o);
    or_mask = bin2dec(o);
    and_mask = bin2dec(a);
    FPAT="[0-9]+";
    next;
}
/mem/{ 

    val = and(and_mask, $2);
    final = or(or_mask, val);
    mem[$1] = final ;

    next;
}
END {
    for(i in mem) {
        tot += mem[i];
    }
    print tot;

}
