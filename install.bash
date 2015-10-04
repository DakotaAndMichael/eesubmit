#!/usr/bin/env bash
git clone https://github.com/DakotaAndMichael/eesubmit.git
cd eesubmit/main
echo "What is your OS?"
echo "(1) Mac"
echo "(2) Linux"
echo "(3) Windows"
echo "(4) Other"

read os

case $os in
    1 )
        ./macInstall.bash ;;
    2 )
        ./linuxInstall.bash ;;
    3 )
        echo "Windows is not yet supported." ;;
    4 )
        echo "Other operating systems are not yet supported." ;;
esac
