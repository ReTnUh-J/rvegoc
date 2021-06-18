#!/bin/bash
# Bash Script for install rvegoc tools
# Must run to install tool

clear
echo "
██████  ██    ██ ███████  ██████   ██████   ██████     
██   ██ ██    ██ ██      ██       ██    ██ ██          
██████  ██    ██ █████   ██   ███ ██    ██ ██          
██   ██  ██  ██  ██      ██    ██ ██    ██ ██          
██   ██   ████   ███████  ██████   ██████   ██████     
                                                                                                            
";

sudo chmod +x uninstall

if [ "$PREFIX" = "/data/data/com.termux/files/usr" ]; then
    INSTALL_DIR="$PREFIX/usr/share/doc/rvegoc"
    BIN_DIR="$PREFIX/bin/"
    BASH_PATH="$PREFIX/bin/bash"
    TERMUX=true

    pkg install -y git python
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

    sudo apt-get install -y git python
fi

echo "[✔] Checking directories...";
if [ -d "$INSTALL_DIR" ]; then
    echo "[◉] A directory rvegoc was found! Do you want to replace it? [Y/n]:" ;
    read -r mama
    if [ "$mama" = "y" ]; then
        if [ "$TERMUX" = true ]; then
            rm -rf "$INSTALL_DIR"
            rm "$BIN_DIR/rvegoc*"
        else
            sudo rm -rf "$INSTALL_DIR"
            sudo rm "$BIN_DIR/rvegoc*"
        fi
    else
        echo "[✘] If you want to install you must remove previous installations [✘] ";
        echo "[✘] Installation failed! [✘] ";
        exit
    fi
fi
echo "[✔] Cleaning up old directories...";
if [ -d "$ETC_DIR/Manisso" ]; then
    echo "$DIR_FOUND_TEXT"
    if [ "$TERMUX" = true ]; then
        rm -rf "$ETC_DIR/Manisso"
    else
        sudo rm -rf "$ETC_DIR/ReTnUh-J"
    fi
fi

echo "[✔] Installing ...";
echo "";
git clone --depth=1 https://github.com/ReTnUh-J/rvegoc "$INSTALL_DIR";
echo "#!$BASH_PATH
python $INSTALL_DIR/rvegoc.py" "${1+"$@"}" > "$INSTALL_DIR/rvegoc";
chmod +x "$INSTALL_DIR/rvegoc";
if [ "$TERMUX" = true ]; then
    cp "$INSTALL_DIR/rvegoc" "$BIN_DIR"
    cp "$INSTALL_DIR/rvegoc.cfg" "$BIN_DIR"
else
    sudo cp "$INSTALL_DIR/rvegoc" "$BIN_DIR"
    sudo cp "$INSTALL_DIR/rvegoc.cfg" "$BIN_DIR"
fi
rm "$INSTALL_DIR/rvegoc";


if [ -d "$INSTALL_DIR" ] ;
then
    echo "";
    echo "[✔] Tool installed successfully! [✔]";
    echo "";
    echo "[✔]====================================================================[✔]";
    echo "[✔]      All is done!! You can execute tool by typing rvegoc !       [✔]";
    echo "[✔]====================================================================[✔]";
    echo "";
else
    echo "[✘] Installation failed! [✘] ";
    exit
fi