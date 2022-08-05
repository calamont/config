" A grave yard of old vim commands that I still consider useful. These have
" been removed because of improvements of the sensible defaults in neovim,
" obselessence from a plugin (i.e. Telescope), or they no longer fit my
" workflow. However, all of these could be useful to others (or myself in the
" future). I leaving these here for future learnings.

" Search down into folders. Provides tab-completion for all file-related tasks
" ---------------------------------------------------------------------------------------
" set path+=**

" If in git repo then move to the working tree root to assist with fuzzy
" searching
" TODO: check if Telescope does this by default. If so we could probably
" remove this
" ---------------------------------------------------------------------------------------
" let dirRoot = system("git rev-parse --show-toplevel")
" if (dirRoot =~ 'fatal') || (strlen(dirRoot) == 0)
"     let dirRoot = system("echo $PWD")
" endif
" execute ':cd ' . dirRoot

" Dont show certain filetypes when tab auto-completing
" ---------------------------------------------------------------------------------------
" set wildignore+=*.bmp,*.gif,*.ico,*.jpg,*.png,*.ico
" set wildignore+=*.pdf,*.psd
" set wildignore+=*.pyc

" Make yanking behaviour similar to deleting.
" This is now a default mapping in neovim. See :help default-mappings
" ---------------------------------------------------------------------------------------
" nnoremap Y y$

" Allow yanking and copying between vim and other programs
" This seems like it would be useful but I actually find it annoying
" that whatever is in my clipboard gets overwritten when I yank something
" else...
" ---------------------------------------------------------------------------------------
" set clipboard+=unnamedplus

" The remaps make additional features very magic, but I don't know what all of
" these do, so have removed them from my config.
" ---------------------------------------------------------------------------------------
" cnoremap \>s/ \>smagic/
" nnoremap :g/ :g/\v
" nnoremap :g// :g//

" The below mappings allow you to select/yank/delete/change spans of alphanumeric
" text. This is useful in snake cased languades (i.e. Python) if you need to update
" part of a parameter name composed of many underscores (e.g. transformed_text_data)
" I have switched these off for now. It feels like a crutch, and the same
" functionality can be handled with normal Vim motions.
" ---------------------------------------------------------------------------------------
" nnoremap <Leader>u /\v[a-zA-Z0-9]*%#[a-zA-Z0-9]*<CR>:nohlsearch<CR>gn
" nnoremap <Leader>yu /\v[a-zA-Z0-9]*%#[a-zA-Z0-9]*<CR>:nohlsearch<CR>gny
" nnoremap <Leader>du /\v[a-zA-Z0-9]*%#[a-zA-Z0-9]*<CR>:nohlsearch<CR>gnd
" nnoremap <Leader>cu /\v[a-zA-Z0-9]*%#[a-zA-Z0-9]*<CR>:nohlsearch<CR>gnc
