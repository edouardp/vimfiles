" Send selection to terminal
"
"
function! Find_terminal_buffer()
    for bufnr in range(1, bufnr('$'))
        if bufexists(bufnr) && getbufvar(bufnr, '&buftype') ==# 'terminal'
            return bufnr
        endif
    endfor
    return 0
endfunction


function! Send_Current_Line_To_Terminal()
    let t = getline(".")
    if char2nr(t[len(t)-1]) == 10 || char2nr(t[len(t)-1]) == 13 
        " Nothing
    else
        let t = t . "\<CR>"
    endif

    let buf = Find_terminal_buffer()
    if buf == 0
        echoerr "No terminal buffer found"
        return
    endif

    call term_sendkeys(buf, t) 
endfun

nnoremap <C-s> :call Send_Current_Line_To_Terminal()<CR>


function! Send_Selection_To_Terminal()
    " Uses the 'z' register
    normal! gv"zy
    if char2nr(@z[len(@z)-1]) == 10 || char2nr(@z[len(@z)-1]) == 13 
        "echo "ends with <CR>"
        let t = @z
    else
        "echo "doesn't end with <CR>"
        let t = @z . "\<CR>"
    endif
    let buf = Find_terminal_buffer()

    if buf == 0
        echoerr "No terminal buffer found"
        return
    endif
    
    call term_sendkeys(buf, t) 
endfun
vnoremap <C-s> :<C-U>call Send_Selection_To_Terminal()<CR>

" ls



