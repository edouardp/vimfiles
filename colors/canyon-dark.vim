" Vim colorscheme with a dark theme based on the provided color palette
" canyon_dark.vim

set background=dark
hi clear
if exists("syntax_on")
  syntax reset
endif

let g:colors_name = "canyon_dark"

" Define normal text with the provided dark color as the background
hi Normal       guifg=#edbe9a guibg=#250807

" Syntax highlighting
hi Comment      guifg=#75565f guibg=#250807 cterm=italic
hi Constant     guifg=#cb6a3e guibg=#250807
hi Identifier   guifg=#714d50 guibg=#250807
hi Statement    guifg=#956c70 guibg=#250807
hi PreProc      guifg=#d18d7c guibg=#250807
hi Type         guifg=#b79499 guibg=#250807
hi Special      guifg=#994627 guibg=#250807
hi Underlined   guifg=#5b3c43 cterm=underline

" User interface elements
hi Cursor       guifg=#250807 guibg=#edbe9a
hi LineNr       guifg=#75565f guibg=#250807
hi MatchParen   guifg=#edbe9a guibg=#5b3c43
hi NonText      guifg=#75565f guibg=#250807
hi StatusLine   guifg=#edbe9a guibg=#714d50
hi VertSplit    guifg=#edbe9a guibg=#250807

" Highlight current line
hi CursorLine   guibg=#340807

" Pop-up menus
hi Pmenu        guifg=#edbe9a guibg=#340807
hi PmenuSel     guifg=#340807 guibg=#edbe9a

" Visual mode
hi Visual       guibg=#7a331b

" Search
hi Search       guifg=#250807 guibg=#cb6a3e

