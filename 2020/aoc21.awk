BEGIN {RS = "" ; FS = "\n";#RS = "Player [0-9]:";
}
/[0-9]+/{
    print NR, NF, $1;

}