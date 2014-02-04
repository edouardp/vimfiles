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
Bundle 'edouardp/folde'
Bundle 'tpope/vim-characterize'

if !has("gui_win32")        " Not supported on Windows out of the box
Bundle 'Valloric/YouCompleteMe'
endif



" -- Standard Header for Vundle based vimrc ----------------------------------

filetype plugin indent on     " required!


" -- Custom Stuff (to move to a seperate file) -------------------------------

" Viminfo
set history=1000
set viminfo='0,:1000,/50,h,n~/vimfiles/_viminfo
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

" Tagbar
let g:tagbar_ctags_bin = "c:\\Users\\edouardp.ZEACOMDEV\\bin\\ctags.exe"
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



" NERDTree
let NERDTreeDirArrows=1

" Stat in home dir
cd ~


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

let g:tagbar_ctags_bin = "/usr/local/bin/ctags"


