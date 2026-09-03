"
"  Edouard Poor's global .vimrc file
"
"  Modified:      Wed Jun 26 10:16:31 NZST 1996
"  Last modified: Fri Mar 17 23:54:45 NZDT 2015
"

" -- Standard Header for Vundle based vimrc ----------------------------------

set nocompatible             		" be iMproved
filetype off                 		" required!



" -- Set PATH to include the directory where Node.js is installed ------------
"
let $PATH = "/Users/Edouard.Poor/.nvm/versions/node/v22.11.0/bin:" . $PATH


" -- Set up vim-plug ---------------------------------------------------------

call plug#begin('~/.vim/plugged')


" -- My bundles --------------------------------------------------------------

" Original repos on GitHub

Plug 'preservim/nerdtree', { 'on': 'NERDTreeToggle' }

" Don't want this any more
"Plug 'github/copilot.vim'

Plug 'edouardp/myob-colorscheme'

Plug 'edouardp/vim-q-connect'

Plug 'tpope/vim-fugitive'

Plug 'Xuyuanp/nerdtree-git-plugin'

Plug 'airblade/vim-gitgutter'

Plug 'dominikduda/vim_current_word'

"Plug 'dense-analysis/ale'

"Plug 'neoclide/coc.nvim', {'branch': 'release'}


Plug 'prabirshrestha/vim-lsp'
Plug 'mattn/vim-lsp-settings'


Plug 'mbbill/undotree'

Plug 'tpope/vim-obsession'


" FZF
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'


Plug 'itchyny/lightline.vim'

" needs to be last (certainly after NERDTree itself)
let g:webdevicons_enable_nerdtree = 1
let g:webdevicons_conceal_nerdtree_brackets = 1
let g:WebDevIconsUnicodeDecorateFolderNodes = 1
let g:DevIconsDefaultFolderOpenSymbol = '📂'
let g:WebDevIconsUnicodeDecorateFolderNodesDefaultSymbol = '📁'
let g:WebDevIconsNerdTreeAfterGlyphPadding = ' '
let g:WebDevIconsNerdTreeBeforeGlyphPadding = ''
let g:WebDevIconsNerdTreeGitPluginForceVAlign = 1
Plug 'ryanoasis/vim-devicons'


" Finish plugged
call plug#end()


" -- stuff

set laststatus=2

set noshowmode

set background=dark

set mouse=a



" Get rid of "|" in vertical splits
set fillchars=fold:-



" NERDTree
" Some good icons to use: ▸ ▾
"
let NERDTreeDirArrows=1
let g:NERDTreeDirArrowExpandable = ''
let g:NERDTreeDirArrowCollapsible = ''





" Lightline Configuration
"

function! GitStatusIndicator()
    " Check if the current file is in a Git repository
    if empty(FugitiveRepoDir())
        return ''
    endif

    " Get the status of the current file
    let l:status = system('git status --porcelain '.shellescape(expand('%')))
    let l:indicator = ''

    " Check for untracked files
    if l:status =~? '^??'
        let l:indicator .= 'U'
    endif

    " Check for modifications
    if l:status =~? '^[ MARC]'
        let l:indicator .= 'M'
    endif

    " Check for staged changes
    if l:status =~? '^[MARC]'
        let l:indicator .= 'S'
    endif

    return l:indicator
endfunction




function! LightlineGitGutter()
  if !get(g:, 'gitgutter_enabled', 0) || empty(FugitiveHead())
    return ''
  endif
  let [ l:added, l:modified, l:removed ] = GitGutterGetHunkSummary()
  if l:added == 0 && l:modified == 0 && l:removed == 0
    return ''
  endif
  return printf('+%d •%d –%d', l:added, l:modified, l:removed)
endfunction

function! LightlineBranch()
    let l:branch = FugitiveHead()
    if l:branch == ''
        return ''
    endif
    return ' ' . l:branch
endfunction





let g:lightline = {
      \ 'colorscheme': 'ayu_light',
      \ 'active': {
      \   'left': [ [ 'mode', 'paste' ],
      \             [ 'githunks', 'gitbranch', 'readonly', 'filename', 'modified' ] ]
      \ },
      \ 'component_function': {
      \   'gitbranch': 'LightlineBranch',
      \   'mode': 'LightlineMode',
      \   'readonly': 'LightlineReadonly',
      \   'githunks': 'LightlineGitGutter',
      \ },
      \ 'component': {
      \   'lineinfo': '%3l:%-2v%<',
      \ },
      \ 'subseparator': { 'left': '│', 'right': '│' },
      \ }


