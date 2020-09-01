"
" Yankee!
"

" Prevent from loading twice {{{
if exists("g:yankee_loaded")
  finish
endif
let g:yankee_loaded = 1
" }}}

" Configuration {{{
if !exists("g:yankee_command")
  if filereadable("/usr/bin/xsel") || filereadable("/usr/local/bin/xsel")
    let g:yankee_command = "xsel -bi"
  elseif filereadable("/usr/bin/pbcopy")
    let g:yankee_command = "pbcopy"
  else
    finish
  endif
endif
" }}}

" Main {{{
function! YankeeDoodle()
  if v:event.operator == "y"
    call system("xsel -bi", join(v:event.regcontents, "\n"))
  endif
endfunction
" }}}

" Auto {{{
augroup Yankee
  autocmd!
  autocmd TextYankPost * call YankeeDoodle()
augroup END
" }}}

" ----------------------------------------------------------
" vim:fen:fdm=marker:fmr={{{,}}}:fdl=0:fdc=1:ts=2:sts=2:sw=2
