#!/usr/bin/zsh

curl -L https://raw.githubusercontent.com/zsh-users/antigen/master/antigen.zsh > ~/.antigen/antigen.zsh

git clone https://github.com/Shougo/neobundle.vim ~/dotfiles/vimfiles/bundle/neobundle.vim

ln -sf ~/dotfiles/.vimrc ~/.vimrc
ln -sfn ~/dotfiles/vimfiles ~/.vim
#ln -sf ~/dotfiles/.bash_profile ~/.bash_profile
#ln -sf ~/dotfiles/.bashrc ~/.bashrc
ln -sf ~/dotfiles/.zsh/.zshenv ~/.zshenv
ln -sf ~/dotfiles/.zsh/.zshrc ~/.zshrc
ln -sf ~/dotfiles/.colorrc ~/.colorrc
ln -sf ~/dotfiles/.tmux.conf ~/.tmux.conf
#ln -sf ~/dotfiles/.zsh/.peco.json ~/.peco/config.json
