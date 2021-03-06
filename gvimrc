"
"  gvimrc file
"
"
"

"vertical seperator fill char
set fillchars=vert:\ ,fold:-

" set the X11 font to use
if has("gui_win32")
  set guifont=DejaVu\ Sans\ Mono\ for\ Powerline:h10
  set nowrap
  set columns=160
  map <M-m> :simalt ~x<CR>
endif
if has("gui_gnome") || has("gui_gtk")
  "set guifont=fixed
  "set guifont=Luxi\ Mono\ 10
  set guifont=DejaVu\ Sans\ Mono\ for\ Powerline\ 10
endif
if has("gui_macvim")
  "set guifont=Droid\ Sans\ Mono\ for\ Powerline:h12
  set guifont=DejaVu\ Sans\ Mono\ Nerd\ Font\ Complete\ Mono:h13
  "set guifont=Droid\ Sans\ Mono\ for\ Powerline\ Nerd\ Font\ Complete\ Mono:h14
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
  endif
endif

" Fix 'gx' handling on Ubuntu (so it doesn't use gvfs-open)
if has("gui_gtk3")
    let g:netrw_browsex_viewer="setsid xdg-open"
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

"set go-=t

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
    exec '!start C:\Program Files (x86)\Google\Chrome\Application\chrome.exe '.line
endfunction




" Font Menu
"
"aunmenu Fonts
amenu Fonts.3270-Medium                     :set guifont=3270-Medium\ Nerd\ Font\ Complete\ Mono:h14<CR>
amenu Fonts.Anonymice                       :set guifont=Anonymice\ Nerd\ Font\ Complete\ Mono:h14<CR>
"amenu Fonts.Arimo\ Regular                  :set guifont=Arimo\ Regular\ Nerd\ Font\ Complete\ Mono:h14<CR>
amenu Fonts.AurulentSansMono-Regular        :set guifont=AurulentSansMono-Regular\ Nerd\ Font\ Complete\ Mono:h14<CR>
amenu Fonts.Bitstream\ Vera\ Sans\ Mono     :set guifont=Bitstream\ Vera\ Sans\ Mono\ Nerd\ Font\ Complete\ Mono:h14<CR>
amenu Fonts.Code\ New\ Roman                :set guifont=Code\ New\ Roman\ Nerd\ Font\ Complete\ Mono:h14<CR>
amenu Fonts.Cousine\ Regular                :set guifont=Cousine\ Regular\ Nerd\ Font\ Complete\ Mono:h14<CR>
amenu Fonts.DejaVu\ Sans\ Mono              :set guifont=DejaVu\ Sans\ Mono\ Nerd\ Font\ Complete\ Mono:h14<CR>
amenu Fonts.Droid\ Sans\ Mono               :set guifont=Droid\ Sans\ Mono\ Nerd\ Font\ Complete\ Mono:h14<CR>
amenu Fonts.Fantasque\ Sans\ Mono\ Regular  :set guifont=Fantasque\ Sans\ Mono\ Regular\ Nerd\ Font\ Complete\ Mono:h15<CR>
amenu Fonts.FuraCode\ Nerd\ Font\ Mono      :set guifont=FuraCode\ Nerd\ Font\ Mono:h14<CR>
amenu Fonts.Fura\ Mono\ Regular             :set guifont=Fura\ Mono\ Regular\ Nerd\ Font\ Complete\ Mono:h14<CR>
amenu Fonts.Go\ Mono                        :set guifont=Go\ Mono\ Nerd\ Font\ Complete\ Mono:h14<CR>
"amenu Fonts.GohuFont-Medium                 :set guifont=GohuFont-Medium\ Nerd\ Font\ Complete\ Mono:h14<CR>
amenu Fonts.Hasklug                         :set guifont=Hasklug\ Nerd\ Font\ Complete\ Mono:h14<CR>
"amenu Fonts.Heavy\ Data                     :set guifont=Heavy\ Data\ Nerd\ Font\ Complete\ Mono:h14<CR>
amenu Fonts.Hurmit\ Medium                  :set guifont=Hurmit\ Medium\ Nerd\ Font\ Complete\ Mono:h14<CR>
amenu Fonts.InconsolataGo                   :set guifont=InconsolataGo\ Nerd\ Font\ Complete\ Mono:h15<CR>
amenu Fonts.Iosevka                         :set guifont=Iosevka\ Nerd\ Font\ Complete\ Mono:h14<CR>
amenu Fonts.Knack\ Regular                  :set guifont=Knack\ Regular\ Nerd\ Font\ Complete\ Mono:h14<CR>
amenu Fonts.Lekton                          :set guifont=Lekton\ Nerd\ Font\ Complete\ Mono:h15<CR>
amenu Fonts.Literation\ Mono                :set guifont=Literation\ Mono\ Nerd\ Font\ Complete\ Mono:h14<CR>
amenu Fonts.M+\ 1m\ regular                 :set guifont=M+\ 1m\ regular\ Nerd\ Font\ Complete\ Mono:h14<CR>
amenu Fonts.Meslo\ LG\ S\ Regular           :set guifont=Meslo\ LG\ S\ Regular\ Nerd\ Font\ Complete\ Mono:h14<CR>
amenu Fonts.Monoid\ Regular                 :set guifont=Monoid\ Regular\ Nerd\ Font\ Complete\ Mono:h14<CR>
amenu Fonts.ProFont\ IIx                    :set guifont=ProFont\ IIx\ Nerd\ Font\ Complete\ Mono:h14<CR>
amenu Fonts.ProFontWindows                  :set guifont=ProFontWindows\ Nerd\ Font\ Complete\ Mono:h14<CR>
amenu Fonts.ProggyCleanTT                   :set guifont=ProggyCleanTT\ Nerd\ Font\ Complete\ Mono:h14<CR>
amenu Fonts.Roboto\ Mono                    :set guifont=Roboto\ Mono\ Nerd\ Font\ Complete\ Mono:h14<CR>
amenu Fonts.Sauce\ Code\ Pro                :set guifont=Sauce\ Code\ Pro\ Nerd\ Font\ Complete\ Mono:h14<CR>
amenu Fonts.Shure\ Tech\ Mono               :set guifont=Shure\ Tech\ Mono\ Nerd\ Font\ Complete\ Mono:h14<CR>
amenu Fonts.Space\ Mono                     :set guifont=Space\ Mono\ Nerd\ Font\ Complete\ Mono:h14<CR>
amenu Fonts.Terminess\ (TTF)                :set guifont=Terminess\ (TTF)\ Nerd\ Font\ Complete\ Mono:h14<CR>
amenu Fonts.Tinos                           :set guifont=Tinos\ Nerd\ Font\ Complete\ Mono:h14<CR>
amenu Fonts.Ubuntu\ Mono                    :set guifont=Ubuntu\ Mono\ Nerd\ Font\ Complete\ Mono:h14<CR>
amenu Fonts.monofur                         :set guifont=monofur\ Nerd\ Font\ Complete\ Mono:h14<CR>
amenu Fonts.mononoki-Regular                :set guifont=mononoki-Regular\ Nerd\ Font\ Complete\ Mono:h14<CR>



