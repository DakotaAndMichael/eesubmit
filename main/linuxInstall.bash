#!/usr/bin/env bash
arg=$1
uninstall="-u"

if [[ $arg == *"$uninstall"* ]];
then
	sudo pip uninstall pdfkit
	sudo apt-get remove wkhtmltopdf
	sudo rm /usr/bin/eesubmit
else
	sudo pip install pdfkit
	sudo apt-get install wkhtmltopdf
	sudo cp submitting.bash /usr/bin/eesubmit
	./install.bash
fi
