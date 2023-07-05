#!/bin/bash
rm .vimrc 
cp ../.vimrc . 
git add .
git commit -m "Update my vimrc config for vim (Not neovim...)"
git push
