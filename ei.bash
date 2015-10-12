#!/usr/bin/env bash
if [ -f ~/.eesubmit ]; 
then
    rm -rf ~/.eesubmit
fi
mkdir ~/.eesubmit
git clone https://github.com/DakotaAndMichael/eesubmit.git ~/.eesubmit
echo "What is your OS?"
echo "(1) Mac"
echo "(2) Linux"
echo "(3) Windows"
echo "(4) Other"

read os

case $os in
    1 )
        ~/.eesubmit/main/./macInstall.bash $1 ;;
    2 )
        ~/.eesubmit/main/./linuxInstall.bash $1 ;;
    3 )
	~/.eesubmit/main/./windowsInstall.bash $1 ;;
    4 )
        echo "Other operating systems are not yet supported." ;;
esac
