" TODO: could create some lua function that will/won't hightlight columns (and
" other things that are useful for programming) after 80 if a file without a programming
" extension (i.e. .txt, .md, .log)
let &colorcolumn=join(range(80,400),",")        " highlight columns after 80
" set highlight+=c:LineNr                          " highlight line number differently - doesn't work on neovim
" Set line numbers as default in files and netrw
" setlocal number

" Scroll before getting to the bottom of the screen **doesn't seem to be
" working in python!
set scrolloff=8

setlocal showmatch                               " highlight matching paren

setlocal cursorline                              " highlight line cursor is on

" Set the compiler to lint. Define a mapping to run it silently and then open
" quickfix window
 " compiler python
 " nnoremap <buffer> <leader>li :silent make --exclude=build,tests<CR> <Bar>:redraw!<CR>:cw 20<CR>
 " nnoremap <buffer> <leader>li :silent make --rcfile=~/Desktop/tms/transaction-monitoring/api/configs/.pylintrc *.py<CR> <Bar>:redraw!<CR>:cw 20<CR>
