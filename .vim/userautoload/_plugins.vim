 " Note: Skip initialization for vim-tiny or vim-small.
if !1 | finish | endif

if has('vim_starting')
  if &compatible
    set nocompatible               " Be iMproved
  endif

  " Required:
  set runtimepath+=~/.vim/bundle/neobundle.vim/
endif

" Required:
call neobundle#begin(expand('~/.vim/bundle/'))

" Let NeoBundle manage NeoBundle
" Required:
NeoBundleFetch 'Shougo/neobundle.vim'

" My Bundles here:
" Refer to |:NeoBundle-examples|.
" Note: You don't set neobundle setting in .gvimrc!

" " mustang
"NeoBundle 'croaker/mustang-vim'
" " jellybeans
"NeoBundle 'nanotech/jellybeans.vim'
" " molokai
"NeoBundle 'tomasr/molokai'

NeoBundle 'bling/vim-airline'
NeoBundle 'edkolev/tmuxline.vim'
let g:airline_enable_tmuxline=1
let g:airline#extensions#tmuxline#enable=0
let airline#extensions#tmuxline#color_template = 'normal'
let g:tmuxline_preset='full'

NeoBundle 'itchyny/lightline.vim'
let g:lightline = {
                        \ 'colorscheme': 'landscape',
                        \ 'mode_map': { 'c': 'NORMAL' },
                        \ 'active': {
                        \   'left': [ [ 'mode', 'paste' ], [ 'fugitive', 'filename' ] ]
                        \ },
                        \ 'component_function': {
                        \   'modified': 'MyModified',
                        \   'readonly': 'MyReadonly',
                        \   'fugitive': 'MyFugitive',
                        \   'filename': 'MyFilename',
                        \   'fileformat': 'MyFileformat',
                        \   'filetype': 'MyFiletype',
                        \   'fileencoding': 'MyFileencoding',
                        \   'mode': 'MyMode',
                        \ },
                        \ 'separator': { 'left': '⮀', 'right': '⮂' },
                        \ 'subseparator': { 'left': '⮁', 'right': '⮃' }
                        \ }

function! MyModified()
        return &ft =~ 'help\|vimfiler\|gundo' ? '' : &modified ? '+' : &modifiable ? '' : '-'
endfunction

function! MyReadonly()
        return &ft !~? 'help\|vimfiler\|gundo' && &readonly ? '⭤' : ''
endfunction

function! MyFilename()
        return ('' != MyReadonly() ? MyReadonly() . ' ' : '') .
                                \ (&ft == 'vimfiler' ? vimfiler#get_status_string() : 
                                \  &ft == 'unite' ? unite#get_status_string() : 
                                \  &ft == 'vimshell' ? vimshell#get_status_string() :
                                \ '' != expand('%:t') ? expand('%:t') : '[No Name]') .
                                \ ('' != MyModified() ? ' ' . MyModified() : '')
endfunction

function! MyFugitive()
        if &ft !~? 'vimfiler\|gundo' && exists("*fugitive#head")
                let _ = fugitive#head()
                return strlen(_) ? '⭠ '._ : ''
        endif
        return ''
endfunction

function! MyFileformat()
        return winwidth(0) > 70 ? &fileformat : ''
endfunction

function! MyFiletype()
        return winwidth(0) > 70 ? (strlen(&filetype) ? &filetype : 'no ft') : ''
endfunction

"function! MyFileencoding()
"        return winwidth(0) > 70 ? (strlen(&fenc) ? &fenc : &enc) : ''
"endfunction

function! MyMode()
        return winwidth(0) > 60 ? lightline#mode() : ''
endfunction

" NeoBundle
NeoBundle 'Shougo/neobundle.vim'

" vimfiler
NeoBundle 'Shougo/vimfiler'

" vimで非同期初期
NeoBundle 'Shougo/vimproc.vim', {
  \ 'build' : {
  \     'windows' : 'tools\\update-dll-mingw',
  \     'cygwin' : 'make -f make_cygwin.mak',
  \     'mac' : 'make -f make_mac.mak',
  \     'linux' : 'make',
  \     'unix' : 'gmake',
  \    },
  \ }

" Unite
NeoBundle 'Shougo/unite.vim'

" ssh for vim
NeoBundle 'Shougo/unite-ssh'

" Unite file_mru 最近のファイルとか
NeoBundle 'Shougo/neomru.vim'

" カラースキーム一覧表示に Unite.vim を使う
NeoBundle 'ujihisa/unite-colorscheme'

" vimshell
NeoBundle 'Shougo/vimshell.vim'

" Python syntax check
"NeoBundle 'Flake8-vim'

" Python 補完
"NeoBundle 'davidhalter/jedi-vim'

" Python indent pep8
"NeoBundle 'hynek/vim-python-pep8-indent'

" auto close
NeoBundle 'Townk/vim-autoclose'

" syntax check
NeoBundle 'scrooloose/syntastic'

" nerdtree
NeoBundle 'scrooloose/nerdtree'

" webapi for vim
NeoBundle 'mattn/webapi-vim'

" for git
NeoBundle 'tpope/vim-fugitive'

" for gist
NeoBundle 'lambdalisue/vim-gista'

" emmet for http css
NeoBundle 'mattn/emmet-vim'

" indentLine
NeoBundle 'Yggdroot/indentLine'

" if_luaが有効ならneocompleteを使う
NeoBundle has('lua') ? 'Shougo/neocomplete' : 'Shougo/neocomplcache'

if neobundle#is_installed('neocomplete')
        " neocomplete用設定
        let g:neocomplete#enable_at_startup = 1
        let g:neocomplete#enable_ignore_case = 1
        let g:neocomplete#enable_smart_case = 1
        if !exists('g:neocomplete#keyword_patterns')
                let g:neocomplete#keyword_patterns = {}
        endif
        let g:neocomplete#keyword_patterns._ = '\h\w*'
elseif  neobundle#is_installed('neocomplcache')
        " neocomplcache用設定
        let g:neocomplcache_enable_at_startup = 1
        let g:neocomplcache_enable_ignore_case = 1
        let g:neocomplcache_enable_smart_case = 1
        if !exists('g:neocomplcache_keyword_patterns')
                let g:neocomplcache_keyword_patterns = {}
        endif
        let g:neocomplcache_keyword_patterns._ = '\h\w*'
        let g:neocomplcache_enable_camel_case_completion = 1
        let g:neocomplcache_enable_underbar_completion = 1
endif
inoremap <expr><TAB> pumvisible() ?  "\<C-n>" : "\<TAB>"
inoremap <expr><S-TAB> pumvisible() ?  "\<C-p>" : "\<S-TAB>"" " "

" メソッド定義元へのジャンプ
NeoBundle 'szw/vim-tags'


" for ruby
" コード補完
NeoBundle 'marcus/rsense'
NeoBundle 'supermomonga/neocomplete-rsense.vim'

" ドキュメント参照
NeoBundle 'thinca/vim-ref'
NeoBundle 'yuku-t/vim-ref-ri'


" 自動で閉じる
NeoBundle 'tpope/vim-endwise'


" snippets
NeoBundle 'Shougo/neosnippet-snippets'
NeoBundle 'Shougo/neosnippet'

call neobundle#end()

" Required:

" If there are uninstalled bundles found on startup,
" this will conveniently prompt you to install them.

NeoBundleCheck

command! NBI NeoBundleInstall
command! NBU NeoBundleUpdate
command! NBC NeoBundleClean
