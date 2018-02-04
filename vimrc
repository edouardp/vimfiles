"
"  Edouard Poor's global .vimrc file
"
"  Modified:      Wed Jun 26 10:16:31 NZST 1996
"  Last modified: Fri Mar 17 23:54:45 NZDT 2015
"

" -- Standard Header for Vundle based vimrc ----------------------------------

set nocompatible             		" be iMproved
filetype off                 		" required!


" -- Workaround for MacVim/pyenv/brew interactions ---------------------------

"if has('gui_macvim')
    let $PYTHONHOME=/Users/edouard.poor/.pyenv/versions/3.6.4/
    set pythonthreedll=/usr/local/Cellar/python3/3.6.4_2/Frameworks/Python.framework/Versions/3.6/lib/libpython3.6m.dylib
"endif


" -- Set up Vundle -----------------------------------------------------------

set rtp+=~/vimfiles/bundle/Vundle.vim/
call vundle#rc("~/vimfiles/bundle")
Bundle 'VundleVim/Vundle.vim'


" -- My bundles --------------------------------------------------------------

" Original repos on GitHub
Bundle 'tpope/vim-fugitive'
Bundle 'gregsexton/gitv'
Bundle 'edouardp/vim-railscasts-theme'
Bundle 'edouardp/myob-colorscheme'
Bundle 'bling/vim-airline'
Bundle 'vim-airline/vim-airline-themes'
Bundle 'edouardp/myob-airline-theme'
"Bundle 'nathanaelkane/vim-indent-guides'
Bundle 'Yggdroot/indentLine'
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
Bundle 'dr-chip-vim-scripts/ZoomWin'
Bundle 'jeetsukumaran/vim-buffergator'
Bundle 'jmcantrell/vim-virtualenv'
Bundle 'ivanov/vim-ipython'
Bundle 'edouardp/arrowmapper'
Bundle 'qstrahl/vim-matchmaker'
Bundle 'natw/keyboard_cat.vim'
Bundle 'edouardp/scorsese'
if v:version > 704 || v:version == 704 && has("patch1906")
  Bundle 'ramele/agrep'
endif
Bundle 'kshenoy/vim-signature'
Bundle 'posva/vim-vue'
Bundle 'dracula/vim'
Bundle 'chrisbra/Colorizer'
Bundle 'OrangeT/vim-csharp'
Bundle 'isRuslan/vim-es6'

" Trying Sparkup
Plugin 'rstacruz/sparkup'

if !has("gui_win32")        " Not supported on Windows out of the box
"Bundle 'Valloric/YouCompleteMe'
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
set shiftwidth=4

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
inoremap <D-÷> <C-R>=strftime("%H:%M:%S ")<CR>
"inoremap <D-¿> <C-R>=strftime("%a %b %m %H:%M:%S %Z %Y")<CR>
inoremap <D-¿> <C-R>=strftime("%+")<CR>

" up/down key support for completion menu
inoremap <Up> <C-R>=pumvisible() ? "\<lt>C-P>" : "\<lt>Up>"<CR>
inoremap <Down> <C-R>=pumvisible() ? "\<lt>C-N>" : "\<lt>Down>"<CR>

" Always enable fold column (and make space for it)
"set columns=84
set foldcolumn=4

" Colourscheme
colorscheme railscasts

" gx command selects word (including ?query=blah part)
let g:netrw_gx="<cWORD>"


" Updatetime (for things like Git Gutter)
set updatetime=900


" Tagbar Customisation
if has("gui_win32")         " Binaries live in different places for now
  let g:tagbar_ctags_bin = expand('~/bin/ctags.exe')
else
  let g:tagbar_ctags_bin = 'ctags'
endif
let g:tagbar_iconchars = ['▸','▾']


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

" Disabled for now
"au BufEnter * exec "inoremap <silent> " . g:UltiSnipsExpandTrigger . " <C-R>=g:UltiSnips_Complete()<cr>"
"let g:UltiSnipsJumpForwardTrigger="<tab>"
"let g:UltiSnipsListSnippets="<c-e>"


" Ctrl-P Customisation
let g:ctrlp_max_files=0
let g:ctrlp_cache_dir=expand("~/.vimfiles/.ctrlp_cache")


" NERDTree
let NERDTreeDirArrows=1
let g:NERDTreeDirArrowExpandable = '▸'
"let g:NERDTreeDirArrowExpandable = '▸ 📂'
let g:NERDTreeDirArrowCollapsible = '▾'
"let g:NERDTreeDirArrowCollapsible = '▾ 📂'


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

" Airline Hunks Customisation
let g:airline#extensions#hunks#hunk_symbols = ['+', '•', '-']

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

let g:airline_symbols.linenr = '📋'
let g:airline_symbols.whitespace = '🔥'

let g:airline_powerline_fonts = 1
set encoding=utf-8


" Folde Customisation
"
let g:folde_style = 'simple'


" Git Gutter Customisation
"
let g:gitgutter_override_sign_column_highlight = 0
let g:gitgutter_sign_added              = '+ '
let g:gitgutter_sign_removed            = '_ '
if has("gui_macvim")
  " let g:gitgutter_sign_modified         = '◦ '
  " let g:gitgutter_sign_modified_removed = '⍛ '
  " let g:gitgutter_sign_modified         = '◇ '
  " let g:gitgutter_sign_modified_removed = '⍚ '
  let g:gitgutter_sign_modified         = '● '
  "let g:gitgutter_sign_modified_removed = '●-'
  let g:gitgutter_sign_modified_removed = '●—'
else
  " let g:gitgutter_sign_modified         = '● '
  " let g:gitgutter_sign_modified_removed = '● '
  let g:gitgutter_sign_modified         = '• '
  let g:gitgutter_sign_modified_removed = '•̲ '
endif
if has("gui") && has("unix")
  let g:gitgutter_sign_modified         = '• '
  let g:gitgutter_sign_modified_removed = '•̲ '
endif


" Virtualenv Support
let g:virtualenv_directory = '~/py'
let g:airline#extensions#virtualenv#enabled = 1


" Center cursor on screen while scrolling
"set scrolloff=999


" sparkup mappings
let g:sparkupExecuteMapping='<D-CR>'
let g:sparkupNextMapping='<tab>'

