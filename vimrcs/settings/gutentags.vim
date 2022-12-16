let $GTAGSLABEL = 'native-pygments'
let $GTAGSCONF = '/usr/local/share/gtags/gtags.conf'

" The symbols of project root
let g:gutentags_add_default_project_roots = 0
let g:gutentags_project_root = ['.root', '.svn', '.git', '.hg', '.project']

" The generated filename
let g:gutentags_ctgs_tagfile = '.tags'

" enable ctags & gtags
let g:gutentags_modules = []
if executable('ctags')
	let g:gutentags_modules += ['ctags']
endif
if executable('gtags-cscope') && executable('gtags')
	let g:gutentags_modules += ['gtags_cscope']
endif

" generate ctags/gtags files in ~/.cache/tags folder.
let g:gutentags_cache_dir = expand('~/.cache/tags')
if !isdirectory(g:gutentags_cache_dir)
  silent! call mkdir(g:gutentags_cache_dir, 'p')
endif 

" Configure the parameters of ctags
let g:gutentags_ctags_extra_args = ['--fields=+niazS']
" Not for Exuberant-ctags.
let g:gutentags_ctags_extra_args += ['--extra=+q']
let g:gutentags_ctags_extra_args += ['--c++-kinds=+px']
let g:gutentags_ctags_extra_args += ['--c-kinds=+px']

" Only for universal ctags. Not for Exuberant-ctags.
let g:gutentags_ctags_extra_args += ['--output-format=e-ctags']

