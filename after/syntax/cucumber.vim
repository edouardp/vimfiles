if exists("b:cucumber_after_loaded") | finish | endif
let b:cucumber_after_loaded = 1
echom "🍏 cucumber after syntax LOADED"

" 1) Clear the stock Cucumber """…""" region
silent! syntax clear cucumberGivenString

" 1) Update the region to contain placeholders too:
silent! syntax clear cucumberGivenString
syntax region cucumberGivenString
      \ transparent
      \ start=/^\s*"""\s*$/
      \ end=/^\s*"""\s*$/
      \ keepend skipempty
      \ contains=cucumberHttpLine,cucumberJsonBlock,cucumberPlaceholder

" 2) Define placeholders (two simple matches)
syntax match cucumberPlaceholder containedin=cucumberGivenString /\[\[[^]]\+\]\]/
syntax match cucumberPlaceholder containedin=cucumberGivenString /\{\{[^}]\+\}\}/

" 3) Highlight them in bold orange (GUI) / yellow (cterm)
highlight cucumberPlaceholder gui=bold guifg=#FFA500 ctermfg=Yellow cterm=bold
