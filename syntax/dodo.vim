if exists("b:current_syntax")
  finish
endif

highlight DodoRed ctermfg=red
highlight DodoGreen ctermfg=green
highlight DodoBlue ctermfg=blue

syntax match DodoIncomplete "\[o\]"
highlight link DodoIncomplete DodoRed
syntax match DodoIncompleteDate "\[o\] \[\d\d-\d\d-\d\d\d\d\]"
highlight link DodoIncompleteDate DodoRed

syntax match DodoComplete "\[x\]"
highlight link DodoComplete DodoGreen
syntax match DodoCompleteDate "\[x\] \[\d\d-\d\d-\d\d\d\d\]"
highlight link DodoCompleteDate DodoGreen

let s:today = "'\\[o\\] \\[" . strftime("%d\\-%m\\-%Y") . "\\]'"
exec "syntax match DodoDateToday " . s:today
highlight link DodoDateToday DodoBlue

let b:current_syntax = "dodo"

" vim: nowrap sw=2 sts=2 ts=8 noet:
