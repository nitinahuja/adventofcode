BEGIN { prev = 0; ones=0; threes=0;}
{  
    
    ($0-prev==1)?++ones:++threes;
    print $0, prev, ones, threes;
    prev = $0;

}
END {
    print ones* (threes+1);
}