daemon() {
    chsum1=""

    while [[ true ]]
    do
        chsum2=`find . -type f -exec md5sum {} \;`
        if [[ $chsum1 != $chsum2 ]] ; then
            make
            chsum1=$chsum2
        fi
        sleep 2
    done
}

daemon
