#Advent of code Day 6 Part 1
BEGIN {FPAT="[0-9]+"}

/Time/{
    print "Time", $1, $2, $3;
    for(i=1; i<= NF; i++){
        time[i] = $i;
    }

}
/Distance/{
    print "Distance", $1, $2, $3;
    for(i=1; i<= NF; i++){
        distance[i] = $i;
    }

}
function discriminant(a, b, c){
    print "Disc", a, b, c;
    return sqrt((b*b) - (4*a*c));
}
END {
    #Solve the quadratic equation for each pair
    # D = Distance traveled - provided 
    # h = button hold time (the unknown)
    # T = The time values = provided
    # That gives D = hT - h^2
    tot = 1;
    for(i = 1; i <= NF; i++){
        disc = discriminant(time[i], 1, distance[i]);
        root1 = (-time[i] + disc)/2;
        root2 = (-time[i] - disc)/2;

        win[i] = (int(root2) - int(root1)) +1;
        print disc, root1, root2, win[i];
        tot *= win[i];
    }
    print i;
}