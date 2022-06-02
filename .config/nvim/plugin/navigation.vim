" IMPROVED NAVIGATION AROUND VIM
" Moving around panes more easily"
map <C-h> <C-w>h
map <C-l> <C-w>l
map <C-k> <C-w>k
map <C-j> <C-w>j

" Make moving around eiser for colemak layout
" nnoremap l gk
" nnoremap j h
" nnoremap k l
" nnoremap h gj
" nnoremap <bslash> <space>

" vnoremap l gk
" vnoremap h gj
" vnoremap j h
" vnoremap k l
" vnoremap <bslash> <space>

" Scroll down keeping cursor in place
" nnoremap <C-c> <C-e>
" Limit lines <C-u> and <C-d> jump
" set scroll=10

" Move forward and back jumps
" nnoremap <c-i> <c-i>
" nnoremap <c-e> <c-o>

" todo: the below would be useful for quickly jumping between functions but it
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