" │ ┃ ⏐ ║ ╎ ┆ ┊ ┋ ┇ ┋ ┇ ┊ ┆ ╎ ⏐ │
" ⦚ ︙ ︱ ︲ ︳ ︴ ︵ ︶ ︷ ︸
"
"   
"
"  󰖳    󰨡
" 
"  
"  
 
function! LightlineReadonly()
  return &readonly && &filetype !=# 'help' ? 'RO' : ''
endfunction

function! LightlineMode()
  return expand('%:t') =~# '^__Tagbar__' ? 'Tagbar':
        \ expand('%:t') ==# 'ControlP' ? 'CtrlP' :
        \ expand('%:t') =~? '^nerd_tree' ? 'NERDTree'.repeat(' ',80) :
        \ &filetype ==# 'unite' ? 'Unite' :
        \ &filetype ==# 'vimfiler' ? 'VimFiler' :
        \ &filetype ==# 'vimshell' ? 'VimShell' :
        \ lightline#mode()
endfunction


" Github Copilot Settings
"
imap <S-Tab> <Plug>(copilot-next)


" Set the status line to be 2 rows high
" 
set laststatus=2
set cmdheight=2



" Insert current date (cmd-/)
inoremap <D-/> <C-R>=strftime("%Y/%m/%d: ")<CR>
inoremap <T-/> <C-R>=strftime("%Y/%m/%d: ")<CR>

" Insert current time (cmd-option-/)
inoremap <D-¿> <C-R>=strftime("%+")<CR>

set tabstop=4
set softtabstop=4
set shiftwidth=4
set expandtab

" Viminfo
set history=1000
set viminfo='0,:1000,/50,h,n~/vimfiles/_viminfo

" Incremental Search on
set incsearch

" Updatetime (for things like Git Gutter)
set updatetime=900


if !empty($CMUX_WORKSPACE_ID)
  set keyprotocol=
  let &term = &term
endif

" Ctrl-P binding for FZF
"
let $FZF_DEFAULT_COMMAND = 'fd --type f --hidden --exclude .git --exclude .venv'
nnoremap <C-P> :call fzf#vim#files('', fzf#vim#with_preview('right'))<CR>



" Undotree
"
" UndoTree Customisation
if !exists('g:undotree_WindowLayout')
    let g:undotree_WindowLayout = 2
endif


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
  let g:gitgutter_sign_modified_removed = '•̅ '
  "let g:gitgutter_sign_modified_removed = '•̲ '
endif
if has("gui") && has("unix")
  let g:gitgutter_sign_modified         = '• '
  let g:gitgutter_sign_modified_removed = '•̅ '
  "let g:gitgutter_sign_modified_removed = '•̲ '
endif


