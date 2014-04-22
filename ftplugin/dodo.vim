if exists('b:did_ftplugin')
  finish
else
  let b:did_ftplugin = 1
endif

function! s:UpdateLocationList()
  silent! lvim /\[o\]/j %
endfunction

function! s:ToggleComplete()
  let foundIncomplete = s:canFindOnThisLine("\\[o\\]")
  if foundIncomplete == 1
    let cursor = getpos(".")
    silent! s/\[o\]/[x]/
    call setpos('.', cursor)
    return
  endif
  let foundComplete = s:canFindOnThisLine("\\[x\\]")
  if foundComplete == 1
    let cursor = getpos(".")
    silent! s/\[x\]/[o]/
    call setpos('.', cursor)
    return
  endif
endfunction

function! s:canFindOnThisLine(s)
  let forwards = search(a:s, "nc", line("."))
  let backwards = search(a:s, "ncb", line("."))
  if forwards != 0 || backwards != 0
    return 1
  endif
endfunction

call s:UpdateLocationList()
autocmd BufWritePost <buffer> call s:UpdateLocationList()

nnoremap <silent> <buffer> dc :<c-u>call <SID>ToggleComplete()<cr>

iabbrev <buffer> di [o]
iabbrev <buffer> dc [o]

" vim: nowrap sw=2 sts=2 ts=8 noet:
