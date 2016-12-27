" Sprint function
" Global variables for customization
" Forces Sprint to run stopping any other Current Running Sprints
" let g:SprintForceRun = 1
" Does not open the quickfix window while running, this can be opened with the default command copen
" let g:SprintHidden = 1
" Sprint function
" let g:SprintForceRun = 0
function! Sprint()
    if exists("g:SprintForceRun")
        if g:SprintForceRun
            AsyncStop
        endif
    endif
    w
    if (&ft=='c')
        AsyncRun echo "Running C compiler"; gcc % ; ./a.out
    endif
    if (&ft=='cpp')
        AsyncRun echo "Running C++ compiler"; g++ %; ./a.out
    endif
    if (&ft=='python')
        AsyncRun echo "Running python interpreter"; python %
    endif
    if (&ft=='php')
        AsyncRun echo "Running php"; php %
    endif
    if (&ft=='javascript')
        AsyncRun echo "Running Node"; node %
    endif
    if (&ft=='haskell')
        AsyncRun echo "Running Ghc"; ghc %; ./%< ;
    endif
    if (&ft=='tex')
        AsyncRun echo "Running pdfLatex and evince"; pdflatex %; evince %<.pdf ;
    endif
    if (&ft=='markdown')
        AsyncRun echo "Running pandoc and evince"; pandoc % -o %<.pdf --latex-engine=pdflatex; evince %<.pdf ;
    endif
    if exists("g:SprintHidden")
        if g:SprintHidden == 0
            copen
        endif
    else
        copen
    endif
endfunction

command! Sprint call Sprint()
command! SprintStop AsyncStop
