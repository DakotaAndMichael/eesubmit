#!/usr/bin/env bash

arg=$1
uninstall="-u"

if [[ ${arg} == *"$uninstall"* ]];
then
    echo "Uninstalling eesubmit..."

    echo "Removing the shortcut..."
    sudo rm /usr/bin/eesubmit
    echo "The eesubmit shortcut has been removed"

    echo "Removing the source code and username file for eesubmit..."
    rm -rf ~/.eesubmit/
    echo "The source code and username file for eesubmit has been removed"

    echo "eesubmit requires other dependencies that may have been installed when eesubmit was installed"
    echo "Some of these dependencies may have already been installed"
    echo "Please review these dependencies and tell us if you want to remove them"

    echo "Do you want to uninstall pdfkit (a Python package that runs on top of wkhtmltopdf)? (y/n)"
    read uninstallPdfkit
    if [ ${uninstallPdfkit} = "y" ];
    then
        pip uninstall pdfkit
    fi

    echo "Do you want to uninstall wkhtmltopdf (a library for converting HTML to PDFs)? (y/n)"
    read uninstallWkhtmltopdf
    if [ ${uninstallWkhtmltopdf} = "y" ];
    then
        brew uninstall pdfkit --force
    fi

    echo "Do you want to uninstall homebrew (a package manager for Mac OS)? (y/n)"
    read uninstallHomebrew
    if [ ${uninstallHomebrew} = "y" ];
    then
        ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/uninstall)"
    fi

    echo "Uninstallation complete!"
else
    echo "Installing homebrew (a package manager for Mac OS)..."
    ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
    echo "Homebrew installation complete"

    echo "Installing wkhtmltopdf (a library for converting HTML to PDFs)..."
    brew install wkhtmltopdf
    echo "wkhtmltopdf installation complete"

    echo "Installing pdfkit (a Python package that runs on top of wkhtmltopdf)..."
    sudo pip install pdfkit
    echo "pdfkit installation complete"

    echo "Adding a shortcut for eesubmit (this may require your password)..."
    if [ -f ~/.eesubmit/eesubmit/main/submitting.bash ];
    then
        mkdir -p ~/.eesubmit
        cd ~/.eesubmit
        git clone https://github.com/DakotaAndMichael/eesubmit.git
        sudo cp ~/.eesubmit/eesubmit/main/submitting.bash /usr/bin/eesubmit
        echo "The shortcut has been created"
        echo "Installation complete!"
    else
        echo "Error: The main eesubmit script is not installed" 1>&2
        echo "Are you sure you cloned the repository correctly?"
        echo "Try running these commands"
        echo "    mkdir -p ~/.eesubmit"
        echo "    cd ~/.eesubmit"
        echo "    git clone https://github.com/DakotaAndMichael/eesubmit.git"
        echo "Then, run this script again"
    fi
fi
