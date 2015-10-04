#!/usr/bin/env bash

arg=$1
uninstall="-u"

if [[ ${arg} == *"$uninstall"* ]];
then
    pip uninstall pdfkit
    brew uninstall pdfkit --force
    ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/uninstall)"
    sudo rm /usr/bin/eesubmit
else
    ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
    brew install wkhtmltopdf
    pip install pdfkit
    sudo cp submitting.bash /usr/bin/eesubmit
fi
