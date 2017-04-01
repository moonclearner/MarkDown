# Instal vim on ubuntu 14.04 lts

## install ctags essential lib cmake python2/3-dev fontconfig git
    sudo apt-get install -y ctags build-essential cmake python-dev python3-dev fontconfig git
    sudo apt-get install -y libncurses5-dev libgnome2-dev libgnomeui-dev libgtk2.0-dev libatk1.0-dev libbonoboui2-dev libcairo2-dev libx11-dev libxpm-dev libxt-dev python-dev python3-dev ruby-dev lua5.1 lua5.1-dev

## delete old vim
    sudo apt-get remove -y vim vim-runtime gvim
    sudo apt-get remove -y vim-tiny vim-common vim-gui-common vim-nox
    sudo rm -rf /usr/share/vim/vim74
    sudo rm -rf /usr/share/vim/vim80

## install newly vim and add py2 support
- sudo add-apt-repository ppa:jonathonf/vim
- sudo apt update
- sudo apt install vim vim-nox-py2

## switch py2 or py3
    sudo update-alternatives --config vim
