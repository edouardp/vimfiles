" Vim

"vertical seperator fill char
set fillchars=vert:\ ,fold:-

" set the X11 font to use
if has("gui_win32")
  #set guifont=Lucida_Console:h11
  set guifont=DejaVu\ Sans\ Mono\ for\ Powerline:h10
  set nowrap
  set columns=160
  map <M-m> :simalt ~x<CR>
endif
if has("gui_gnome")
  "set guifont=fixed
  set guifont=Luxi\ Mono\ 10
endif

" Make command line two lines high
set cmdheight=2

" Make backspace go beyond initial changes in insert mode
set backspace=2

" Make it 60 lines high
if has("gui")
  if has("win32")
    set lines=60
  endif
  if has("unix")
    set lines=59
    set guifont=DejaVu\ Sans\ Mono\ for\ Powerline:h12
  endif
endif


" Switch on syntax highlighting.
syntax on

" Hide the mouse while we are typing
set mousehide

" Make a right mouse click popup a menu
set mousemodel=popup_setpos

" Turn on bracket matching
set showmatch

" Switch on search pattern highlighting.
set hlsearch

" Turn off the buffers menu... (5.5 and above?)
let no_buffers_menu = 1

set go-=t

" Mappings for VIM in GUI mode
map <D-Down> :cn<CR>
map <D-Up> :cp<CR>

map <S-D-Right> :tabnext<CR>
map <S-D-Left> :tabprev<CR>


" Makes tabs show up when you issue a ':set list'
set lcs+=tab:>-

" Make everything printable *except* char 160 (hard space) as it
" is easy to accidentily type in Windows.
set isprint=@,~-159,161-255

" Browser Function
"
function! Browser ()
let line0 = getline (".")
let line = matchstr (line0, "http[^ ]*")
if line==""
    let line = matchstr (line0, "ftp[^ ]*")
endif
if line==""
    let line = matchstr (line0, "file[^ ]*")
endif
let line = escape (line, "#?&;|%")
":if line==""
" let line = "\"" . (expand("%:p")) . "\""
":endif
exec '!start C:\Users\edouardp.ZEACOMDEV\AppData\Local\Google\Chrome\Application\chrome.exe '.line
endfunction

" Set a nicer foldtext function
set foldtext=MyFoldText()
function! MyFoldText()
let line = getline(v:foldstart)

if match( line, '^[ \t]*\(\/\*\|\/\/\)[*/\\]*[ \t]*$' ) == 0
    let initial = substitute( line, '^\([ \t]\)*\(\/\*\|\/\/\)\(.*\)', '\1\2', '' )
    
    let linenum = v:foldstart + 1
    while linenum < v:foldend
        let line = getline( linenum )
        let comment_content = substitute( line, '^\([ \t\/\*]*\)\(.*\)$', '\2', 'g' )
        if comment_content != ''
            break
        endif
        let linenum = linenum + 1
    endwhile

    let sub = initial . ' ' . comment_content
else
    let sub = line
    let startbrace = substitute( line, '^.*{[ \t]*$', '{', 'g')
    if startbrace == '{'
        let line = getline(v:foldend)
        let endbrace = substitute( line, '^[ \t]*}\(.*\)$', '}', 'g')
        if endbrace == '}'
            let sub = sub.substitute( line, '^[ \t]*}\(.*\)$', '...}\1', 'g')
        endif
    endif
endif

let n = v:foldend - v:foldstart + 1
let info = " " . n . " lines " 
let sub = sub . "                                                                                                                                                                                                         "

let num_w = getwinvar( 0, '&number' ) * getwinvar( 0, '&numberwidth' )
let fold_w = getwinvar( 0, '&foldcolumn' )
let sub = strpart( sub, 0, winwidth(0) - strlen( info ) - num_w - fold_w )
return sub . info
endfunction



if 0
highlight FoldColumn  gui=bold    guifg=grey65     guibg=Grey90
highlight Folded      gui=italic  guifg=Black      guibg=Grey90
highlight LineNr      gui=NONE    guifg=grey60     guibg=Grey90



"
" Boy. Don't let programmers set colours.
" 
" These are fixed to be almost pleasent. I've gone
" completely overboard with that subtlety thing...
"
highlight Normal       gui=NONE    guifg=Black      guibg=White
highlight NonText      gui=NONE    guifg=grey50     guibg=grey90
highlight SpecialKey   gui=NONE    guifg=grey50     guibg=grey90
highlight Cursor       gui=NONE    guifg=White      guibg=red4
highlight StatusLine   gui=NONE    guifg=White      guibg=Black
highlight StatusLineNC gui=NONE    guifg=White      guibg=grey30
highlight VertSplit    gui=NONE    guifg=White      guibg=grey30
highlight VerticalSep  gui=NONE    guifg=White      guibg=grey30
highlight Visual       gui=NONE    guifg=White      guibg=Black

highlight Search       gui=NONE    guifg=NONE       guibg=Yellow

highlight Comment     gui=NONE    guifg=#880000    guibg=White
highlight Constant    gui=NONE    guifg=Black      guibg=White
highlight Special     gui=NONE    guifg=#000088    guibg=LightGrey
highlight Identifier  gui=NONE    guifg=#000088    guibg=White
highlight Statement   gui=NONE    guifg=#000088    guibg=White
highlight Statement   gui=NONE    guifg=#000088    guibg=White
highlight Type        gui=NONE    guifg=#000088    guibg=White
highlight PreProc     gui=NONE    guifg=#770077    guibg=White
highlight Error       gui=bold    guifg=White      guibg=red4

