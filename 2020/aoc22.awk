BEGIN { FS = "[ :-]+"; valid = 0; } 
{
    pat1 = sprintf("^"$3".*[^"$3"]$");
    pat2 = sprintf("^[^"$3"].*"$3"$");
    pw = substr($4,int($1),int($2) - int($1)+1)
    m1 = match(pw, pat1)
    m2 = match(pw, pat2)
    xor(m1,m2)?++valid:++invalid
    print pat1, pat2, pw, $1,$2, $4,m1, m2 , xor(m1,m2), valid
    
}
END {
    print valid;
}