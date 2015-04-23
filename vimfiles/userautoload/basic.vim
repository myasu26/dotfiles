set encoding=utf-8
set clipboard=unnamed,autoselect
set fileencodings=iso-2022-jp,euc-jp,sjis,utf-8
set fileformats=unix,dos,mac
set laststatus=2
set statusline=%<%f\ %m%r%h%w%{'['.(&fenc!=''?&fenc:&enc).']['.&ff.']'}%=%l,%c%V%8P]']'}
set number
set expandtab
set autoindent
set cursorline
set cursorcolumn
set showmatch
set hlsearch
set wrapscan
set tabstop=2
set t_Co=256
set ttyfast
set nostartofline
set ruler
set backspace=indent,eol,start
syntax on


"====================================Python=============================================="
"保存時に自動でチェック
"let g:PyFlakeOnWrite=1
"let g:PyFlakeCheckers='pep8,mccabe,pyflakes'
"let g:PyFlakeDefaultComplexity=10
"
"let g:syntastic_python_checkers=['pyflakes','pep8']
"letype plugin indent on
