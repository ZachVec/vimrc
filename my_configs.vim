" Fast escape from insert mode
inoremap <C-c> <ESC>
inoremap jj <ESC>

" Copy to windows clipboard in WSL2, comment out if you don't need it
nnoremap <silent><C-c> :w !clip.exe<CR><ESC>
vnoremap <silent><C-c> :w !clip.exe<CR><ESC>

" Map ESC
tnoremap <ESC> <C-w>N
