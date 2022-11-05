let editingFile = expand('%:p') 
let script_dir = expand('<sfile>:p:h')

inoremap <f5> <c-o>:update \| call <SID>ExecuteJob() <cr><ESC>
noremap <f5> :update \| call <SID>ExecuteJob() <cr>

highlight Pmenu ctermbg=white 

func! s:ExecuteJob()
 let l:command = 'sh ' . g:script_dir . '/script.sh ' . g:editingFile
 let l:job = job_start(l:command, {'close_cb': 'CloseHandler' })
endfunc

func! CloseHandler(channel)
 call s:ShowOutput() 
endfunc
 
function! s:ShowOutput()
 " Read file content where output is written
 let l:output = readfile(g:script_dir . "/output.txt")
 
 " Clear all previous popup
 call popup_clear()
  
 " Show output next to the cursor
 call popup_atcursor(l:output, { 'padding': [0,1,0,1], 'moved': 'any'  })
endfunc

