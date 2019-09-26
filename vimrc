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

if has('gui_macvim')
   "set pythonthreedll=/x
    "let $PYTHONHOME=/Users/edouard.poor/.pyenv/versions/3.6.4/
    "set pythonthreedll=/usr/local/Cellar/python3/3.6.4_2/Frameworks/Python.framework/Versions/3.6/lib/libpython3.6m.dylib
endif


" -- set pyenv version -------------------------------------------------------

let $PYENV_VERSION="3.6.4"


" -- Set up vim-plug ---------------------------------------------------------

call plug#begin('~/vimfiles/plugged')


" -- My bundles --------------------------------------------------------------

" Original repos on GitHub
Plug 'tpope/vim-fugitive'
Plug 'gregsexton/gitv'
Plug 'edouardp/vim-railscasts-theme'
Plug 'edouardp/myob-colorscheme'
Plug 'bling/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'edouardp/myob-airline-theme'
Plug 'Yggdroot/indentLine'
Plug 'SirVer/ultisnips'
Plug 'nelstrom/vim-visual-star-search'
Plug 'scrooloose/nerdtree'
Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'kien/tabman.vim'
Plug 'PProvost/vim-ps1'
Plug 'majutsushi/tagbar'
Plug 'edouardp/folde'
Plug 'tpope/vim-characterize'
Plug 'edouardp/ps1-ultisnips'
Plug 'mbbill/undotree'
Plug 'istepura/vim-toolbar-icons-silk'
Plug 'airblade/vim-gitgutter'
Plug 'edouardp/ttbar'
Plug 'dr-chip-vim-scripts/ZoomWin'
Plug 'jeetsukumaran/vim-buffergator'
Plug 'jmcantrell/vim-virtualenv'
Plug 'ivanov/vim-ipython'
Plug 'edouardp/arrowmapper'
Plug 'qstrahl/vim-matchmaker'
Plug 'natw/keyboard_cat.vim'
Plug 'edouardp/scorsese'
Plug 'ramele/agrep'
Plug 'kshenoy/vim-signature'
Plug 'posva/vim-vue'
Plug 'dracula/vim'
Plug 'chrisbra/Colorizer'
Plug 'OrangeT/vim-csharp'
Plug 'isRuslan/vim-es6'
Plug 'vim-python/python-syntax'

Plug 'tpope/vim-cucumber'

" FZF
Plug 'junegunn/fzf.vim'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }

" Pyenv Support
Plug 'lambdalisue/vim-pyenv'

" Coverage Reporting for Python
Plug 'alfredodeza/coveragepy.vim'

Plug 'kien/rainbow_parentheses.vim'

Plug 'ap/vim-css-color'

"Bundle 'severin-lemaignan/vim-minimap'


" defaults have to be set *before* loading the plugin
" Nah, that does work either. This is a mess.
let g:webdevicons_enable_nerdtree = 1
let g:webdevicons_conceal_nerdtree_brackets = 1
let g:WebDevIconsUnicodeDecorateFolderNodes = 1
let g:DevIconsDefaultFolderOpenSymbol = '📂'
let g:WebDevIconsUnicodeDecorateFolderNodesDefaultSymbol = '📁'
let g:WebDevIconsNerdTreeAfterGlyphPadding = ' '
let g:WebDevIconsNerdTreeBeforeGlyphPadding = ''
let g:WebDevIconsNerdTreeGitPluginForceVAlign = 1
Plug 'ryanoasis/vim-devicons'
"NERDTreeToggle
"call webdevicons#softRefresh()
"NERDTreeToggle

" Trying Sparkup
Plug 'rstacruz/sparkup'

" Trying Expand Region
Plug 'terryma/vim-expand-region'

" Coc
Plug 'neoclide/coc.nvim', {'branch': 'release'}

if !has("gui_win32")        " Not supported on Windows out of the box
"Bundle 'Valloric/YouCompleteMe'
endif


" -- Initialize plugin system ------------------------------------------------

call plug#end()


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
"let g:tagbar_iconchars = ['','']
"let g:tagbar_iconchars = ['▸','▾']
let g:tagbar_iconchars = ['','']


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
" let g:ctrlp_max_files=0
" let g:ctrlp_cache_dir=expand("~/.vimfiles/.ctrlp_cache")


" Ctrl-P binding for FZF
"
"nnoremap <C-P> :botright FZF<CR>
nnoremap <C-P> :call fzf#vim#files('', fzf#vim#with_preview('right'))<CR>


" NERDTree
let NERDTreeDirArrows=1
"let g:NERDTreeDirArrowExpandable = ''
let g:NERDTreeDirArrowExpandable = '▸'
let g:NERDTreeDirArrowExpandable = ''
"let g:NERDTreeDirArrowExpandable = '▸ 📂'
"let g:NERDTreeDirArrowCollapsible = ''
let g:NERDTreeDirArrowCollapsible = '▾'
let g:NERDTreeDirArrowCollapsible = ''
"let g:NERDTreeDirArrowCollapsible = '▾ 📂'


