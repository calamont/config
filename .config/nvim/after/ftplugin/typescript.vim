let &colorcolumn=join(range(80,400),",")        " highlight columns after 80
setlocal cursorline                              " highlight line cursor is on
setlocal showmatch                               " highlight matching paren

" Default tab options.
setlocal shiftwidth=2
setlocal expandtab                                      " tabs are spaces
setlocal tabstop=2                                      " number of visual spaces per TAB
setlocal softtabstop=2                                  " number of spaces in tab when editing
setlocal shiftround
setlocal autoindent
setlocal number                                         " show line numbers

" Creates a % pair between = and ;
" Currently this isn't as useful as I first thought as
" it doesn't allow you to Delete Inside/Around as you
" do with () and {} pairs
" setlocal matchpairs+==:;
