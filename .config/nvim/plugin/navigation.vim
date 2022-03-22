" IMPROVED NAVIGATION AROUND VIM
" Moving around panes more easily"
map <C-m> <C-w>h
map <C-o> <C-w>l
map <C-l> <C-w>k
map <C-h> <C-w>j

" Make moving around eiser for colemak layout
nnoremap l gk
nnoremap j h
nnoremap k l
nnoremap h gj
nnoremap <bslash> <space>

vnoremap l gk
vnoremap h gj
vnoremap j h
vnoremap k l
vnoremap <bslash> <space>

" Scroll down keeping cursor in place
nnoremap <C-c> <C-e>
" Limit lines <C-u> and <C-d> jump
" set scroll=10

" Move forward and back jumps
nnoremap <C-i> <C-i>
nnoremap <C-e> <C-o>

" TODO: The below would be useful for quickly jumping between functions but it
" isn't remapping for some reason
nnoremap [f [m
nnoremap ]f ]m

" For quickly switching between buffers
nnoremap ]b :bnext<CR>
nnoremap [b :bprevious<CR>
nnoremap <Leader>bb <C-^>                        " jump back to previous buffer

" Open and cycle through quickfix list
nnoremap <C-q> :copen<CR>
nnoremap <C-]> :cn<CR>
nnoremap <C-[> :cp<CR>
