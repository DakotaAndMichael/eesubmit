#!/usr/bin/env bash

arg=$1
uninstall="-u"

if [[ ${arg} == *"$uninstall"* ]];
then
    echo "eesubmit: Uninstalling eesubmit..."

    echo "eesubmit: Removing the shortcut..."
    sudo rm /usr/bin/eesubmit
    echo "eesubmit: The eesubmit shortcut has been removed"

    echo "eesubmit: Removing the source code and username file for eesubmit..."
    rm -rf ~/.eesubmit/
    echo "eesubmit: The source code and username file for eesubmit has been removed"

    echo "eesubmit: eesubmit requires other dependencies that may have been installed when eesubmit was installed"
    echo "eesubmit: Some of these dependencies may have already been installed"
    echo "eesubmit: Please review these dependencies and tell us if you want to remove them"

    echo "eesubmit: Do you want to uninstall pdfkit (a Python package that runs on top of wkhtmltopdf)? (y/n)"
    read uninstallPdfkit
    if [ ${uninstallPdfkit} = "y" ];
    then
        pip uninstall pdfkit
    fi

    echo "eesubmit: Do you want to uninstall wkhtmltopdf (a library for converting HTML to PDFs)? (y/n)"
    read uninstallWkhtmltopdf
    if [ ${uninstallWkhtmltopdf} = "y" ];
    then
        brew uninstall pdfkit --force
    fi

    echo "eesubmit: Do you want to uninstall homebrew (a package manager for Mac OS)? (y/n)"
    read uninstallHomebrew
    if [ ${uninstallHomebrew} = "y" ];
    then
        ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/uninstall)"
    fi

    echo "eesubmit: Uninstallation complete!"
else
    echo "eesubmit: Installing homebrew (a package manager for Mac OS)..."
    ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
    echo "eesubmit: Homebrew installation complete"

    echo "eesubmit: Installing wkhtmltopdf (a library for converting HTML to PDFs)..."
    brew install wkhtmltopdf
    echo "eesubmit: wkhtmltopdf installation complete"

    echo "eesubmit: Installing pdfkit (a Python package that runs on top of wkhtmltopdf)..."
    sudo pip install pdfkit
    echo "eesubmit: pdfkit installation complete"
    
    echo "eesubmit: Saving your EE server username locally..."
    ./~/.eesubmit/eesubmit/main/install.bash
    echo "eesubmit: EE server usernam saved"

    echo "eesubmit: Adding a shortcut for eesubmit (this may require your password)..."
    if [ -f ~/.eesubmit/eesubmit/main/submitting.bash ];
    then
        sudo cp ~/.eesubmit/eesubmit/main/submitting.bash /usr/bin/eesubmit
        echo "eesubmit: The shortcut has been created"
        echo "eesubmit: Installation complete!"
    else
        echo "eesubmit: Error: The main eesubmit script is not installed" 1>&2
        echo "eesubmit: Are you sure you cloned the repository correctly?"
        echo "eesubmit: Try running these commands"
        echo "    mkdir -p ~/.eesubmit"
        echo "    cd ~/.eesubmit"
        echo "    git clone https://github.com/DakotaAndMichael/eesubmit.git"
        echo "eesubmit: Then, run this script again"
    fi
fi
