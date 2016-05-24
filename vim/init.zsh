bundledir=$HOME/.vim/bundle
vundledir=$bundledir/Vundle.vim
if ! test -e $vundledir; then
    mkdir -p $bundledir
    git clone https://github.com/VundleVim/Vundle.vim.git $vundledir
fi
