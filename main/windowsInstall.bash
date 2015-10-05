#!/bin/bash

pip install pdfkit
cp submitting.bash /usr/bin/eesubmit
./install

echo "Download and install the latest version of wkhtmltopdf"
start "http://wkhtmltopdf.org/downloads.html"

echo -n "Press RETURN to continue."
