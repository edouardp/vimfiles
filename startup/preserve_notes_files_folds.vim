:augroup preserve_notes_file_folds
:    autocmd!
:    autocmd BufRead /Users/edouard.poor/notes :silent loadview
:    autocmd BufWrite /Users/edouard.poor/notes :mkview
:augroup END
