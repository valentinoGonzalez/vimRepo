To use this configuration file download the repository:

git clone https://github.com/valentinoGonzalez/vimRepot.git ~/.vim

You can also use some other address instead of ~/.vim but make sure to
creat a link: 
ln -s <yourPath> ~/.vim

You will also need this link:
ln -s <yourPath>/vimrc ~/.vimrc

And this one for the graphical interface only commands:
ln -s <youPath/gvimrc ~/.gvimrc

And finally, add this to you .bashrc:
export VIM_DIR=$HOME/.vim/vimrc
