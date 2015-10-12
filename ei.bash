#!/usr/bin/env bash
mkdir ~/.eesubmit-repo
cd ~/.eesubmit-repo
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
        chmod 777 macInstall.bash
        ./macInstall.bash $1 ;;
    2 )
        ./linuxInstall.bash $1 ;;
    3 )
	./windowsInstall.bash $1 ;;
    4 )
        echo "Other operating systems are not yet supported." ;;
esac
rm -rf ~/.eesubmit-repo/
