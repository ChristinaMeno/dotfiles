cd ~
ln -fs ~/dotfiles/.vim ~/.vim
ln -fs ~/dotfiles/.vimrc ~/.vimrc
cd ~/dotfiles
git submodule init
git submodule update
cd ~/dotfiles/.vim/bundle/pyflakes-vim
git submodule init
git submodule update
cd ~
