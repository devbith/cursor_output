" Map F5 key to compile and run Java program
nnoremap <F5> :call CompileAndRunJava()<CR>

highlight Pmenu ctermbg=white

" Global variable to store the job ID
let g:java_job_id = -1
let g:java_output = ""

let g:editingFile = expand('%:p')
let g:script_dir = expand('<sfile>:p:h')

" Function to compile and run Java program
function! CompileAndRunJava()
    " Save the current buffer
    w

    " Build the command to execute the script
    let command = 'sh ' . g:script_dir . '/script.sh ' . g:editingFile

    " Empty output.txt  
    call writefile([], g:script_dir ."/output.txt")

    " Run the command as a background job and capture the job ID
    let g:java_job_id = job_start(command, {
                \ 'out_io': 'pipe',
                \ 'out_cb': 'GotOutput',
                \ 'err_io': 'pipe',
                \ 'err_cb': 'GotOutput',
                \ })
endfunction

func GotOutput(channel, msg)
   call writefile([a:msg], g:script_dir .'/output.txt', 'a')

   let l:output = readfile(g:script_dir.'/output.txt')

   " Clear all previous popup
   call popup_clear()
    
   " Show output next to the cursor
   call popup_atcursor(l:output, { 'padding': [0,1,0,1], 'moved': 'any'  })
endfunc

