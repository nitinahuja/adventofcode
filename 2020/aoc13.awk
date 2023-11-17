BEGIN {FS=",";}
NR==1{
    time = $0
    print time;
}
NR > 1{
    for(i=1;i<=NF;i++) {
        
        if($i != "x") {
            t = time;
            do {
                    if((t%$i) == 0) {
                        arr[$i] = t;
                        break;
                    }
                    ++t;
                } while (1)
            }
        }
    }

END {
    for(num in arr) { 
        print arr[num]-time, num, (arr[num]-time)*num
    }
}