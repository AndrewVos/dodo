if exists("b:current_syntax")
	finish
endif

highlight TodoRed ctermfg=red
highlight TodoGreen ctermfg=green
highlight TodoBlue ctermfg=blue

syntax match TodoIncomplete "\[\*\]"
highlight link TodoIncomplete TodoRed

syntax match TodoComplete "\[x\]"
highlight link TodoComplete TodoGreen

syntax match TodoDateFuture "\[\d\d\-\d\d\-\d\d\d\d\]"
highlight link TodoDateFuture TodoGreen

let s:today = "'\\[" . strftime("%d\\-%m\\-%Y") . "\\]'"
exec "syntax match TodoDateToday " . s:today
highlight link TodoDateToday TodoRed

let s:dayTomorrow = strftime("%d") + 1
if len(s:dayTomorrow) == 1
    let s:dayTomorrow = "0" . s:dayTomorrow
endif
let s:tomorrow = "'\\[" . s:dayTomorrow . strftime("\\-%m\\-%Y") . "\\]'"
exec "syntax match TodoDateTomorrow " . s:tomorrow
highlight link TodoDateTomorrow TodoBlue

function! s:ConvertToCharClass(cur) 
    if a:cur =~ '[2-9]'
        return '[0-' . (a:cur-1) . ']'
    endif
    return '0'
endfunction

function! s:MatchNumberBefore(num)
    let branches = []
    let init = ''
    for i in range(len(a:num))
        if a:num[i] =~ '[1-9]'
            call add(branches, init . s:ConvertToCharClass(a:num[i]) . repeat('\d', len(a:num) - i - 1))
        endif 
        let init .= a:num[i]
    endfor
    return '\%(' . join(branches, '\|') .'\)'
endfunction

let s:beforeYear = s:MatchNumberBefore(strftime("%Y"))
let s:beforeMonth = s:MatchNumberBefore(strftime("%m"))
let s:beforeDay = s:MatchNumberBefore(strftime("%d"))
let s:year = strftime("%Y")
let s:month = strftime("%m")
let s:day = strftime("%d")
exec "syntax match TodoDatePast \"\\[\\d\\{2}-\\d\\{2}-" . s:beforeYear . "\\]\""
exec "syntax match TodoDatePast \"\\[\\d\\{2}-" . s:beforeMonth . "-" . s:year . "\\]\""
exec "syntax match TodoDatePast \"\\[" . s:beforeDay . "-" . s:month . "-" . s:year . "\\]\""
highlight link TodoDatePast TodoRed

let b:current_syntax = "todo"
