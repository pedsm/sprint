" Sprint function
function! Sprint()
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
    copen
endfunction

command! Sprint call Sprint()
