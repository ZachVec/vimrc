call plug#begin("~/.vim/plugged")
  Plug 'morhetz/gruvbox'
  Plug 'itchyny/lightline.vim'
  Plug 'neoclide/coc.nvim', {'branch': 'release'}
  Plug 'junegunn/fzf', {'do': { -> fzf#install() }}
  Plug 'junegunn/fzf.vim'
  Plug 'puremourning/vimspector'
  Plug 'preservim/nerdtree'
  Plug 'ConradIrwin/vim-bracketed-paste'
  Plug 'Eliot00/git-lens.vim'
  Plug 'monkoose/vim9-stargate'
call plug#end()

colorscheme gruvbox                       " Colorscheme
let g:GIT_LENS_ENABLED=v:true             " Enable git-lens

let $PLUGIN_SETTINGS = "~/.vim/vimrcs/settings"
source $PLUGIN_SETTINGS/coc.vim
source $PLUGIN_SETTINGS/lightline.vim
source $PLUGIN_SETTINGS/nerdtree.vim
source $PLUGIN_SETTINGS/stargate.vim
source $PLUGIN_SETTINGS/vimspector.vim
source $PLUGIN_SETTINGS/zfz.vim

