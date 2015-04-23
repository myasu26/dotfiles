"====================================Unite Setting=============================================="

"インサートモードで起動
let g:unite_enable_start_insert=0
"開いたファイルの過去履歴50件
let g:unite_source_file_mru_limit=50
"file_mruの表示を高速化
let g:unite_soprce_file_mru_filename_format=''
"最近使用したファイルの表示
noremap <C-r> :Unite file_mru<CR>
