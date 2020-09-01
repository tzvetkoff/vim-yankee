"
" Yankee!
"

" Prevent from loading twice.
if exists("g:yankee_loaded")
  finish
endif
let g:yankee_loaded = 1

" Configuration.
if !exists("g:yankee_command")
  if filereadable("/usr/bin/xsel") || filereadable("/usr/local/bin/xsel")
    let g:yankee_command = "xsel -bi"
  elseif filereadable("/usr/bin/pbcopy")
    let g:yankee_command = "pbcopy"
  else
    echom "Yankee could not find a suitable command to modify clipboard."
    echom "You can set it manually by having the following in your .vimrc:"
    echom "  let g:yankee_command = \"some_command\""
    finish
  endif
endif

" The main function.
function! YankeeDoodle()
  if v:event.operator == "y"
    call system("xsel -bi", join(v:event.regcontents, "\n"))
  endif
endfunction

" Full auto.
augroup Yankee
  autocmd!
  autocmd TextYankPost * call YankeeDoodle()
augroup END

" ----------------------------------------------------------------
" vim: filetype=vim tabstop=2 softtabstop=2 shiftwidth=2 expandtab
