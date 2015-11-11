#!/bin/gawk -f
BEGIN{
    FS=";"
}
{
    if($0 ~ /^[[:space:]]*#/) {FNR--}
    for(i=1;i<=NF;i++) buf[ARGIND][i][FNR]=$i
}
END{
    for(k=1;k<=FNR;k++)
    {
        for(i=1;i<=NF;i++)
        {
            sum=0
            for(j=1;j<ARGC;j++) sum+=buf[j][i][k];
            sum/=(ARGC-1)
            printf "%s",sum
            if(i<NF) printf ";"
        }
        printf "\n"
    }
}

