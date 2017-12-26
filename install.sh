#!/usr/bin/env bash

SCRIPT_DIR=$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )

#Set linux config path variable, used in scripts
LINUX_CONFIG_PATH=$SCRIPT_DIR
echo '#!/bin/bash' > ~/.bash_generated
echo "export LINUX_CONFIG_PATH=$LINUX_CONFIG_PATH" >> ~/.bash_generated
EPOCH_TIME=$(date +%s)

function install_apt_dependencies() {
    echo "Need sudo access in order to install packages with apt"
    sudo apt install -y vim chromium-browser i3-wm i3status dmenu xbacklight xfce4-terminal ctags help2man curl xscreensaver xscreensaver-gl-extra xscreensaver-data-extra acpi
}

function configure_vim() {
    VIM_CONF_DIR="~/.vim"
    mv ${VIM_CONF_DIR} "${VIM_CONF_DIR}_old_${EPOCH_TIME}" ; mkdir -p "$VIM_CONF_DIR/bundle"
    git clone https://github.com/tpope/vim-pathogen "$VIM_CONF_DIR/vim-pathogen" && ln -s $VIM_CONF_DIR/vim-pathogen/autoload $VIM_CONF_DIR
    SOLARIZED_DIR="$VIM_CONF_DIR/bundle/vim-colors-solarized"
    mkdir -p $SOLARIZED_DIR && git clone https://github.com/altercation/vim-colors-solarized $SOLARIZED_DIR
}

function download_and_install_light() {
    LIGHT_DIR="$SCRIPT_DIR/target/light"
    rm -rf $LIGHT_DIR
    mkdir -p $LIGHT_DIR ; git clone https://github.com/haikarainen/light.git $LIGHT_DIR
    cd $LIGHT_DIR && make && sudo make install && cd -
}

function configure_terminal() {
    TERMINAL_CONF_DIR="~/.config/Terminal"
    rm -rf ${TERMINAL_CONF_DIR}_old_${EPOCH_TIME}
    mv $TERMINAL_CONF_DIR "${TERMINAL_CONF_DIR}_old_${EPOCH_TIME}"
    mkdir -p $TERMINAL_CONF_DIR
    ln -s $SCRIPT_DIR/solarized-terminal "$TERMINAL_CONF_DIR/"
    ln -s solarized-terminal/dark/terminalrc "$TERMINAL_CONF_DIR/"
}

function configure_git() {
    git config --global core.excludesfile ~/.gitignore_global
    git config --global user.email "martin@agfjord.se"
    git config --global user.name "Martin Agfjord"
}

function install_config_files() {
    mv ~/.profile ~/.profile_old_${EPOCH_TIME} ; ln -s $SCRIPT_DIR/profile ~/.profile
    mv ~/.bashrc ~/.bashrc_old_${EPOCH_TIME} ; ln -s $SCRIPT_DIR/bashrc ~/.bashrc
    mv ~/.bash_aliases ~/.bash_aliases_old_${EPOCH_TIME} ; ln -s $SCRIPT_DIR/bash_aliases ~/.bash_aliases
    mv ~/.bash_variables ~/.bash_variables_old_${EPOCH_TIME} ; ln -s $SCRIPT_DIR/bash_variables ~/.bash_variables
    mv ~/.vimrc ~/.vimrc_old_${EPOCH_TIME} ; ln -s $SCRIPT_DIR/vimrc ~/.vimrc
    mv ~/.gitignore_global ~/.gitignore_global_old_${EPOCH_TIME} ; ln -s $SCRIPT_DIR/gitignore_global ~/.gitignore_global
    mv ~/.Xresources ~/.Xresources_old_${EPOCH_TIME} ; ln -s $SCRIPT_DIR/Xresources ~/.Xresources
    mv ~/.config/i3 ~/.config/i3_old_${EPOCH_TIME} ; ln -s $SCRIPT_DIR/i3 ~/.config/
    mv ~/.config/i3status/config ~/.config/i3status/config_old_${EPOCH_TIME} ; mkdir -p ~/.config/i3status && ln -s $SCRIPT_DIR/i3status.conf ~/.config/i3status/config
}

function reload_settings() {
    # Reload Xresources
    xrdb -merge ~/.Xresources
    # Reload bash config
    source ~/.bashrc
}

install_apt_dependencies
configure_vim
download_and_install_light
configure_terminal
configure_git
install_config_files
reload_settings
echo "##########"
echo "Done!"
echo "##########"