amenu Tools.-SEP90- :
amenu Tools.Show\ Hidden\ Characters :set lcs-=eol:¶<CR>:set isprint=<CR>:syn match blort "[^[:print:]]"<CR>:hi link blort NonText<CR>:set list<CR>
amenu Tools.Show\ Hidden\ Characters\ (inc\ EOL) :set lcs+=eol:¶<CR>:set isprint=<CR>:syn match blort "[^[:print:]]"<CR>:hi link blort NonText<CR>:set list<CR>
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
vmenu 1.30 PopUp.&Copy      "*y
nmenu 1.40 PopUp.&Paste     "*P`]:if col(".")!=1<Bar>exe "norm l"<Bar>endif<CR>
vmenu 1.40 PopUp.&Paste     "-x"*P`]
imenu 1.40 PopUp.&Paste     <Esc>:if col(".")!=1<Bar>exe 'norm "*p'<Bar>else<Bar>exe 'norm "*P'<Bar>endif<CR>`]a
cmenu 1.40 PopUp.&Paste     <C-R>*
vmenu 1.50 PopUp.&Delete      x
amenu 1.55 PopUp.-SEP2-     :
amenu PopUp.Git\ Grep :set grepprg=git\ grep\ -n<CR>:silent grep -F <cword><CR>:cw<CR>:set grepprg=grep\ -nH<CR>
amenu PopUp.Grep\ Source :grep <cword> *.cpp *.cs *.c *.h *.hpp *.rc<CR><CR>:cw<CR>
amenu PopUp.RGrep\ Source :grep -r <cword> *<CR><CR>:cw<CR>
amenu PopUp.FindGrep\ Source :grep -r <cword> `find . -name "*.[ch]*"`<CR><CR>:cw<CR>
amenu PopUp.Grep\ All\ Source :set grepprg=zgrep<CR>:silent grep -F <cword> ~/zzz.gz<CR>:cw<CR>:set grepprg=grep\ -nH<CR>
amenu PopUp.NTiTy\ Grep :set grepprg=/Users/edouardp.ZEACOMDEV/bin/busybox.exe\ sh\ grepdb.sh<CR>:silent grep <cword><CR>:cw<CR>:let @/='<cword>'<CR>:set hls<CR>:set grepprg=grep\ -nH<CR>
amenu PopUp.-SEP91- :
amenu PopUp.Comment\ block :'<,'>s@^@//@<CR>:nohls<CR>
               " Needs a :nohls because vim thinks the ^ is a search to highlight...
amenu PopUp.-SEP92- :
amenu PopUp.Open\ Browser :call Browser()<CR>
amenu PopUp.-SEP93- :
amenu PopUp.cd\ to\ this\ file :cd %:p:h<CR>
amenu PopUp.explore\ pwd :silent !start "`pwd`"<CR>
amenu PopUp.explore\ file :silent !explorer.exe %:p:h<CR>
amenu PopUp.Open\ in\ NERDTree :NERDTreeFind<CR>
amenu PopUp.-SEP94- :
amenu PopUp.terminal\ on\ pwd :silent !osascript -e "tell application \"Terminal\" to activate" -e "tell application \"Terminal\" to do script \"cd `pwd`\""<CR>
amenu PopUp.terminal\ on\ file\ dir :silent !osascript -e "tell application \"Terminal\" to activate" -e "tell application \"Terminal\" to do script \"cd '%:p:h'\""<CR>





" Tooltips for macvim tabs (full path name)
set gtl=%t gtt=%F


" Insert current date (in insert mode)
inoremap <M-/> <C-R>=strftime("%Y-%m-%d: ")<CR>


" Quicker fold open/close mapping
if has('mac')
    map <D-Right> zo
    map <D-Left> zc
    map <D-S-Left> zM
    map <D-S-Right> zR
endif

if has('unix')
    map <T-Right> zo
    map <T-Left> zc
    map <T-S-Left> zM
    map <T-S-Right> zR
endif

if has('win32')
    map <M-Right> zo
    map <M-Left> zc
    map <M-S-Left> zM
    map <M-S-Right> zR
endif


" Shortcut for OmniCompletion
inoremap <C-Space> <C-X><C-O>

if has("gui_macvim")
  " Zoom
  map <D-y> :macaction performZoom:<CR>

  " Fullscreen options
  set fuoptions=maxvert,maxhorz

  " Cheese
  set transparency=5
  set blurradius=16
endif

" Have to set the background here?
set background=dark


" Call the ttbar script/plugin
source ~/vimfiles/bundle/ttbar/ttbar.vim
set go=egmTLr

" Set large toolbar size for Gnome
"
if has("gui")
  if has("unix")
    set toolbariconsize=large
  endif
endif


" IndentLine
"
let g:indentLine_char = '┊'


" Use GUI colours in the terminal
"
set termguicolors


" fzf colourscheme support
"
let g:fzf_colors =
\ { 'fg':      ['fg', 'Define'],
  \ 'bg':      ['bg', 'Normal'],
  \ 'hl':      ['fg', 'Function'],
  \ 'fg+':     ['fg', 'Constant', 'Function', 'Function'],
  \ 'bg+':     ['bg', 'Normal', 'Normal'],
  \ 'hl+':     ['fg', 'Function'],
  \ 'info':    ['fg', 'Comment'],
  \ 'border':  ['fg', 'Normal'],
  \ 'prompt':  ['fg', 'Statement'],
  \ 'pointer': ['fg', 'DiffAdd'],
  \ 'marker':  ['fg', 'Constant'],
  \ 'spinner': ['fg', 'WarningMsg'],
  \ 'header':  ['fg', 'Normal'] }

" NERDTree hack to reduce the uglyness of Dirname/
"
hi NERDTreeDirSlash guifg=#555555


" IndentLine Conceal colour
"
let g:indentLine_color_gui='Grey25'


" Terminal Shortcut
"
map <D-Bar> :botright terminal ++close ++rows=12 bash -c "exec bash --init-file <(echo 'cd %:p:h; source ~/.bash_profile')"<CR>
map <D-Bslash> :botright terminal ++close ++rows=12 bash -c "exec bash --init-file <(echo 'source ~/.bash_profile')"<CR>



" Temporary hack to deal with Splat-V in terminal
"
macm Edit.Paste key=<nop>
tmap <D-v> <C-w>"+
nnoremap <D-v> "+p
vnoremap <D-v> "+p
inoremap <D-v> <C-R><C-O>+
cnoremap <D-v> <C-R><C-O>+


"
"   
"   
"   
"   
"   
"   
"   
"   
"   
"   
"   
"   
"   
"   
"
"
