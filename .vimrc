"
"
" My Vimrc file
" Maintainer:	Isaiah Qian <qianlongzju@gmail.com>
" Last change:	2011-07-28 Thu 03:22 PM
"
"
" Use Vim settings, rather then Vi settings (much better!).
" This must be first, because it changes other options as a side effect.
set nocompatible

set backspace=indent,eol,start

" vundle setting
" BundleInstall
" rebuilt by `./install.sh --clang-completer`
filetype off

set runtimepath+=~/.vim/bundle/vundle/
call vundle#rc()

" let Vundle manage Vundle
Bundle 'gmarik/vundle'
"Bundle 'command-t'
Bundle 'syntastic'
Bundle 'Command-T'
Bundle 'Solarized'

" My Bundles here:
"
"" original repos on github
Bundle 'Valloric/YouCompleteMe'

filetype plugin indent on

" pathogen setting
execute pathogen#infect()

" set rtp+=~/.vim/bundle/powerline/powerline/bindings/vim
"powerline{
set guifont=PowerlineSymbols\ for\ Powerline
set nocompatible
set t_Co=256
let g:Powerline_symbols = 'fancy'
"}

" Set color scheme that I like.
" colorscheme evening
" colorscheme murphy

" In many terminal emulators the mouse works just fine, thus enable it.
" set mouse=a

" Set maximum width of text that is being inserted.
" set textwidth=78

" redefine a mapping learder
let mapleader=","

" Print the line number in front of each line.
set number

" Show invisible characters
" set list

let $VIMFILES=$HOME.'/.vim'

" persistent undo
set undofile
set undodir=$VIMFILES/\_undodir
set undolevels=1000 "maximum number of changes that can be undone

set background=dark

" Enable syntax highlighting
syntax on

" Automatically indent when adding a curly bracket, etc.
" All indent options: autoindent smartindent cindent
" Tip: `set paste` when pasting text into vim to avoid unnecessary
" indentation, then `set nopaste` to recover the indent option
set smartindent
set shiftwidth=4
set softtabstop=4
set tabstop=4
set smarttab
set expandtab

" Set the current language (aka locale).
language en_US.UTF-8

" Use UTF-8
set encoding=utf-8

" Set the character encoding for the file of this buffer
set fileencoding=utf-8

" set a list of fileencodings
set fileencodings=ucs-bom,utf8,cp936,big5

" Show line number, cursor position.
set ruler

" Display incomplete commands
set showcmd		

" Show autocomplete menus.
set wildmenu

" Show editing mode
set showmode

" When editing a file, always jump to the last known cursor position.
" Don't do it when the position is invalid or when inside an event handler
" (happens when dropping a file on gvim).
" Also don't do it when the mark is in the first line, that is the default
" position when opening a file.
autocmd BufReadPost *
  \ if line("'\"") > 1 && line("'\"") <= line("$") |
  \   exe "normal! g`\"" |
  \ endif

" To insert timestamp, press F3.
nmap <F3> a<C-R>=strftime("%Y-%m-%d %a %I:%M %p")<CR><Esc>
imap <F3> <C-R>=strftime("%Y-%m-%d %a %I:%M %p")<CR>

nmap <F4> :NERDTree<CR>
imap <F4> <Esc>:NERDTree<CR>

" Search as you type
set incsearch

" Ignore case when searching
set ignorecase

" Overide the 'ignorecase' option if the search pattern contains upper case
" characters.
set smartcase

" Switch on highlighting the last used search pattern
set hlsearch    

" When a bracket is inserted, briefly jump to the matching one and be back
set showmatch

" Status line
set laststatus=2
set statusline=
set statusline+=%-3.3n\                         " buffer number
set statusline+=%f\                             " filename
set statusline+=%h%m%r%w                        " status flags
set statusline+=\[%{strlen(&ft)?&ft:'none'}]    " file type
set statusline+=%=                              " right align remainder
set statusline+=0x%-8B                          " character value
set statusline+=%-14(%l,%c%V%)                  " line, character
set statusline+=%<%P                            " file position

