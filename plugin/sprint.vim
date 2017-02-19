" Sprint function
" Global variables for customization
" Forces Sprint to run stopping any other Current Running Sprints
" let g:SprintForceRun = 1
" Does not open the quickfix window while running, this can be opened with the default command copen
" let g:SprintHidden = 1
" Sprint function
let g:SprintForceRun = 1
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
    if (&ft=='java')
        AsyncRun echo "Running Javac"; javac Main.java; java Main;
    endif
    " if (&ft=='coffee')
    "     AsyncRun echo "Running Coffee"; coffee %
    " endif
    if (&ft=='haskell' || &ft=='lhaskell')
        AsyncRun echo "Running Ghc"; ghc %; ./%< ;
    endif
    if (&ft=='tex')
        AsyncRun echo "Running pdfLatex"; pdflatex %;
    endif
    if (&ft=='markdown')
        if(expand("%:t") == "README.md")
            AsyncRun echo "Compiling github markdown"; pandoc -s -S -c ~/.vim/bundle/sprint/assets/github.css -o %<.html %;
        else
            AsyncRun echo "Compiling pandoc pdflatex"; pandoc -s -S -o %<.pdf %;
        endif
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
