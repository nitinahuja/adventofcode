function move(dir, step) {
    switch(dir) {
        case "N": y+=step; break;
        case "S": y-=step; break;
        case "E": x+=step; break;
        case "W": x-=step; break;
    }
}

function turn(dir, deg) {
    (dir == "L")?heading+=deg:heading+=(360-deg);
    heading %= 360;
    
}

BEGIN { FPAT = "([A-Z])|([0-9]+)"; OFS = ","; x=0; y=0; heading = 0; #East is 0
faces[0] = "E";
faces[90] = "N";
faces[180] = "W";
faces[270] = "S";
}
{
    print $1, $2;
    if(match($1, /[NEWS]/)) {
        move($1,$2);
    }
    if(match($1, /[LR]/) ) {
        turn($1,$2);
        }
    if(match($1, /F/)) {
        move(faces[heading], $2);
    }
    
    print x,y;
    print "hdg", heading, faces[heading];
    print "------";

}
END {
    print sqrt(x^2) + sqrt(y^2);
}