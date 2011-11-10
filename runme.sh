pushd
cd ~
ln -s ~/.vim/vimrc ~/.vimrc
ln -s ~/.vim/gvimrc ~/.gvimrc
cd ~/.vim
git submodule init
git submodule update
cd ~/.vim/bundle/pyflakes/ftplugin/python
git clone http://github.com/kevinw/pyflakes  
popd
