func replace(pat, curr) {
    if(pat[curr]) {}
}
BEGIN {#FPAT="[0-9]+|[a-z]"; 
FS=":"
OFS=",";}
/^[0-9]+:/{
    rules[$1] = $2;

    if(match($0, /a/)) {
        a=$1;
    }
    else if(match($0,/b/)) {
        b=$1;
    }

    print NR, $1, rules[$1];
}
/$^/{ # empty line process the rules here
    print a, b;
    pat = rules[0];
    rule = repl(0, pat);
    print rule, pat;
    FS="";
}
/^[a-z]/ {
    print match($0, rule);
    if( match($0, rule)) {print "match",$0;} else{ print "no match",$0;}
     
}

func repl(idx, pat){
    #start with rule 0
    iter = 0;
    while(patsplit(pat, matches, "[0-9]+")) {
        print "curr pat", pat;

        for(i=1; i<=length(matches); i++) {
            
            if(matches[i]==a) { gsub(a, " a ", pat); continue; }
            if(matches[i]==b) { gsub(b, " b ", pat); continue; }
            # gsub(matches[i], " "rules[matches[i]]" ", pat)
            sub(matches[i], " "rules[matches[i]]" ", pat)
             print " after rule ", matches[i], "pat ", rules[matches[i]], "new pat---", pat
        }

    } 
    gsub(/ /, "", pat);
    return pat;
}