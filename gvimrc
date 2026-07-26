

"vertical seperator fill char
set fillchars=vert:\ ,fold:-

"turn on toolbar
set toolbar=icons,tooltips
set toolbariconsize=medium
set guioptions+=T

if has("gui_macvim")
  " Zoom
  map <D-y> :macaction performZoom:<CR>

  " Fullscreen options
  set fuoptions=maxvert,maxhorz

  " Cheese
  set transparency=5
  set blurradius=16
endif


" IndentLine Conceal colour
"
let g:indentLine_color_gui='Grey25'


" Terminal Shortcut
"
map <D-Bar> :botright terminal ++close ++rows=12<CR>


" Set the GUI font
"
set guifont=DejaVuSansMNFM:h14


" Set the colorscheme
"
colorscheme myob
set background=dark


" set vertical fillchar color to white in gui
" 
highlight VertSplit ctermfg=white ctermbg=black cterm=NONE



