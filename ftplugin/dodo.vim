if exists('b:did_ftplugin')
  finish
else
  let b:did_ftplugin = 1
endif

function! s:UpdateLocationList()
  silent! lvim /\[o\]/j %
endfunction

call s:UpdateLocationList()
autocmd BufWritePost <buffer> call s:UpdateLocationList()

:iabbrev <buffer> di [o]
:iabbrev <buffer> dc [o]

" vim: nowrap sw=2 sts=2 ts=8 noet:
