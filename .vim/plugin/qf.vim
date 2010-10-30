" File: qf.vim
" Author: Yegappan Lakshmanan
" Version: 0.2
" Last Modified: June 28, 2006
"
" Quickfix file location stack plugin
"
" The quickfix plugin saves the current location in the file before executing
" a quickfix command like grep, vimgrep, make, etc. The locations are
" maintained in a stack.  This plugin provides commands to jump to those
" locations by poping the stack.
"
" This plugin provides the following two commands:
"
" :QfShow   - Display the quickfix stack
" :[n]QfPop - Pop the quickfix stack
"
" You can use the ":QfShow" command to display the list of file locations
" stored in the stack.
"
" You can use the ":QfPop" command to pop the topmost entry and jump to that
" file location. The ":QfPop" command also accepts a count and allows to pop
" multiple entries from the stack. The default count value is 1.
"
" This plugin works only with Vim version 7 and above
"
if exists("loaded_qf")
    finish
endif
let loaded_qf = 1

function! s:Qf_Msg(msg)
    echohl WarningMsg | echomsg a:msg | echohl None
endfunction

let s:qf_stack = []

" Qf_Save_Location
" Save the current file location in the quickfix stack
function! s:Qf_Save_Location()
    let fname = fnamemodify(expand('%'), ':p')
    call insert(s:qf_stack, {"file":fname, "pos":getpos('.')})
endfunction

" Qf_Stack_Pop
" Pop the quickfix stack and jump to the file location
function! s:Qf_Stack_Pop(entry_count)
    let stack_size = len(s:qf_stack)
    if stack_size == 0
        call s:Qf_Msg("Quickfix stack is empty")
        return
    endif

    let pop_count = a:entry_count
    if pop_count > stack_size
        let pop_count = stack_size
    endif

    " Pop the specified number of entries
    let l = remove(s:qf_stack, 0, pop_count - 1)
    if empty(l)
        return
    endif

    " Jump to the last specified entry
    exe 'edit ' . l[pop_count - 1].file
    cal setpos('.', l[pop_count - 1].pos)
endfunction

" Qf_Stack_Show
" Display the entries in the quickfix stack
function! s:Qf_Stack_Show()
    if empty(s:qf_stack)
        call s:Qf_Msg("Quickfix stack is empty")
        return
    endif

    echo "Quickfix stack"
    echo "#\tlnum\tfile"

    let i = 1

    for entry in s:qf_stack
        " Show only the last 50 characters in the file name
        let fname = fnamemodify(entry.file, ':.')
        let len = strlen(fname)
        let fname = strpart(fname, len-50)
        echo i . "\t" . entry.pos[1] . "\t" . fname
        let i += 1
    endfor
endfunction

" Autocmd to save the file location before executing a quickfix command
autocmd QuickFixCmdPre * call s:Qf_Save_Location()

" Define commands to display and pop the stack
command! QfShow call s:Qf_Stack_Show()
command! -count=1 QfPop call s:Qf_Stack_Pop(<count>)

