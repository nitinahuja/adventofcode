NR < 26 {
    inp[NR] = $0;
    
}

# Starts with NR 26
NR > 25 {
    for(i in inp) {
        for(j in inp) {
            print $0, i, inp[i], j, inp[j];
            if (($0 == inp[i] + inp[j]) && (i != j))
            { 
                delete inp[NR-25];
                inp[NR] = $0;
                next;
            }
        }
    }
    {
        print $0;
        exit(0);
    }
}
