#!/usr/bin/zsh

mkdir -p ~/.antigen
curl -L https://raw.githubusercontent.com/zsh-users/antigen/master/antigen.zsh > ~/.antigen/antigen.zsh

curl https://raw.githubusercontent.com/Shougo/neobundle.vim/master/bin/install.sh | sh
mv ~/.vim/bundle/neobundle.vim ~/dotfiles/vimfiles/bundle/
rm -rf ~/.vim

ln -sf ~/dotfiles/.vimrc ~/.vimrc
ln -sfn ~/dotfiles/.vim ~/.vim
#ln -sf ~/dotfiles/.bash_profile ~/.bash_profile
#ln -sf ~/dotfiles/.bashrc ~/.bashrc
ln -sf ~/dotfiles/.zsh/.zshenv ~/.zshenv
ln -sf ~/dotfiles/.zsh/.zshrc ~/.zshrc
ln -sf ~/dotfiles/.colorrc ~/.colorrc
ln -sf ~/dotfiles/.tmux.conf ~/.tmux.conf
ln -sf ~/dotfiles/.zsh/.peco.json ~/.peco/config.json
