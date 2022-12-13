" Key mappings
nmap <F5>           <Plug>VimspectorContinue
nmap <M-F5>         <Plug>VimspectorRestart
nmap <F6>           <Plug>VimspectorStop
nmap <F7>           <Plug>VimspectorStepOver
nmap <F8>           <Plug>VimspectorStepInto
nmap <M-F8>         <Plug>VimspectorStepOut
nmap <F9>           <Plug>VimspectorToggleBreakpoint
nmap <M-F9>         <Plug>VimspectorToggleConditionalBreakpoint
nmap <F10>          <Plug>VimspectorDownFrame
nmap <M-F10>        <Plug>VimspectorUpFrame
nmap <F11>          <Plug>VimspectorBreakpoints
nmap <F12>          <Plug>VimspectorDisassemble

" 'di' = 'debug inspect' for normal & visual mode
nnoremap <leader>di 	  <Plug>VimspectorBalloonEval
xnoremap <leader>di 		<Plug>VimspectorBalloonEval