" Start in home dir
cd ~


" Additional tagbar mappings
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
let g:airline_symbols.branch = ''
let g:airline_symbols.readonly = ''
let g:airline_symbols.linenr = ''

let g:airline_symbols.linenr = '📋'
let g:airline_symbols.linenr = ''
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
"
let g:sparkupExecuteMapping='<D-CR>'
let g:sparkupNextMapping='<tab>'


" MYOB Theme
"
colorscheme myob
let g:airline_theme='myob'


" IndentLine conceal char
"
let g:indentLine_char = '┊'
set concealcursor=c


" Devicons overrides
"
let g:WebDevIconsUnicodeDecorateFileNodesExtensionSymbols = {} " needed
let g:WebDevIconsUnicodeDecorateFileNodesExtensionSymbols['vue'] = 'v'
let g:WebDevIconsUnicodeDecorateFileNodesExactSymbols = {}
let g:WebDevIconsUnicodeDecorateFileNodesExactSymbols['node_modules'] = '📂'

let g:webdevicons_enable_nerdtree = 1
let g:webdevicons_conceal_nerdtree_brackets = 1
let g:WebDevIconsUnicodeDecorateFolderNodes = 1
let g:DevIconsDefaultFolderOpenSymbol = '📂'
let g:WebDevIconsUnicodeDecorateFolderNodesDefaultSymbol = '📁'
let g:WebDevIconsNerdTreeAfterGlyphPadding = ' '
let g:WebDevIconsNerdTreeBeforeGlyphPadding = ''
let g:WebDevIconsNerdTreeGitPluginForceVAlign = 1


" nerdtree-git-plugin NERDTree integration
"
let g:NERDTreeIndicatorMapCustom = {
    \ "Modified"  : "•",
    \ "Staged"    : "",
    \ "Untracked" : "",
    \ "Renamed"   : "➜",
    \ "Unmerged"  : "",
    \ "Deleted"   : "-",
    \ "Dirty"     : "•",
    \ "Clean"     : "✔︎",
    \ "Ignored"   : " ",
    \ "Unknown"   : "?"
    \ }


" Grep with preview
"
command! -bang -nargs=* Rg
  \ call fzf#vim#grep(
  \   'rg --column --line-number --no-heading --color=always --smart-case '.shellescape(<q-args>), 1,
  \   <bang>0 ? fzf#vim#with_preview('up:60%')
  \           : fzf#vim#with_preview('right:50%', '?'),
  \   <bang>0)

"noremap <C-P> :call fzf#vim#grep('rg --column --line-number --no-heading --color=always --smart-case *', 1, fzf#vim#with_preview('right:50%', '?'), 0)<CR>




" Send selection to terminal
"
"   WIP
"
function! Find_terminal()
    redir => buffers_output
    execute('silent ls')
    redir END
    let l:buffers_output_rows = split(l:buffers_output, "\n")
    for l:buffers_output_row in l:buffers_output_rows
        let l:parts = matchlist(l:buffers_output_row, '^\s*\(\d\+\)\(.....\) "\(.*\)"')
        if l:parts[2][3] == "R"
            return 0 + l:parts[1]
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
    let w = Find_terminal()
    if w != 0
        call term_sendkeys(w, t) 
    endif
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
    let w = Find_terminal()
    if w != 0
        call term_sendkeys(w, t) 
    endif
endfun
vnoremap <C-s> :<C-U>call Send_Selection_To_Terminal()<CR>

function! Find_terminal()
    redir => buffers_output
    execute('silent ls')
    redir END
    let l:buffers_output_rows = split(l:buffers_output, "\n")
    for l:buffers_output_row in l:buffers_output_rows
        let l:parts = matchlist(l:buffers_output_row, '^\s*\(\d\+\)\(.....\) "\(.*\)"')
        if l:parts[2][3] == "R"
            return 0 + l:parts[1]
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
    let w = Find_terminal()
    if w != 0
        call term_sendkeys(w, t) 
    endif
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
    let w = Find_terminal()
    if w != 0
        call term_sendkeys(w, t) 
    endif
endfun
vnoremap <C-s> :<C-U>call Send_Selection_To_Terminal()<CR>

" clear
" ls
" find ~/Downloads
"



" https://github.com/numirias/security/blob/master/doc/2019-06-04_ace-vim-neovim.md
"
" Security Hole (keep till running patched vim)
"
" Or, keep it off forever. I've literally never user this in the last
" 25 years, so maybe I won't want to in the next 25.
"
set modelines=0
set nomodeline


" Load special augroup for auto saving/loading my folds from 'notes'
"
let s:current_script_path = expand('<sfile>')
"exec "source " . s:current_script_path . "/startup/" . "notes-folding.vim"
exec "source " . "~/vimfiles/startup/" . "preserve_notes_files_folds.vim"


" Temp fix for Vim setting wrong .vue filetype
"
autocmd FileType vuejs set filetype=vue


" Load additional startup *.vim files
"
runtime! startup/*.vim




