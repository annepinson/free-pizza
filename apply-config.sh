#!/bin/bash

# This script is used to apply the neovim configuration of the repo to your machine

add_color=False
restore_backup=False

arg=1
while [ $arg -le $# ]; do
    increm=1
    case ${!arg} in
	    "-c") 
		add_color=True
		;;
	"-r")
		restore_backup=True
		;;
		*) echo "Invalid argument: ${!arg}"
		;;
    esac
    # Increment the argument counter
    ((arg+=$increm))
done

if [ restore_backup ]; then
    if [ -f ~/.config/nvim/init.vim.bak ]; then
	cp ~/.config/nvim/init.vim.bak ~/.config/nvim/init.vim
    fi

    if [ -f ~/.config/nvim/coc-settings.json.bak ]; then
	cp ~/.config/nvim/coc-settings.json.bak ~/.config/nvim/coc-settings.json
    fi

    if [ -f ~/.config/nvim/myinit.lua.bak ]; then
	cp ~/.config/nvim/myinit.lua.bak ~/.config/nvim/myinit.lua
    fi

    if [ -f ~/.vimrc.bak ]; then
	cp ~/.vimrc.bak ~/.vimrc
    fi

    if [ -f ~/.config/nvim/colorconfig.vim.bak ] && [ add_color ]; then
	cp ~/.config/nvim/colorconfig.vim.bak ~/.config/nvim/colorconfig.vim
    fi
    exit 0
fi

# First delete the current configuration backup files if exist

if [ -f ~/.config/nvim/init.vim.back ]; then
    rm ~/.config/nvim/init.vim.back
fi

if [ -f ~/.config/nvim/coc-settings.json.back ]; then
    rm ~/.config/nvim/coc-settings.json.back
fi

if [ -f ~/.config/nvim/myinit.lua.back ]; then
    rm ~/.config/nvim/myinit.lua.back
fi

if [ -f ~/.vimrc.back ]; then
    rm ~/.vimrc.back
fi

if [ -f ~/.config/nvim/colorconfig.vim.back ] && [ add_color ]; then
    rm ~/.config/nvim/colorconfig.vim.back
fi

# Then will create a backup of your current neovim configuration 

if [ -f ~/.config/nvim/init.vim ]; then
    cp ~/.config/nvim/init.vim ~/.config/nvim/init.vim.bak
fi

if [ -f ~/.config/nvim/coc-settings.json ]; then
    cp ~/.config/nvim/coc-settings.json ~/.config/nvim/coc-settings.json.bak
fi

if [ -f ~/.config/nvim/myinit.lua ]; then
    cp ~/.config/nvim/myinit.lua ~/.config/nvim/myinit.lua.bak
fi 

if [ -f ~/.vimrc ]; then
    cp ~/.vimrc ~/.vimrc.bak
fi

if [ -f ~/.config/nvim/colorconfig.vim ] && [ add_color ]; then
    cp ~/.config/nvim/colorconfig.vim ~/.config/nvim/colorconfig.vim.bak
fi

# Then will copy the configuration files from the repo to your machine

cp init.vim ~/.config/nvim/init.vim
cp coc-settings.json ~/.config/nvim/coc-settings.json
cp myinit.lua ~/.config/nvim/myinit.lua
cp vimrc ~/.vimrc

if [ add_color ]; then
    cp colorconfig.vim ~/.config/nvim/colorconfig.vim
fi
