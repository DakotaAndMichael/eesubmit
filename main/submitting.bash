#!/usr/bin/env bash

if ! [ -e /usr/bin/eesubmit ];
then
	./linuxInstall.bash
fi

echo "Dakota Sproch and Michael Snowden are the coolest people in the world!"

echo -n "Enter HW number: "
read hwNum

finalName="hw"$hwNum".pdf"

echo $finalName

ipython nbconvert --to html "prob${hwNum}.ipynb"
mv "prob${hwNum}.html" prob.html

#python3 convert.py
python -c "exec(\"import pdfkit\\npdfkit.from_file('prob.html', 'out.pdf')\")"
pdfunite out.pdf "hwHand${hwNum}.pdf" $finalName

rm prob.html
rm out.pdf

if [ -e $finalName ] && [ -e  "prob${hwNum}.ipynb" ];
then

	usrName=$(<~/.eesubmit/username.txt)
	echo $usrName

	scp $finalName "prob${hwNum}.ipynb" "ee16a-${usrName}@cory.eecs.berkeley.edu:~/"

	ssh "ee16a-${usrName}@cory.eecs.berkeley.edu" "mkdir hw${hwNum}; mv ${finalName} prob${hwNum}.ipynb hw${hwNum}; cd hw${hwNum}; mv prob${hwNum}.ipynb hw${hwNum}.ipynb; submit hw${hwNum}; glookup -t"
else
	echo "Error: One or more files not found."
fi
