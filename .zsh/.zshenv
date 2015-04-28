if [ -d ${HOME}/.rbenv  ] ; then
        PATH=${HOME}/.rbenv/bin:${PATH}
        export PATH
        eval "$(rbenv init -)"
fi

# http://qiita.com/mollifier/items/42ae46ff4140251290a7 (N-/)

## 重複パスを登録しない
## http://www.d-wood.com/blog/2013/12/28_5165.html
typeset -U path cdpath fpath manpath

## sudo用のpathを設定
typeset -xT SUDO_PATH sudo_path
typeset -U sudo_path
sudo_path=({/usr/local,/usr,/home/gopath}/sbin(N-/))

## pathを設定
path=(~/bin(N-/) /usr/local/bin(N-/) /usr/lib(N-/) /usr/local/bin(N-/) ${path})
