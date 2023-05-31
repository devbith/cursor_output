#!/bin/bash

# Download and unzip the file
curl -L -o cursor_output.zip https://github.com/devbith/cursor_output/archive/refs/heads/main.zip
unzip -q cursor_output.zip -d ~/.vim

# Append lines to ~/.vimrc
echo "filetype plugin on" >> ~/.vimrc
echo "autocmd Filetype java source ~/.vim/cursor_output-main/java/cursor_output.vim" >> ~/.vimrc
echo "autocmd Filetype javascript source ~/.vim/cursor_output-main/javascript/cursor_output.vim" >> ~/.vimrc

# Delete the downloaded file
rm cursor_output.zip

echo "Setup complete."
