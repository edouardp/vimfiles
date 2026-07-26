" Vim colorscheme based on the provided color palette
" cherryblossom.vim

set background=light
hi clear
if exists("syntax_on")
  syntax reset
endif

let g:colors_name = "cherryblossom"

" Define normal text
hi Normal       guifg=#343469 guibg=#e5e4ef

" Syntax highlighting
hi Comment      guifg=#9a9c2 cterm=italic guibg=#e5e4ef
hi Constant     guifg=#6f8db8 guibg=#e5e4ef
hi Identifier   guifg=#7c6380 guibg=#e5e4ef
hi Statement    guifg=#855d45 guibg=#e5e4ef
hi PreProc      guifg=#aa87a1 guibg=#e5e4ef
hi Type         guifg=#b3c2d4 guibg=#e5e4ef
hi Special      guifg=#bb9679 guibg=#e5e4ef
hi Underlined   guifg=#793c4d cterm=underline

" User interface elements
hi Cursor       guifg=#e5e4ef guibg=#6f8db8
hi LineNr       guifg=#9a9c2 guibg=#e5e4ef
hi MatchParen   guifg=#000000 guibg=#f6f8db
hi NonText      guifg=#9a9c2 guibg=#e5e4ef
hi StatusLine   guifg=#e5e4ef guibg=#343469
hi VertSplit    guifg=#e5e4ef guibg=#e5e4ef

" Highlight current line
hi CursorLine   guibg=#e5e4ef

" Pop-up menus
hi Pmenu        guifg=#343469 guibg=#e5e4ef
hi PmenuSel     guifg=#e5e4ef guibg=#343469

" Visual mode
hi Visual       guibg=#aa87a1

" Search
hi Search       guifg=#000000 guibg=#f6f8db

