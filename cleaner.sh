#!/usr/bin/env bash

cleaner () {
    echo "CLEANER"
    echo "-------"

    if [[ -z $1 ]]; then
        echo "1) Clean Page Cache"
        echo "2) Clean Dentries & Innodes"
        echo "3) Clean All above"
        echo -n "Your choice: [1-3/*]"
        read choice
    else
        choice="${1}"
    fi

    case $choice in
        1)
            page_clean
            ;;
        2)
            dentries_innodes_clean
            ;;
        3)
            echo -n "Are you sure? [Y/*]"
            read sure
            if [[ $sure -eq "Y" ]]; then
                all_clean
            fi
            ;;
        *)
            echo "Skip cleaning";
            ;;
    esac

    echo "Cleaning ended"
}

page_clean () {
    echo "- Cleaning Page Cache"
    sudo su -c "sync; echo 1 > /proc/sys/vm/drop_caches"
}

dentries_innodes_clean() {
    echo "- Cleaning Dentries and Innodes"
    sudo su -c "sync; sudo echo 2 > /proc/sys/vm/drop_caches"
}

all_clean () {
    echo "- Cleaning all"
    sudo su -c "sync; sudo echo 3 > /proc/sys/vm/drop_caches"
}
