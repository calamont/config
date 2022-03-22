" Keep highlighting but make it easier to clear
map <Leader><Leader> :nohlsearch<enter>

" Allow yanking and copying between vim and other programs
" This seems like it would be useful but I actually find it annoying
" that whatever is in my clipboard gets overwritten when I yank something
" else...
" set clipboard+=unnamedplus

" Change regex to very 'very magic' all the time
nnoremap / /\v
vnoremap / /\v
cnoremap %s/ %smagic/
cnoremap \>s/ \>smagic/
nnoremap :g/ :g/\v
nnoremap :g// :g//

" Autocomplete whole lines, useful for imports for new files in a project
inoremap <C-l> <C-x><C-l>

" Make yanking behaviour similar to deleting
nnoremap Y y$

" The below mappings allow you to select/yank/delete/change spans of alphanumeric
" text. This is particularly useful in python if you need to update part of a parameter
" name composed of many underscores (e.g. transformed_text_data)
nnoremap <Leader>u /\v[a-zA-Z0-9]*%#[a-zA-Z0-9]*<CR>:nohlsearch<CR>gn
nnoremap <Leader>yu /\v[a-zA-Z0-9]*%#[a-zA-Z0-9]*<CR>:nohlsearch<CR>gny
nnoremap <Leader>du /\v[a-zA-Z0-9]*%#[a-zA-Z0-9]*<CR>:nohlsearch<CR>gnd
nnoremap <Leader>cu /\v[a-zA-Z0-9]*%#[a-zA-Z0-9]*<CR>:nohlsearch<CR>gnc

" Quickly delete contents within brackets and place in insert mode for editing
" TODO: can we parameterise the bracket character to remove the repetition
" below? Perhaps a lightweight plugin would be useful.
nnoremap c] f]ci]
nnoremap c) f)ci)
nnoremap c} f}ci}

" The below commands will insert a blank line above and below the current line
nnoremap <silent><Leader>ll :set paste<CR>m`O<Esc>``:set nopaste<CR>
nnoremap <silent><Leader>hh :set paste<CR>m`o<Esc>``:set nopaste<CR>

" Remapping for trimming characters at the end of a line.
" - ma -> set mark for current position
" - $x -> jump to end of line and delete one character
" - `a -> return to original positino using the set mark
nnoremap <Leader>tr ma$x`a

" Remapping for moving the code/words that begin after column 80 to the line
" below
" - 80<Bar>   -> the equivalent of typing 80| - this goes to column 80
" - Wi<BS>    -> go to beginning of next word, and remove whitespace between
" - <CR><Esc> -> move remaining text on line to the line below and exit insert
nnoremap <Leader>j 80<Bar>Wi<BS><CR><Esc>