highlight Pmenu       gui=NONE    guifg=White      guibg=Gray
highlight PmenuSel    gui=NONE    guifg=Black      guibg=LightGray

highlight DiffAdd	    gui=NONE    guifg=Black      guibg=LightBlue 
highlight DiffChange  gui=NONE    guifg=Black      guibg=LightGreen 
highlight DiffDelete  gui=NONE    guifg=Pink       guibg=LightPink 
highlight DiffText    gui=NONE    guifg=DarkGray      guibg=Yellow 

endif




amenu Tools.-SEP90- :
amenu Tools.Show\ Hidden\ Characters :set lcs-=eol:$<CR>:set isprint=<CR>:syn match blort "[^[:print:]]"<CR>:hi link blort NonText<CR>:set list<CR>
amenu Tools.Show\ Hidden\ Characters\ (inc\ EOL) :set lcs+=eol:$<CR>:set isprint=<CR>:syn match blort "[^[:print:]]"<CR>:hi link blort NonText<CR>:set list<CR>
amenu Tools.Hide\ Hidden\ Characters :syn clear blort<CR>:set isprint=@,~-159,161-255<CR>:set nolist<CR>
amenu Tools.-SEP100- :
amenu Tools.Clear\ Last\ Search\ Highlight :nohlsearch<CR>
amenu Tools.-SEP101- :
amenu Tools.Standard\ Status\ Line :set statusline=%f%(%m%r%h%)<CR>
amenu Tools.Expanded\ Status\ Line :set statusline=%f%(%m%r%h%)%=Line\ %l\ (%p%%)\ Col\ %c\ [Byte\ %o]<CR>
amenu Tools.Ascii\ Status\ Line :set statusline=%f%(%m%r%h%)%=Ascii\ %b\ (%B)<CR>

"  amenu Tools.-SEP102- :
"  amenu Tools.Convert\ To\ Hexdump :1,$!xxd<CR>
"  amenu Tools.Convert\ From\ Hexdump :1,$!xxd -r<CR>

unmenu PopUp
vmenu 1.20 PopUp.Cu&t         "*x
vmenu 1.30 PopUp.&Copy		"*y
nmenu 1.40 PopUp.&Paste		"*P`]:if col(".")!=1<Bar>exe "norm l"<Bar>endif<CR>
vmenu 1.40 PopUp.&Paste		"-x"*P`]
imenu 1.40 PopUp.&Paste		<Esc>:if col(".")!=1<Bar>exe 'norm "*p'<Bar>else<Bar>exe 'norm "*P'<Bar>endif<CR>`]a
cmenu 1.40 PopUp.&Paste		<C-R>*
vmenu 1.50 PopUp.&Delete      x
amenu 1.55 PopUp.-SEP2-		:
amenu PopUp.Grep\ Source :grep <cword> *.cpp *.cs *.c *.h *.hpp *.rc<CR><CR>:cw<CR>
amenu PopUp.RGrep\ Source :grep -r <cword> *<CR><CR>:cw<CR>
amenu PopUp.FindGrep\ Source :grep -r <cword> `find . -name "*.[ch]*"`<CR><CR>:cw<CR>
amenu PopUp.Grep\ All\ Source :set grepprg=zgrep<CR>:silent grep -F <cword> ~/zzz.gz<CR>:cw<CR>:set grepprg=grep\ -nH<CR>
amenu PopUp.NTiTy\ Grep :set grepprg=/Users/edouardp.ZEACOMDEV/bin/busybox.exe\ sh\ grepdb.sh<CR>:silent grep <cword><CR>:cw<CR>:let @/='<cword>'<CR>:set hls<CR>:set grepprg=grep\ -nH<CR>
amenu PopUp.Goto\ Tag g<C-]>
amenu PopUp.Split-Tag <C-W><C-]>
amenu PopUp.Split-Def <C-W><Tab>
amenu PopUp.-SEP90- :
amenu PopUp.Open\ File gf
amenu PopUp.Split-File <C-W>f
amenu PopUp.-SEP91- :
amenu PopUp.Comment\ block :'<,'>s@^@//@<CR>:nohls<CR>
               " Needs a :nohls because vim thinks the ^ is a search to highlight...
amenu PopUp.-SEP92- :
amenu PopUp.cd\ to\ this\ file :cd %:p:h<CR>
amenu PopUp.Open\ Browser :call Browser()<CR>
amenu PopUp.explore\ pwd :silent !start "`pwd`"<CR>
amenu PopUp.explore\ file :silent !explorer.exe %:p:h<CR>
amenu PopUp.terminal\ on\ pwd :silent !osascript -e "tell application \"Terminal\" to activate" -e "tell application \"Terminal\" to do script \"cd `pwd`\""<CR>
amenu PopUp.terminal\ on\ file\ dir :silent !osascript -e "tell application \"Terminal\" to activate" -e "tell application \"Terminal\" to do script \"cd '%:p:h'\""<CR>





" Tooltips for macvim tabs (full path name)
set gtl=%t gtt=%F


" Insert current date (in insert mode)
inoremap <M-/> <C-R>=strftime("%Y-%m-%d: ")<CR>



" Quicker fold open/close mapping
map <M-Right> zo
map <M-Left> zc


" Shortcut for OmniCompletion
inoremap <C-Space> <C-X><C-O>

if has("gui_macvim")
  " Zoom
  map <D-y> :macaction performZoom:<CR>

  " Fullscreen options
  set fuoptions=maxvert

  " Cheese
  set transparency=5
endif

" Have to set the background here?
set background=dark

