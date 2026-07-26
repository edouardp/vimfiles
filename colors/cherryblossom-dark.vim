" Vim colorscheme with a dark theme based on the provided color palette
" cherryblossom_dark.vim

set background=dark
hi clear
if exists("syntax_on")
  syntax reset
endif

let g:colors_name = "cherryblossom_dark"

" Define normal text with the dark brown as the background
hi Normal       guifg=#e5e4ef guibg=#3f2329

" Syntax highlighting
hi Comment      guifg=#c9a5be cterm=italic guibg=#3f2329
hi Constant     guifg=#6f8db8 guibg=#3f2329
hi Identifier   guifg=#7c6380 guibg=#3f2329
hi Statement    guifg=#aa87a1 guibg=#3f2329
hi PreProc      guifg=#97a9c2 guibg=#3f2329
hi Type         guifg=#bb9679 guibg=#3f2329
hi Special      guifg=#855d45 guibg=#3f2329
hi Underlined   guifg=#f6f8db cterm=underline

" User interface elements
hi Cursor       guifg=#3f2329 guibg=#e5e4ef
hi LineNr       guifg=#c9a5be guibg=#3f2329
hi MatchParen   guifg=#f6f8db guibg=#3f2329
hi NonText      guifg=#c9a5be guibg=#3f2329
hi StatusLine   guifg=#e5e4ef guibg=#7c6380
hi VertSplit    guifg=#e5e4ef guibg=#3f2329

" Highlight current line
hi CursorLine   guibg=#342329

" Pop-up menus
hi Pmenu        guifg=#e5e4ef guibg=#342329
hi PmenuSel     guifg=#342329 guibg=#e5e4ef

" Visual mode
hi Visual       guibg=#7c6380

" Search
hi Search       guifg=#3f2329 guibg=#f6f8db

