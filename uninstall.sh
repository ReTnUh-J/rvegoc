#!/bin/bash
# Script for uninstall RVEGOC tool

# ----- JHUNTERS :) -----

#

# Coded by: Mahmoud Akram

#  * https://github.com/ReTnUh-J/

############

clear

echo "

";

if [ "$PREFIX" = "/data/data/com.termux/files/usr" ]; then

    INSTALL_DIR="$PREFIX/usr/share/doc/rvegoc"

    BIN_DIR="$PREFIX/bin/"

    BASH_PATH="$PREFIX/bin/bash"

    TERMUX=true

elif [ "$(uname)" = "Darwin" ]; then

    INSTALL_DIR="/usr/local/rvegoc"

    BIN_DIR="/usr/local/bin/"

    BASH_PATH="/bin/bash"

    TERMUX=false

else

    INSTALL_DIR="$HOME/.rvegoc"

    BIN_DIR="/usr/local/bin/"

    BASH_PATH="/bin/bash"

    TERMUX=false

fi

echo "[✔] Checking directories...";

if [ -d "$INSTALL_DIR" ]; then

        rm -rf "$INSTALL_DIR"

        rm "$BIN_DIR/rvegoc*"

        sudo rm -rf "$INSTALL_DIR"

        sudo rm "$BIN_DIR/rvegoc*"

    else

        echo "[✘] If you want to uninstall you must remove previous installations [✘] ";

        echo "[✘] Failed! [✘] ";

fi

echo "[✔] Cleaning up old directories...";

if [ -d "$ETC_DIR/ReTnUh-J" ]; then

    echo "$DIR_FOUND_TEXT"

    if [ "$TERMUX" = true ]; then

        rm -rf "$ETC_DIR/ReTnUh-J"

    else

        sudo rm -rf "$ETC_DIR/ReTnUh-J"

    fi

fi

clear

clear

echo "[✔] all good!"