set colorcolumn=80

" Abbreviations for my habit writing
abbreviate qlmail qianlongzju@gmail.com
abbreviate qlnick Isaiah Qian

" python coding setting
autocmd BufRead,BufNewFile *.py nmap <F5> :w<CR>:!python %<CR>

" octave coding setting
autocmd BufRead,BufNewFile *.m nmap <F5> :w<CR>:!octave %<CR>

" retab 
autocmd BufRead,BufNewFile *.c retab
autocmd BufRead,BufNewFile *.cpp retab
autocmd BufRead,BufNewFile *.h retab
autocmd BufRead,BufNewFile *.java retab
autocmd BufRead,BufNewFile *.py retab

" java coding setting
autocmd BufRead,BufNewFile *.java nmap <F5> :w<CR>:!javac %<CR>
autocmd BufRead,BufNewFile *.java nmap <F6> :w<CR>:!time java %<<CR>

" c coding setting
"autocmd BufRead,BufNewFile *.c nmap <F5> :w<CR>:!gcc -Wall -std=c99 -lm % -o %<<CR>
autocmd BufRead,BufNewFile *.c nmap <F5> :w<CR>:!clang -Wall % -o %<<CR>
autocmd BufRead,BufNewFile *.c nmap <F6> :w<CR>:!time ./%<<CR>
autocmd BufNewFile  *.c	    0r ~/.vim/skeleton.c

" cpp coding setting
"autocmd BufRead,BufNewFile *.cpp nmap <F5> :w<CR>:!g++ -Wall % -o %<<CR>
autocmd BufRead,BufNewFile *.cpp nmap <F5> :w<CR>:!clang++ -std=c++0x -Wall % -o %<<CR>
autocmd BufRead,BufNewFile *.cpp nmap <F6> :w<CR>:!time ./%<<CR>
autocmd BufNewFile  *.cpp	0r ~/.vim/skeleton.cpp

" bash coding setting
autocmd BufRead,BufNewFile *.sh nmap <F5> :w<CR>:!bash %<CR>

" tex coding setting
autocmd BufRead,BufNewFile *.tex nmap <F5> :w<CR>:!latex %<CR>
autocmd BufRead,BufNewFile *.tex nmap <F6> :!dvipdf %<.dvi<CR>
autocmd BufRead,BufNewFile *.tex nmap <S-F6> :!evince %<.pdf<CR>

" Lush coding setting
autocmd BufRead,BufNewFile *.lsh set filetype=lisp

" IMPORTANT: win32 users will need to have 'shellslash' set so that latex
" can be called correctly.
set shellslash

" IMPORTANT: grep will sometimes skip displaying the file name if you
" search in a singe file. This will confuse Latex-Suite. Set your grep
" program to always generate a file-name.
set grepprg=grep\ -nH\ $*

" OPTIONAL: Starting with Vim 7, the filetype of empty .tex files defaults to
" 'plaintex' instead of 'tex', which results in vim-latex not being loaded.
" The following changes the default filetype back to 'tex':
let g:tex_flavor='latex'
let g:Tex_DefaultTargetFormat = 'pdf'
let g:Tex_CompileRule_dvi = 'latex -interaction=nonstopmode $*'
let g:Tex_CompileRule_ps = 'ps2pdf $*'
let g:Tex_CompileRule_pdf = 'pdflatex -interaction=nonstopmode $*'
" let g:Tex_FormatDependency_pdf = 'dvi,ps,pdf'
let g:Tex_MultipleCompileFormats='pdf, aux'

"YouCompleteMe
let g:ycm_global_ycm_extra_conf = "/home/isaiah/.vim/bundle/YouCompleteMe/.ycm_extra_conf.py"
nnoremap <leader>jd :YcmCompleter GoToDefinitionElseDeclaration<CR>


"" Ultisnips
let g:UltiSnipsExpandTrigger="<c-j>"
let g:UltiSnipsListSnippets="<c-k>"
