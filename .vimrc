" Set 'nocompatible' to ward off unexpected things that your distro might
" have made, as well as sanely reset options when re-sourcing .vimrc
set nocompatible
 
" Attempt to determine the type of a file based on its name and possibly its
" contents. Use this to allow intelligent auto-indenting for each filetype,
" and for plugins that are filetype specific.
filetype indent plugin on
 
" Enable syntax highlighting
syntax on

" Show (partial) command in status line.
set showcmd

" Show matching brackets.
set showmatch

" Do case insensitive matching
set ignorecase

" Do smart case matching
set smartcase

" Incremental search
set incsearch

" automatically save before commands like :next and :make
set autowrite

" dide buffers when they are abandoned
set hidden

" enable mouse usage (all modes)
set mouse=a

" makes backspace work in insert mode
set backspace=indent,eol,start

" activate line numbering
set number
  
" Indentation options {{{1
"------------------------------------------------------------
 
" Indentation settings for using 4 spaces instead of tabs.
" Do not change 'tabstop' from its default value of 8 with this setup.
set shiftwidth=4
set softtabstop=4
set expandtab
 
" Indentation settings for using hard tabs for indent. Display tabs as
" four characters wide.
"set shiftwidth=4
"set tabstop=4


" background 
set background=dark

" color scheme
colo desert


"------------------------------------------------------------
" Mappings {{{1
"
" Useful mappings
 
" Map Y to act like D and C, i.e. to yank until EOL, rather than act as yy,
" which is the default
map Y y$
 
" Map <C-L> (redraw screen) to also turn off search highlighting until the
" next search
nnoremap <C-L> :nohl<CR><C-L>


" normal mode mappings
"------------------------------------------------------------

" maps copy and paste keys to system buffer
noremap <c-c> "*y
noremap <c-v> "*p

" maps save key
noremap <c-s> :w<cr>

" Source a global configuration file if available
if filereadable("/etc/vim/vimrc.local")
  source /etc/vim/vimrc.local
endif



" insert mode mappings
"------------------------------------------------------------
inoremap CC <Esc>C
inoremap SS <Esc>S
inoremap DD <Esc>dd
inoremap UU <Esc>u




" Pathogen
"------------------------------------------------------------

execute pathogen#infect()



" YouCompleteMe
"------------------------------------------------------------

" make YCM compatible with UltiSnips (using supertab)
let g:ycm_key_list_select_completion = ['<C-n>', '<Down>']
let g:ycm_key_list_previous_completion = ['<C-p>', '<Up>']


" Ultisnips
"------------------------------------------------------------

" ultisnips edit should split window
let g:UltiSnipsEditSplit="vertical"

" setting author for TODOs in ultisnips
let g:snips_author="ckoesner"

" setting search path for snippets
let g:UltiSnipsSnippetDirectories=[$HOME.'/.vim/bundle/mysnippets']

" disable snipmates, which cause errors, when changing the search path
let g:UltiSnipsEnableSnipMate=0


let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<c-b>"
let g:UltiSnipsJumpBackwardTrigger="<c-p>"


function! UltiExpandSnip()
python3 << EOF
import sys, vim
from UltiSnips import UltiSnips_Manager
UltiSnips_Manager.expand()
EOF
return ""
endfunction


" autocmd FileType tex inoremap _ <space>subscript<c-r>=UltiExpandSnip()<CR>

autocmd FileType tex inoremap <silent> __ __<C-R>=UltiSnips#Anon('_{$1}$0', '__', '', 'i')<CR>


autocmd FileType tex inoremap <silent> ^^ ^^<C-R>=UltiSnips#Anon('^{$1}$0', '^^', '', 'i')<CR>
