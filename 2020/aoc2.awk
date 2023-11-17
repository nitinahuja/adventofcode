BEGIN { FS = "[ :-]+"; valid = 0; } 
{
    pat = sprintf("[^"$3"]");
    pw = $4
    where = gsub(pat, "", pw);
    (length(pw) >= $1 && length(pw) <= $2)?++valid:++invalid
}
END {
    print valid;
}