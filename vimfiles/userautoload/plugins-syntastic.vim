" --------------------------------
" rubocop
" --------------------------------
" syntastic_mode_map$B$r(Bactive$B$K$9$k$H%P%C%U%!J]B8;~$K(Bsyntastic$B$,Av$k(B
" active_filetypes$B$K!"J]B8;~$K(Bsyntastic$B$rAv$i$;$k%U%!%$%k%?%$%W$r;XDj$9$k(B
let g:syntastic_mode_map = { 'mode': 'passive', 'active_filetypes': ['ruby'] }
let g:syntastic_ruby_checkers = ['rubocop']
