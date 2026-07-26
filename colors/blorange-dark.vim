" Vim colorscheme with a dark theme based on the provided cityscape color palette
" cityscape_dark.vim

set background=dark
hi clear
if exists("syntax_on")
  syntax reset
endif

let g:colors_name = "cityscape_dark"

" Define normal text
hi Normal       guifg=#e4e1d9 guibg=#232222

" Syntax highlighting
hi Comment      guifg=#2b3d47 guibg=#232222 cterm=italic
hi Constant     guifg=#06aabd guibg=#232222
hi Identifier   guifg=#17a37 guibg=#232222
hi Statement    guifg=#0f5bdc guibg=#232222
hi PreProc      guifg=#1f8d5b guibg=#232222
hi Type         guifg=#c5a4a1 guibg=#232222
hi Special      guifg=#f6cf9a guibg=#232222

" User interface elements
hi Cursor       guifg=#232222 guibg=#e4e1d9
hi LineNr       guifg=#2b3d47 guibg=#232222
hi MatchParen   guifg=#e4e1d9 guibg=#f6cf9a
hi NonText      guifg=#2b3d47 guibg=#232222
hi StatusLine   guifg=#e4e1d9 guibg=#0f5bdc
hi VertSplit    guifg=#e4e1d9 guibg=#232222

" Highlight current line
hi CursorLine   guibg=#2b3d47

" Pop-up menus
hi Pmenu        guifg=#e4e1d9 guibg=#2b3d47
hi PmenuSel     guifg=#e4e1d9 guibg=#06aabd

" Visual mode
hi Visual       guibg=#0f5bdc

" Search
hi Search       guifg=#232222 guibg=#f6cf9a

