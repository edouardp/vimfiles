" Vim colorscheme with a dark theme based on the provided train station color palette
" station_dark.vim

set background=dark
hi clear
if exists("syntax_on")
  syntax reset
endif

let g:colors_name = "station_dark"

" Define normal text
hi Normal       guifg=#dad5d4 guibg=#464442

" Syntax highlighting
hi Comment      guifg=#a77773 guibg=#464442 cterm=italic
hi Constant     guifg=#c1f73a guibg=#464442
hi Identifier   guifg=#efbb25 guibg=#464442
hi Statement    guifg=#999395 guibg=#464442
hi PreProc      guifg=#f1ce71 guibg=#464442
hi Type         guifg=#514e52 guibg=#464442
hi Special      guifg=#bc9fa9 guibg=#464442

" User interface elements
hi Cursor       guifg=#464442 guibg=#dad5d4
hi LineNr       guifg=#a77773 guibg=#464442
hi MatchParen   guifg=#dad5d4 guibg=#a77773
hi NonText      guifg=#a77773 guibg=#464442
hi StatusLine   guifg=#dad5d4 guibg=#464442
hi VertSplit    guifg=#dad5d4 guibg=#464442

" Highlight current line
hi CursorLine   guibg=#3f3f3f

" Pop-up menus
hi Pmenu        guifg=#dad5d4 guibg=#3f3f3f
hi

