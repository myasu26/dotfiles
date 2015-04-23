set encoding=utf-8
set clipboard=unnamed,autoselect
set fileencodings=iso-2022-jp,euc-jp,sjis,utf-8
set fileformats=unix,dos,mac
set statusline=%<%f\ %m%r%h%w%{'['.(&fenc!=''?&fenc:&enc).']['.&ff.']'}%=%l,%c%V%8P]']'}

syntax enable
"colorscheme koehler
colorscheme desert
set number
set expandtab
set autoindent

set nocompatible
filetype plugin indent on

if has('vim_starting')
        set runtimepath+=~/.vim/bundle/neobundle.vim
        call neobundle#begin(expand('~/.vim/bundle/'))
        NeoBundleFetch 'Shougo/neobundle.vim'
        call neobundle#end()
endif

" solarized
NeoBundle 'altercation/vim-colors-solarized'
" " mustang
NeoBundle 'croaker/mustang-vim'
" " jellybeans
NeoBundle 'nanotech/jellybeans.vim'
" " molokai
NeoBundle 'tomasr/molokai'
NeoBundle 'Shougo/neomru.vim'
NeoBundle 'ujihisa/unite-colorscheme'
NeoBundle 'Shougo/neobundle.vim'
NeoBundle 'Flake8-vim'
"NeoBundle 'davidhalter/jedi-vim'
"NeoBundle 'hynek/vim-python-pep8-indent'
NeoBundle 'Townk/vim-autoclose'
NeoBundle 'scrooloose/syntastic'
NeoBundle 'scrooloose/nerdtree'

NeoBundle 'mattn/webapi-vim'
NeoBundle 'tpope/vim-fugitive'
NeoBundle 'mattn/emmet-vim'
let g:user_emmet_settings = {
    \    'variables': {
    \      'lang': "ja"
    \    },
    \   'indentation': '  '
    \ }

"NeoBundle 'nathanaelkane/vim-indent-guides'
"
NeoBundle 'Yggdroot/indentLine'
let g:indentLine_faster = 1
nmap <silent><Leader>i :<C-u>IndentLinesToggle<CR>

NeoBundle 'Shougo/vimfiler'
NeoBundle 'Shougo/vimproc'
NeoBundle 'Shougo/unite.vim'
NeoBundle 'Shougo/unite-ssh'
NeoBundle 'Shougo/vimshell.vim'
NeoBundle 'lambdalisue/vim-gista'
let g:gista#github_user = 'myasu26'

" コード補完
NeoBundle 'marcus/rsense'
NeoBundle 'supermomonga/neocomplete-rsense.vim'

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

" 静的解析
NeoBundle 'scrooloose/syntastic'

" ドキュメント参照
NeoBundle 'thinca/vim-ref'
NeoBundle 'yuku-t/vim-ref-ri'

" メソッド定義元へのジャンプ
NeoBundle 'szw/vim-tags'

" 自動で閉じる
NeoBundle 'tpope/vim-endwise'

" -------------------------------
" Rsense
" -------------------------------
let g:rsenseHome = '/usr/local/lib/rsense-0.3'
let g:rsenseUseOmniFunc = 1

" --------------------------------
" neocomplete.vim
" --------------------------------
let g:acp_enableAtStartup = 0
let g:neocomplete#enable_at_startup = 1
let g:neocomplete#enable_smart_case = 1
if !exists('g:neocomplete#force_omni_input_patterns')
        let g:neocomplete#force_omni_input_patterns = {}
endif
let g:neocomplete#force_omni_input_patterns.ruby = '[^.*\t]\.\w*\|\h\w*::'

" --------------------------------
" rubocop
" --------------------------------
" syntastic_mode_mapをactiveにするとバッファ保存時にsyntasticが走る
" active_filetypesに、保存時にsyntasticを走らせるファイルタイプを指定する
let g:syntastic_mode_map = { 'mode': 'passive', 'active_filetypes': ['ruby'] }
let g:syntastic_ruby_checkers = ['rubocop']

let g:vimfiler_as_default_explorer = 1

NeoBundle 'Shougo/neosnippet-snippets'
NeoBundle 'Shougo/neosnippet'

" Plugin key-mappings.
imap <C-k>     <Plug>(neosnippet_expand_or_jump)
smap <C-k>     <Plug>(neosnippet_expand_or_jump)
xmap <C-k>     <Plug>(neosnippet_expand_target)

" SuperTab like snippets behavior.
imap <expr><TAB> neosnippet#expandable_or_jumpable() ?
                        \ "\<Plug>(neosnippet_expand_or_jump)"
                        \: pumvisible() ? "\<C-n>" : "\<TAB>"
smap <expr><TAB> neosnippet#expandable_or_jumpable() ?
                        \ "\<Plug>(neosnippet_expand_or_jump)"
                        \: "\<TAB>"

" For snippet_complete marker.
if has('conceal')
        set conceallevel=2 concealcursor=i
endif "

filetype plugin indent on
let g:indent_guides_enable_on_vim_startup = 1

"====================================General==============================================="
set number
set cursorline
set cursorcolumn
set laststatus=2
set showmatch
set hlsearch
set wrapscan
set tabstop=2
set t_Co=256
set ttyfast
set nostartofline
set ruler
set clipboard+=unnamed
set backspace=indent,eol,start
syntax on


command NBI NeoBundleInstall
command NBU NeoBundleUpdate
command NBC NeoBundleClean



"====================================Unite Setting=============================================="

"インサートモードで起動
let g:unite_enable_start_insert=0
"開いたファイルの過去履歴50件
let g:unite_source_file_mru_limit=50
"file_mruの表示を高速化
let g:unite_soprce_file_mru_filename_format=''
"最近使用したファイルの表示
noremap <C-r> :Unite file_mru<CR>

"====================================Python=============================================="
"保存時に自動でチェック
let g:PyFlakeOnWrite=1
let g:PyFlakeCheckers='pep8,mccabe,pyflakes'
let g:PyFlakeDefaultComplexity=10

let g:syntastic_python_checkers=['pyflakes','pep8']

"====================================gtags=============================================="
map <C-g> :Gtags
map <C-h> :Gtags -f %<CR>
map <C-j> :GtagsCursor<CR>
map <C-n> :cn<CR>
map <C-p> :cp<CR>


"====================================NERDTree=============================================="
nnoremap <silent><C-e> :NERDTreeToggle<CR>" " " "

set nocp
if version >= 600
        filetype plugin indent on
endif
