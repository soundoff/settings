runtime bundle/vim-pathogen/autoload/pathogen.vim

:filetype off
call pathogen#helptags()
execute pathogen#infect()
filetype plugin indent on

" vimcasts #24
" Auto-reload vimrc on save
if has("autocmd")
    autocmd bufwritepost .vimrc source $MYVIMRC
    filetype plugin indent on
endif
" Load vimrc in new tab with leader-v
nmap <leader>v :tabedit $MYVIMRC<CR>

" turn off all the things VIM does to try and be VI compatible
set nocompatible
set number
set tabstop=4 
set softtabstop=4
set shiftwidth=4 
set expandtab
set textwidth=80
set tags=$HOME/.vim/doc/tags
set t_Co=256
set ttyfast
set autoindent
set relativenumber
set shiftround
set showcmd
set showmode
set smarttab
colorscheme solarized
set background=dark
set wildmenu
set wildmode=list:longest
syntax on

" Make case-insensitive search the norm
:set ignorecase
:set smartcase

" Make ZSH my shell for VIM
" set shell=zsh 

" Remap F1 to escape, because that happens a lot when reaching. :)
inoremap <F1> <ESC>
nnoremap <F1> <ESC>
vnoremap <F1> <ESC>

map <F2> <ESC>:NERDTreeToggle<CR>
nmap <F8> :TagbarToggle<CR>

autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | endif
" show the full path to the current file
nmap <F12> :echo expand('%:p')<CR>


" remove the temptation to use the arrow keys!
nnoremap<up> <nop> 
nnoremap<down> <nop>
nnoremap<left> <nop>
nnoremap<right> <nop>
inoremap<up> <nop> 
inoremap<down> <nop>
inoremap<left> <nop>
inoremap<right> <nop>

" remap jj to the escape key
inoremap jj <ESC>

" make creating a split easier by adding a mapping to open new vert split and
" go to it
nnoremap <leader>w <C-w>v<C-w>l
nnoremap <leader>s <C-w>s<C-w>j

" map shortcuts for moving around in open windows
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l

" map shortcuts for moving around in open tabs
nnoremap th  :tabfirst<CR>
nnoremap tj  :tabnext<CR>
nnoremap tk  :tabprev<CR>
nnoremap tl  :tablast<CR>
nnoremap tt  :tabedit<Space>
nnoremap tn  :tabnext<Space>
nnoremap tm  :tabm<Space>
nnoremap td  :tabclose<CR>

" map shortcuts for moving around in location lists
nnoremap <leader>h :lfir<CR>
nnoremap <leader>j :lp<CR>
nnoremap <leader>k :lne<CR>
nnoremap <leader>l :lla<CR>
nnoremap <leader>q :lcl<CR>

" run the file with PHP CLI (CTRL-M)
:autocmd FileType php noremap <C-m> :w!<CR>:!/usr/bin/php %<CR>

" PHP parser check (CTRL-L)
:autocmd FileType php noremap <C-n> :!/usr/bin/php -l %<CR>

" run the current PHPUnit test file (Leader-P)
:autocmd FileType php noremap <C-p> :w!<CR>:!/usr/local/bin/phpunit %<CR>

" enable PHP autocompletion for PHP filetype
:autocmd FileType php set omnifunc=phpcomplete#CompletePHP

" Load a tag file
" Loads a tag file from ~/.vim.tags/, based on the argument provided. The
" command "Ltag"" is mapped to this function.
:function! LoadTags(file)
:   let tagspath = $HOME . "/.vim.tags/" . a:file
:   let tagcommand = 'set tags+=' . tagspath
:   execute tagcommand
:endfunction
:command! -nargs=1 Ltag :call LoadTags("<args>")

" These are tag files I've created; you may want to remove/change these for
" your own usage.
:call LoadTags("doctrine")
:call LoadTags("zendframework")
:call LoadTags("phpunit")
:call LoadTags("Rockethopper")

" Options for PHPComplete
" When enabled the preview window's content will include information extracted
" from docblock comments of the completions. Enabling this option will add
" return types to the completion menu for functions too.
let g:phpcomplete_parse_docblock_comments = 1

" Supertab settings
let g:SupertabdefaultCompletionType = "context"

" Taglist options
nnoremap <F3> :TlistToggle<CR>
let Tlist_Use_Right_Window = 1
let Tlist_Compact_Format = 1
let Tlist_Exit_OnlyWindow = 4
let Tlist_GainFocus_On_ToggleOpen = 1
let Tlist_File_Fild_Auto_Close = 1
let Tlist_Inc_Winwidth = 0
let Tlist_Close_On_Select = 1
let Tlist_Process_File_Always = 1
let Tlist_Display_Prototype = 0
let Tlist_Display_Tag_Scope = 1

" syntastic settings
 let g:syntastic_check_on_open=0
 let g:syntastic_auto_jump=1
 let g:syntastic_auto_loc_list=1
 let g:syntastic_mode_map = { 'mode': 'active',
                            \ 'active_filetypes': ['php', 'javascript', 'json', 'html', 'sh', 'docbk', 'css', 'xml', 'xhtml'] }

" snipMate options
let g:snips_author = "Shaun Sandlin"
" let g:snippets_dir = $HOME . "/.vim/snippets/"
