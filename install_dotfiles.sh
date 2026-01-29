#!/bin/bash

link_file() {
    local source="$1"
    local target="$2"
    ln -sfv "$source" "$target"
}

replace_file() {
    local source="$1"
    local target="$2"
    rm -rfv "$target"
    link_file "$source" "$target"
}

install_powershell_profile() {
    mkdir -p ~/.config/powershell/
    ln -sfv "$(pwd)/powershell/Microsoft.PowerShell_profile.ps1" ~/.config/powershell/

    echo "PowerShell Profile angelegt"
}

install_dotfiles() {
    local replace_all=false

    for file in *; do

        # Skip some files
        if [[ "$file" == "powershell" || "$file" == "README.md" || "$file" == "LICENSE" || "$file" == "install_dotfiles.sh" ]]; then
            continue
        fi

        local source="$(pwd)/$file"
        local target="$HOME/.${file}"

        if [[ -e "$target" ]]; then
            if cmp -s "$source" "$target"; then
                echo "identisch: $target"
            else
                echo "Konflikt: $target existiert bereits und ist nicht identisch."
                diff -u "$target" "$source"
                read -p "Überschreiben? [y/n/a (alle)/q (beenden)] " answer
                case "$answer" in
                    a|A)
                        replace_all=true
                        replace_file "$source" "$target"
                        ;;
                    y|Y)
                        replace_file "$source" "$target"
                        ;;
                    q|Q)
                        exit 0
                        ;;
                    *)
                        echo "Überspringen: $target"
                        ;;
                esac
            fi
        else
            link_file "$source" "$target"
        fi
    done

    install_powershell_profile
}


install_dotfiles
