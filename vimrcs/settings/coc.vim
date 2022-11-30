let g:coc_config_home = "~/.vim/vimrcs/"
let g:coc_global_extensions = ['coc-json', 'coc-git', 'coc-clangd', 'coc-pyright', 'coc-vimlsp', 'coc-pairs', 'coc-markdownlint']

" May need for vim (not neovim) since coc.nvim calculate byte offset by count utf-8 byte sequence.
set encoding=utf-8
set updatetime=300
set signcolumn=yes

" Press K to Show Documentation
nnoremap <silent> K :call ShowDocumentation()<CR>
nmap <F2> <Plug>(coc-rename)

" Press <TAB> to trigger completion or navigation.
inoremap <silent><expr> <TAB>
      \ coc#pum#visible() ? coc#pum#next(1) :
      \ CheckBackspace() ? "\<Tab>" :
      \ coc#refresh()
inoremap <expr><S-TAB> coc#pum#visible() ? coc#pum#prev(1) : "\<C-h>"

" Press <CR> to accept selected completion item.
inoremap <silent><expr> <CR> coc#pum#visible() ? coc#pum#confirm()
                              \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"

" GoTo navigation
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)
nmap <silent> g- <Plug>(coc-diagnostic-prev)
nmap <silent> g= <Plug>(coc-diagnostic-next)

autocmd CursorHold * silent call CocActionAsync('highlight')

"""""""""""""""""""""""""""
" Helper functions.
"""""""""""""""""""""""""""

function! CheckBackspace() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

function! ShowDocumentation()
  if CocAction('hasProvider', 'hover')
    call CocActionAsync('doHover')
  else
    call feedkeys('K', 'in')
  endif
endfunction
