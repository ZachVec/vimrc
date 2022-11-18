"""""""""""""""""""""""""""""""
" => Load Plugins
"""""""""""""""""""""""""""""""
call plug#begin("~/.vim/plugged")
  Plug 'morhetz/gruvbox'
  Plug 'itchyny/lightline.vim'
  Plug 'neoclide/coc.nvim', {'branch': 'release'}
  Plug 'junegunn/fzf', {'do': { -> fzf#install() }}
  Plug 'junegunn/fzf.vim'
  Plug 'puremourning/vimspector'
  Plug 'preservim/nerdtree'
  Plug 'ConradIrwin/vim-bracketed-paste'
call plug#end()

"""""""""""""""""""""""""""""""
" => Plugin: gruvbox
"""""""""""""""""""""""""""""""
colorscheme gruvbox


"""""""""""""""""""""""""""""""
" => Plugin: coc.nvim, General
"""""""""""""""""""""""""""""""
let g:coc_config_home = "~/.vim/vimrcs/"
" May need for vim (not neovim) since coc.nvim calculate byte offset by count utf-8 byte sequence.
set encoding=utf-8

" Some servers have issues with backup files, see #649.
" set nobackup
" set nowritebackup

" Having longer updatetime (default is 4000 ms = 4 s) leads to noticeable delays and poor user experience.
set updatetime=300

" Always show the signcolumn, otherwise it would shift the text each time diagnostics appear/become resolved.
set signcolumn=yes

" Use tab for trigger completion with characters ahead and navigate.
inoremap <silent><expr> <TAB>
      \ coc#pum#visible() ? coc#pum#next(1) :
      \ CheckBackspace() ? "\<Tab>" :
      \ coc#refresh()
inoremap <expr><S-TAB> coc#pum#visible() ? coc#pum#prev(1) : "\<C-h>"

" Make <CR> to accept selected completion item or notify coc.nvim to format
" <C-g>u breaks current undo, please make your own choice.
inoremap <silent><expr> <CR> coc#pum#visible() ? coc#pum#confirm()
                              \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"

" GoTo navigation
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)
nmap <silent> g- <Plug>(coc-diagnostic-prev)
nmap <silent> g= <Plug>(coc-diagnostic-next)

" Use K to show documentation in preview window.
nnoremap <silent> K :call ShowDocumentation()<CR>

" Highlight the symbol and its references when holding the cursor.
autocmd CursorHold * silent call CocActionAsync('highlight')

" Symbol renaming.
nmap <F2> <Plug>(coc-rename)

" Apply AutoFix to problem on the current line.
nmap <leader>qf  <Plug>(coc-fix-current)


"""""""""""""""""""""""""""""""
" => Plugin: coc.nvim, coc-git
"""""""""""""""""""""""""""""""
" status line config for lightline users
let g:lightline = {
  \ 'active': {
  \   'left': [
  \     [ 'mode', 'paste' ],
  \     [ 'ctrlpmark', 'git', 'diagnostic', 'cocstatus', 'filename', 'method' ]
  \   ],
  \   'right':[
  \     [ 'filetype', 'fileencoding', 'lineinfo', 'percent' ],
  \     [ 'blame' ]
  \   ],
  \ },
  \ 'component_function': {
  \   'blame': 'LightlineGitBlame',
  \ }
\ }


"""""""""""""""""""""""""""""""
" => Plugin: coc.nvim, coc-terminal
"""""""""""""""""""""""""""""""
nmap <F3> <Plug>(coc-terminal-toggle)
tmap <F3> <C-\><C-n><Plug>(coc-terminal-toggle)


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Plugin options: ZFZ
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
nnoremap <C-F> :Buffers<CR>
nnoremap <C-G> :GFiles<CR>


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Plugin options: vimspector
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
nmap <F5>           <Plug>VimspectorContinue
nmap <S-F5>         <Plug>VimspectorRestart
nmap <F6>           <Plug>VimspectorStop
nmap <F7>           <Plug>VimspectorUpFrame
nmap <S-F7>         <Plug>VimspectorDownFrame
nmap <F8>           <Plug>VimspectorToggleBreakpoint
nmap <S-F8>         <Plug>VimspectorToggleConditionalBreakpoint
nmap <C-F8>         <Plug>VimspectorBreakpoints
nmap <F9>           <Plug>VimspectorStepOver
nmap <S-F9>         <Plug>VimspectorStepInto
nmap <F10>          <Plug>VimspectorStepOut
nmap <F12>          <Plug>VimspectorDisassemble

" 'di' = 'debug inspect' for normal & visual mode
nnoremap <leader>di 	  <Plug>VimspectorBalloonEval
xnoremap <leader>di 		<Plug>VimspectorBalloonEval

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Plugin options: NERDTree
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
nnoremap <silent> <C-N> :NERDTreeToggle<CR>

" Start NERDTree. If a file is specified, move the cursor to its window.
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * NERDTree | if argc() > 0 || exists("s:std_in") | wincmd p | endif

" Close the tab if NERDTree is the only window remaining in it.
autocmd BufEnter * if winnr('$') == 1 && exists('b:NERDTree') && b:NERDTree.isTabTree() | quit | endif

" Exit Vim if NERDTree is the only window remaining in the only tab.
autocmd BufEnter * if tabpagenr('$') == 1 && winnr('$') == 1 && exists('b:NERDTree') && b:NERDTree.isTabTree() | quit | endif

" If another buffer tries to replace NERDTree, put it in the other window, and bring back NERDTree.
autocmd BufEnter * if bufname('#') =~ 'NERD_tree_\d\+' && bufname('%') !~ 'NERD_tree_\d\+' && winnr('$') > 1 |
    \ let buf=bufnr() | buffer# | execute "normal! \<C-W>w" | execute 'buffer'.buf | endif

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Helper functions
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
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


function! LightlineGitBlame() abort
  let blame = get(b:, 'coc_git_blame', '')
  " return blame
  return winwidth(0) > 120 ? blame : ''
endfunction