" nerdtree-git-plugin NERDTree integration
"
let g:NERDTreeGitStatusIndicatorMapCustom = {
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



" -- vim_current_word --------------------------------------------------------
"

" Twins of word under cursor:
let g:vim_current_word#highlight_twins = 1
" The word under cursor:
let g:vim_current_word#highlight_current_word = 1

" Disable in NERDTree
" Can also be a list, e.g. NERD_tree_*,your_buffer_name.rb,*.js
autocmd BufAdd NERD_tree_* :let b:vim_current_word_disabled_in_this_buffer = 1

hi CurrentWordTwins guibg=#800080 gui=bold ctermbg=61
hi CurrentWord      guibg=#800080 gui=bold ctermbg=61


" -- ALE --------------------------------------------------------------------
"
let g:ale_linters = {'python': ['ruff']}
let g:ale_sign_error = '🛑'
let g:ale_sign_warning = '⚠️'
let g:ale_sign_info = 'ℹ️'

highlight link ALEErrorSign SignColumn
highlight link ALEWarningSign SignColumn
highlight link ALEInfoSign SignColumn

highlight ALEVirtualTextError   guibg=#2e3e4f guifg=#788490 gui=italic
highlight ALEVirtualTextWarning guibg=#2e3e4f guifg=#788490 gui=italic
highlight ALEVirtualTextInfo    guibg=#2e3e4f guifg=#788490 gui=italic



" -- Git Grep ---------------------------------------------------------------
"
command! -bang -nargs=* GGrep
  \ call fzf#vim#grep(
  \   'git grep --line-number -- '.fzf#shellescape(<q-args>),
  \   fzf#vim#with_preview({'dir': systemlist('git rev-parse --show-toplevel')[0]}), <bang>0)


" -- Session Management -----------------------------------------------------
"

" Start Obsession when opening the specific file ~/notes
autocmd BufReadPost ~/notes Obsession

" Start Obsession when editing any file under ~/myob/
autocmd BufReadPost * if expand('%:p') =~# '^' . expand('~/myob/') | Obsession | endif


" -- Send to Terminal -------------------------------------------------------
"

" Source the commands
source ~/.vim/send-to-terminal.vim



" -- Make the Mousewheel Scrolling a little less frantic --------------------
"

" Normal mode:
nnoremap <ScrollWheelUp>   <C-Y>
nnoremap <ScrollWheelDown> <C-E>

" Insert mode:
inoremap <ScrollWheelUp>   <C-O><C-Y>
inoremap <ScrollWheelDown> <C-O><C-E>

" Visual mode:
vnoremap <ScrollWheelUp>   <C-Y>
vnoremap <ScrollWheelDown> <C-E>

" Save in any mode
nnoremap <T-s> :w<CR>
xnoremap <T-s> :<C-U>w<CR>gv
snoremap <T-s> <C-G>:<C-U>w<CR>gv
inoremap <T-s> <C-O>:w<CR>

" Copy to system buffer in visual mode
vnoremap <T-c> "*y


highlight GitGutterAdd          ctermfg=10     ctermbg=237 guifg=Green  guibg=#2e3e4f
highlight GitGutterChange       ctermfg=11     ctermbg=237 guifg=Orange guibg=#2e3e4f
highlight GitGutterDelete       ctermfg=Red    ctermbg=237 guifg=Red    guibg=#2e3e4f
highlight GitGutterChangeDelete ctermfg=Red    ctermbg=237 guifg=Red    guibg=#2e3e4f
highlight SignColumn                           ctermbg=237              guibg=#2e3e4f



" -- Quickfix Windows doesn't wrap -------------------------------------------
"
autocmd FileType qf setlocal nowrap



map [1;2B :cn<CR>
map [1;2A :cprev<CR>
map [1;3B :cn<CR>
map [1;3A :cprev<CR>


" -- Fix Unicode Widths on macOS
"

" ⚠️ ℹ️
call setcellwidths([[0x26A0, 0x26A0, 2],[0x2139, 0x2139, 2]])


" -- Terminal CursorLine and CursorColumn highlighting -----------------------
"
hi CursorLine   cterm=None ctermbg=240
hi CursorColumn cterm=None ctermbg=240
hi CursorLineNr cterm=None ctermbg=240


" -- Update the terminal window title ----------------------------------------
"
set title
set titlestring=Vim


" -- Temporary hack to preview markdown files --------------------------------
"
noremap K :!uvx frogmouth %<CR>



" -- vim-lsp Settings --
"
"let g:lsp_document_code_action_signs_hint = {'text': '✨'}
let g:lsp_document_code_action_signs_hint = {'text': '🌟'}

let g:lsp_settings = {
\   'yaml-language-server': {
\     'workspace_config': {
\       'yaml': {
\         'customTags': [
\           '!Ref',
\           '!Sub scalar',
\           '!Sub sequence',
\           '!Join sequence',
\           '!FindInMap sequence',
\           '!GetAtt scalar',
\           '!GetAtt sequence',
\           '!GetAZs',
\           '!ImportValue',
\           '!Select sequence',
\           '!Split sequence',
\           '!Condition',
\           '!If sequence',
\           '!Not sequence',
\           '!Equals sequence',
\           '!And sequence',
\           '!Or sequence',
\           '!Base64',
\           '!Cidr sequence',
\           '!Transform mapping'
\         ],
\         'schemas': {
\           'https://raw.githubusercontent.com/awslabs/goformation/master/schema/cloudformation.schema.json': '/*.template.yaml'
\         }
\       }
\     }
\   }
\ }

