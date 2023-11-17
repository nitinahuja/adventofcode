BEGIN { FPAT="[0-9]+";
error =0;
}
/:.*or/{ #classes

    for(i=$1; i<=$2; i++) {valid[i]=1;}
    for(i=$3; i<=$4; i++) {valid[i]=1;}
    print $1, $2, $3, $4, length(valid);
    next;
}
/your ticket:/ {
    FS=",";
    getline;
    print $0;
    next;
}
/nearby tickets:/{ 
    FS=",";
    next;
}
{ #every thing else
print NF;
    for(i=1; i<=NF; i++) {
        if($i in valid){} else { error+=$i;}
    }
}
END {
    print error;
}
