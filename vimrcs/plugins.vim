call plug#begin("~/.vim/plugged")
  Plug 'ConradIrwin/vim-bracketed-paste'
  Plug 'morhetz/gruvbox'
  Plug 'Eliot00/git-lens.vim'
  Plug 'itchyny/lightline.vim'
  Plug 'Yggdroot/indentLine'
  Plug 'preservim/nerdtree'
  Plug 'neoclide/coc.nvim', {'branch': 'release'}
  Plug 'puremourning/vimspector'
  Plug 'monkoose/vim9-stargate'
  Plug 'Yggdroot/LeaderF', { 'do': ':LeaderfInstallCExtension' }
  Plug 'ludovicchabant/vim-gutentags'
call plug#end()

colorscheme gruvbox                       " Colorscheme
let g:GIT_LENS_ENABLED=v:true             " Enable git-lens

let $PLUGIN_SETTINGS = "~/.vim/vimrcs/settings"
source $PLUGIN_SETTINGS/lightline.vim
source $PLUGIN_SETTINGS/indentline.vim
source $PLUGIN_SETTINGS/nerdtree.vim
source $PLUGIN_SETTINGS/coc.vim
source $PLUGIN_SETTINGS/vimspector.vim
source $PLUGIN_SETTINGS/stargate.vim
source $PLUGIN_SETTINGS/gutentags.vim
source $PLUGIN_SETTINGS/leaderf.vim

