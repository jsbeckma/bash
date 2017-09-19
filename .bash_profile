#!/bin/bash

if [ -e ~/.bashrc ]; then
    source ~/.bashrc
fi

PATH="${PATH}:~/bin"
export PATH
