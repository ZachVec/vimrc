" This is COC's Plugins
let g:coc_global_extensions = ['coc-json', 'coc-git', 'coc-clangd', 'coc-pyright', 'coc-lists', 'coc-vimlsp', 'coc-pairs']

" Line numbering
set numberwidth=3 number
augroup line_numbering
  au!
  au InsertEnter * set norelativenumber
  au InsertLeave * set relativenumber
augroup end

if has("termguicolors")
    " fix bug for vim
    let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
    let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"

    " enable true color
    set termguicolors
endif

