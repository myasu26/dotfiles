if [ -d ${HOME}/.rbenv  ] ; then
        PATH=${HOME}/.rbenv/bin:${PATH}
        export PATH
        eval "$(rbenv init -)"
fi

# http://qiita.com/mollifier/items/42ae46ff4140251290a7 (N-/)

## $B=EJ#%Q%9$rEPO?$7$J$$(B
## http://www.d-wood.com/blog/2013/12/28_5165.html
typeset -U path cdpath fpath manpath

## sudo$BMQ$N(Bpath$B$r@_Dj(B
typeset -xT SUDO_PATH sudo_path
typeset -U sudo_path
sudo_path=({/usr/local,/usr,/home/gopath}/sbin(N-/))

## path$B$r@_Dj(B
path=(~/bin(N-/) /usr/local/bin(N-/) /usr/lib(N-/) /usr/local/bin(N-/) ${path})
