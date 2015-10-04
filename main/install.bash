echo -n "Enter Username: "
read usrName

mkdir ~/.eesubmit
touch ~/.eesubmit/username.txt
echo "${usrName}" > ~/.eesubmit/username.txt



