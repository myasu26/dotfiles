if [ -d ${HOME}/.rbenv  ] ; then
        PATH=${HOME}/.rbenv/bin:${PATH}
        export PATH
        eval "$(rbenv init -)"
fi

PATH=${HOME}/bin:${PATH}
export PATH

PATH=${HOME}/.tmux/plugins/tpm:${PATH}
export PATH
