#!/bin/bash

function install_pwsh() {

###################################
    # Prerequisites

    # Get version of RHEL
    source /etc/os-release
    if [ ${VERSION_ID%.*} -lt 8 ]
    then majorver=7
    elif [ ${VERSION_ID%.*} -lt 9 ]
    then majorver=8
    else majorver=9
    fi

    # Download the Microsoft RedHat repository package
    curl -sSL -O https://packages.microsoft.com/config/rhel/$majorver/packages-microsoft-prod.rpm

    # Register the Microsoft RedHat repository
    sudo rpm -i packages-microsoft-prod.rpm

    # Delete the downloaded package after installing
    rm packages-microsoft-prod.rpm

    # Update package index files
    sudo dnf update

    # Install PowerShell
    sudo dnf install powershell -y
}

function add_desktop_item() {

    mkdir -p ~/.local/share/icons/
    cp $(pwd)/pwsh-icon.svg ~/.local/share/icons/

    DESKTOP_FILE="$HOME/.local/share/applications/pwsh.desktop"

    mkdir -p "$HOME/.local/share/applications"

    cat > "$DESKTOP_FILE" <<EOF
    [Desktop Entry]
    Name=PowerShell
    Comment=PowerShell
    Exec=pwsh
    Icon=pwsh-icon
    Terminal=true
    Type=Application
    Categories=System;TerminalEmulator;
EOF

    update-desktop-database "$HOME/.local/share/applications"
    echo "PowerShell desktop item added"
}

install_pwsh
add_desktop_item