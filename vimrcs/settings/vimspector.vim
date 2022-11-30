" Key mappings
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
