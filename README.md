# Sprint
Async file running

## Dependencies
Sprint relies heavily on @skywind3000 [async run](https://github.com/skywind3000/asyncrun.vim), sprint also relies on Vim 8.0's async functionality. Depending on what language is being used with Sprint you will require a different dependecy check the supported languages area for reference.

- Async run
- Vim 8.0
- Language compilers/interpreters

## What does it do?
Sprint adds a command to vim to allow for asynchronus running of your file, perfect for testing. On compiled formats sprint will compile to the defautl name or use the "sprintFile" name to create a file to run, so make sure no file with this name exists.

## Supported languages and language dependencies

|Languages | Compiler|
|--------|--------|
|C | GCC|
|C++ | G++|
|Python | python|
|Php | php|
|Javascript | node|
|Haskell | ghcjj|

### Things to consider
In order to compile the contents of the buffer Sprint must save your files before executing. However after executing the file Sprint will delete the file.(Sprint is for quick testing not for final release builds, makefiles are your friend) 
