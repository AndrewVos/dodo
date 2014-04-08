if exists("b:current_syntax")
  finish
endif

highlight TodoRed ctermfg=red
highlight TodoGreen ctermfg=green
highlight TodoBlue ctermfg=blue

syntax match TodoIncomplete "\[o\]"
highlight link TodoIncomplete TodoRed
syntax match TodoIncompleteDate "\[o\] \[\d\d-\d\d-\d\d\d\d\]"
highlight link TodoIncompleteDate TodoRed

syntax match TodoComplete "\[x\]"
highlight link TodoComplete TodoGreen
syntax match TodoCompleteDate "\[x\] \[\d\d-\d\d-\d\d\d\d\]"
highlight link TodoCompleteDate TodoGreen

let s:today = "'\\[o\\] \\[" . strftime("%d\\-%m\\-%Y") . "\\]'"
exec "syntax match TodoDateToday " . s:today
highlight link TodoDateToday TodoBlue

let b:current_syntax = "todo"

" vim: nowrap sw=2 sts=2 ts=8 noet:
