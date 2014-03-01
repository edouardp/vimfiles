"
"  Edouard Poor's global .vimrc file
"
"  Modified:      Wed Jun 26 10:16:31 NZST 1996
"  Last modified: Fri Jan 24 13:33:45 NZDT 2013
"

" -- Standard Header for Vundle based vimrc ----------------------------------

set nocompatible             		" be iMproved
filetype off                 		" required!


" -- Set up Vundle -----------------------------------------------------------

set rtp+=~/vimfiles/bundle/vundle/
call vundle#rc("~/vimfiles/bundle")
Bundle 'gmarik/vundle'


" -- My bundles --------------------------------------------------------------

" Original repos on GitHub
Bundle 'tpope/vim-fugitive'
Bundle 'edouardp/vim-railscasts-theme'
Bundle 'bling/vim-airline'
Bundle 'nathanaelkane/vim-indent-guides'
Bundle 'SirVer/ultisnips'
Bundle 'nelstrom/vim-visual-star-search'
Bundle 'scrooloose/nerdtree'
Bundle 'kien/tabman.vim'
Bundle 'PProvost/vim-ps1'
Bundle 'majutsushi/tagbar'
Bundle 'kien/ctrlp.vim'
Bundle 'edouardp/folde'
Bundle 'tpope/vim-characterize'
Bundle 'edouardp/ps1-ultisnips'
Bundle 'mbbill/undotree'
Bundle 'jacquesbh/vim-showmarks'
Bundle 'vlmarek/ConqueVlad'
Bundle 'istepura/vim-toolbar-icons-silk'
Bundle 'airblade/vim-gitgutter'
Bundle 'edouardp/ttbar'

if !has("gui_win32")        " Not supported on Windows out of the box
Bundle 'Valloric/YouCompleteMe'
endif


" -- Standard Header for Vundle based vimrc ----------------------------------

filetype plugin indent on     " required!


" -- Custom Stuff (to move to a seperate file) -------------------------------

" Viminfo
set history=1000
set viminfo='0,:1000,/50,h,n~/vimfiles/_viminfo

" Incremental Search on
set incsearch

" Keep status line on
set laststatus=2

" Minimum windows height on enter
set winheight=10

" Shift width
set shiftwidth=2

" Turn off all wrapping
set wrapmargin=0
set textwidth=0

" Tabs as 4 spaces
set tabstop=4
set expandtab

" Get rid of "|" in vertical splits
set fillchars=fold:-

" Insert current date
inoremap <D-/> <C-R>=strftime("%Y/%m/%d: ")<CR>

" up/down key support for completion menu
inoremap <Up> <C-R>=pumvisible() ? "\<lt>C-P>" : "\<lt>Up>"<CR>
inoremap <Down> <C-R>=pumvisible() ? "\<lt>C-N>" : "\<lt>Down>"<CR>

" Always enable fold column (and make space for it)
"set columns=84
set foldcolumn=4

" Colourscheme
colorscheme railscasts


" Tagbar Customisation
if has("gui_win32")         " Binaries live in different places for now
  let g:tagbar_ctags_bin = expand('~/bin/ctags.exe')
else
  let g:tagbar_ctags_bin = /usr/local/bin/ctags
endif
let g:tagbar_iconchars = ['▶', '▼']


" UltiSnips/YouCompleteMe integration
function! g:UltiSnips_Complete()
    call UltiSnips_ExpandSnippet()
    if g:ulti_expand_res == 0
        if pumvisible()
            return "\<C-n>"
        else
            call UltiSnips_JumpForwards()
            if g:ulti_jump_forwards_res == 0
               return "\<TAB>"
            endif
        endif
    endif
    return ""
endfunction

au BufEnter * exec "inoremap <silent> " . g:UltiSnipsExpandTrigger . " <C-R>=g:UltiSnips_Complete()<cr>"
let g:UltiSnipsJumpForwardTrigger="<tab>"
let g:UltiSnipsListSnippets="<c-e>"


" Ctrl-P Customisation
let g:ctrlp_max_files=0
let g:ctrlp_cache_dir=expand("~/.vimfiles/.ctrlp_cache")


" NERDTree
let NERDTreeDirArrows=1


" Stat in home dir
cd ~

let g:tagbar_type_ps1 = { 'ctagstype' : 'powershell', 'kinds' : [ 'd:definition', ], 'sort' : 0, 'deffile' : expand('~/vimfiles/ctags-ps1.cnf') }
let g:tagbar_type_xml = { 'ctagstype' : 'XML', 'kinds' : [ 'd:definition', ], 'sort' : 0, 'deffile' : expand('~/vimfiles/ctags-PatternLibrary.cnf') }


" UndoTree Customisation
if !exists('g:undotree_WindowLayout')
    let g:undotree_WindowLayout = 2
endif


" Airline Customisation
let g:airline_theme='light'

" powerline symbols
if !exists('g:airline_symbols')
  let g:airline_symbols = {}
endif
let g:airline_left_sep = ''
let g:airline_left_alt_sep = ''
let g:airline_right_sep = ''
let g:airline_right_alt_sep = ''
let g:airline_symbols.branch = ''
let g:airline_symbols.readonly = ''
let g:airline_symbols.linenr = ''

let g:airline_powerline_fonts = 1
set encoding=utf-8


" Folde Customisation
" Choose a style at startup
"FoldeStyle powerline



hi ColorColumn guibg=#662222 ctermbg=236
"amenu 950 ToolBar.-SEP950- :<CR>
aunmenu ToolBar
set toolbariconsize=medium

" Toggle Toolbar Command Playing
function! g:Toggle_Toolbar_80th()
    if !exists('g:toolbar_80th_state')
        let g:toolbar_80th_state = 2
    endif
    aunmenu ToolBar.80th
    if g:toolbar_80th_state == 1
        let g:toolbar_80th_state = 2
        anoremenu icon=80th-enabled 960 ToolBar.80th :call g:Toggle_Toolbar_80th()<CR>
        set colorcolumn=80
        echo "On"
    else
        let g:toolbar_80th_state = 1
        anoremenu icon=80th-disabled 960 ToolBar.80th :call g:Toggle_Toolbar_80th()<CR>
        set colorcolumn=0
        echo "Off"
    endif
	tmenu ToolBar.80th 80th Column Indicator
endfunction

let g:toolbar_80th_state = 1
anoremenu icon=80th-disabled 960 ToolBar.80th :call g:Toggle_Toolbar_80th()<CR>
tmenu ToolBar.80th 80th Column Indicator




function! g:Toggle_Toolbar_Fold()
    if !exists('g:toolbar_fold_state')
        let g:toolbar_fold_state = 2
    endif
    aunmenu ToolBar.Fold
    if g:toolbar_fold_state == 1
        let g:toolbar_fold_state = 2
        anoremenu icon=fold-enabled 970 ToolBar.Fold :call g:Toggle_Toolbar_Fold()<CR>
        set foldcolumn=4
        echo "On"
    else
        let g:toolbar_fold_state = 1
        anoremenu icon=fold-disabled 970 ToolBar.Fold :call g:Toggle_Toolbar_Fold()<CR>
        set foldcolumn=0
        echo "Off"
    endif
	tmenu ToolBar.Fold Toggle Fold Column
endfunction

let g:toolbar_fold_state = 1
anoremenu icon=fold-disabled 970 ToolBar.Fold :call g:Toggle_Toolbar_Fold()<CR>
tmenu ToolBar.Fold Toggle Fold Column



set lcs+=tab:>-
function! g:Toggle_Toolbar_Hidden()
	if !exists('g:toolbar_hidden_state')
		let g:toolbar_hidden_state = 2
	endif
	aunmenu ToolBar.Hidden
	if g:toolbar_hidden_state == 1
		let g:toolbar_hidden_state = 2
		anoremenu icon=hidden-enabled 980 ToolBar.Hidden :call g:Toggle_Toolbar_Hidden()<CR>

		"set lcs+=eol:¶,tab:
		set lcs=tab:▸·,eol:¬,nbsp:_
		set isprint=
		syn match blort "[^[:print:]]"
		hi link blort NonText
		set list

		echo "On"
	else
		let g:toolbar_hidden_state = 1
		anoremenu icon=hidden-disabled 980 ToolBar.Hidden :call g:Toggle_Toolbar_Hidden()<CR>

		syn clear blort
		set isprint=@,~-159,161-255
		set nolist

		echo "Off"
	endif
	tmenu ToolBar.Hidden Toggle Hidden Chars
endfunction

let g:toolbar_hidden_state = 1
anoremenu icon=hidden-disabled 980 ToolBar.Hidden :call g:Toggle_Toolbar_Hidden()<CR>
tmenu ToolBar.Hidden Toggle Hidden Chars


function! g:Toggle_Toolbar_Cursor()
	if !exists('g:toolbar_cursor_state')
		let g:toolbar_cursor_state = 2
	endif
	aunmenu ToolBar.Cursor
	if g:toolbar_cursor_state == 1
		let g:toolbar_cursor_state = 2
		anoremenu icon=cursor-none 990 ToolBar.Cursor :call g:Toggle_Toolbar_Cursor()<CR>

		set nocursorcolumn
		set nocursorline

		echo "Off"
	elseif g:toolbar_cursor_state == 2
		let g:toolbar_cursor_state = 3
		anoremenu icon=cursor-horiz 990 ToolBar.Cursor :call g:Toggle_Toolbar_Cursor()<CR>

		set nocursorcolumn
		set cursorline

		echo "Line"
    else
		let g:toolbar_cursor_state = 1
		anoremenu icon=cursor-both 990 ToolBar.Cursor :call g:Toggle_Toolbar_Cursor()<CR>

		set cursorcolumn
		set cursorline

		echo "Line & Column"
	endif
	tmenu ToolBar.Cursor Change Cursor Highlighting
endfunction

let g:toolbar_cursor_state = 1
anoremenu icon=cursor-none 990 ToolBar.Cursor :call g:Toggle_Toolbar_Cursor()<CR>
tmenu ToolBar.Cursor Change Cursor Highlighting




" ¶ ˽
"


