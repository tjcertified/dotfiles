"" VIM settings
" set all files to be interpreted as utf-8
set encoding=utf-8
" set THIS file to be interpreted as utf-8
" (allows whitespace chars to appear correctly)
scriptencoding utf-8

" make gVim handle everything via console
set guioptions+=c

" set font
set guifont=Fantasque\ Sans\ Mono\ 12
" enable syntax highlighting
syntax on
syntax enable

" disable vi-compatible mode, enabling more vim features
set nocompatible
filetype off

" Whitespace
" Turn line wrapping off
set nowrap
" convert tabs to spaces
set expandtab
" Set Default tabstop to four spaces
set tabstop=4
" shiftwidth applies when >> operator is used.
set shiftwidth=4
" shiftround makes shifts happen in multiples of the 'shiftwidth' value
set shiftround
" allow backspace over autoindent, line breaks, and start of insert
set backspace=indent,eol,start
" use indentation of current line for next line
set autoindent
" show whitespaces
" set list listchars=tab:··,trail:●,extends:⮀,precedes:⮂
set list listchars=tab:^^,trail:■,extends:,precedes:

" Set line number on left relative lines away from current.
set relativenumber
" Show line number on current line instead of '0'
set number
" persistent undo saved to a file in dir listed below
set undofile
" makes vim work faster. tty is old mode from vi
set ttyfast
" Show current line and column of cursor
set ruler
" Make screen flash instead of audio warning for improper actions
set visualbell
" let buffers remain in the list
set hidden
" kind of like intellisense for command-line mode
set wildmode=list:longest,full
" set spell-checking
set spell spelllang=en_us

"" Search options
" highlight the current line
set cursorline
" highlight the current search
set hlsearch
" perform search incrementally
set incsearch
" find both cases when searching
set ignorecase
" when you search, uppercase means you mean uppercase
set smartcase
" use global replacement for searches
set gdefault
" don't look for things in cscope db's or Rhapsody files
set wildignore+=cscope.out,*.rpy,tags

" Show opposite parens when typing the other.
set showmatch
" color the 80th column for a guideline for line length
set colorcolumn=80

"" Set dirs
set backupdir=~/bkp//
set undodir=~/bkp//
set dir=~/bkp//

"" Code-folding
" Set code-folding somewhat appropriately
set foldmethod=indent
" turn off automatic code-folding when opening a file
set foldenable
" use X columns on left to show fold info
set foldcolumn=5

" For complex commands, show what state you are in the command
" e.g. if typing '2dw' (delete two words), until the 'w' is pressed
" all other parts are shown in the bottom line
set showcmd
set omnifunc=syntaxcomplete#Complete

" find all code
set path=.,,,c:/code/**,shared

" show 3 lines of code around cursor (top or bottom), when possible
set scrolloff=3

" setup Vundle
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" let Vundle manage Vundle (required) and add all plugins
Plugin 'VundleVim/Vundle.vim'
Plugin 'scrooloose/syntastic'
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
Plugin 'mileszs/Ack.vim'
Plugin 'tpope/vim-commentary'
Plugin 'tpope/vim-surround'
Plugin 'tpope/vim-repeat'
Plugin 'tpope/vim-speeddating'
Plugin 'tpope/vim-vinegar'
Plugin 'tpope/vim-fugitive'
Plugin 'tpope/vim-unimpaired'
Plugin 'vim-scripts/hexHighlight.vim'
Plugin 'xolox/vim-shell'
Plugin 'xolox/vim-misc'
Plugin 'luochen1990/rainbow'
Plugin 'jiangmiao/auto-pairs'
Plugin 'a.vim'
Plugin 'junegunn/vim-easy-align'
Plugin 'aklt/plantuml-syntax'
Plugin 'abudden/taghighlight-automirror'
Plugin 'ap/vim-css-color'
Plugin 'mileszs/ack.vim'
Plugin 'flazz/vim-colorschemes'
Plugin 'shougo/denite.nvim'
Plugin 'shougo/neosnippet'
Plugin 'shougo/neosnippet-snippets'
Plugin 'shougo/neocomplete.vim'
Plugin 'shougo/context_filetype.vim'
Plugin 'davidhalter/jedi-vim'
Plugin 'danilo-augusto/vim-afterglow'
Plugin 'elixir-lang/vim-elixir'
Plugin 'slashmili/alchemist.vim'
Plugin 'xolox/vim-colorscheme-switcher'
Plugin 'CCtree'

call vundle#end()

"" Turn filetype on for Vundle to work
filetype plugin indent on

"" Set mapleader to , instead of \ for ease
let mapleader = ","

"""KEY REMAPPINGS
" remap 'jk' to Esc (to leave insert mode easily)
inoremap jk <Esc>
inoremap JK <Esc>
" Use movements to navigate split panes
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l
nnoremap <C-h> <C-w>h
" Use plugin for undo tree, and map toggle function to F5
" NOTE: requires Python 2.7.6, x86 version
nnoremap <S-F5> :silent make<CR>
nnoremap <F4> :SyntasticCheck<CR>
" random keybindings for ease
" bring next match to middle of screen from either direction
nnoremap <silent> n nzz
nnoremap <silent> N Nzz
" remap ZQ to close a current buffer (kills split-screen)
nnoremap ZQ :bd<CR>
" remap ,b to close a buffer without closing split
nnoremap <Leader>b :bn\|bd #<CR>
nnoremap <F10> :SyntasticToggleMode<CR>
nnoremap <S-F12> :silent Ack!<CR>
" remove trailing whitespace in entire file with F4
nnoremap <silent> <F4> :let _s=@/ <Bar> :%s/\s\+$//e <Bar> :let @/=_s <Bar> :nohl <Bar> :unlet _s <CR>

"" Leader Mappings
" lets <,><space> get rid of search highlights
nnoremap <silent> <leader><space> :noh<cr>
" <,><x> map to remove all extra windows
nnoremap <silent> <leader>x :ccl<cr> :lcl<cr> :pc<cr>

" keybindings for cscope
"s: Find this C symbol
nnoremap <Leader>fs :cs find s <C-R>=expand("<cword>")<CR><CR>
"g: Find this definition
nnoremap <Leader>fg :cs find g <C-R>=expand("<cword>")<CR><CR>
"c: Find functions calling this function
nnoremap <Leader>fc :cs find c <C-R>=expand("<cword>")<CR><CR>
"t: Find this text string
nnoremap <Leader>ft :cs find t <C-R>=expand("<cword>")<CR><CR>
"e: Find this egrep pattern
nnoremap <Leader>fe :cs find e <C-R>=expand("<cword>")<CR><CR>
"f: Find this file
nnoremap <Leader>ff :cs find f <C-R>=expand("<cfile>")<CR><CR>
"i: Find files #including this file
nnoremap <Leader>fi :cs find i ^<C-R>=expand("<cfile>")<CR>$<CR
"d: Find functions called by this function
nnoremap <Leader>fd :cs find d <C-R>=expand("<cword>")<CR><CR>

" Denite commands
" CtrlP Replacement (NOTE: project by default)
nnoremap <C-p> :<C-u>DeniteProjectDir file_rec<CR>
nnoremap <Leader>dh :<C-u>Denite file_rec:~/<CR>
nnoremap <Leader>* :<C-u>DeniteCursorWord grep<CR>
" Change file_rec command.
call denite#custom#var('file_rec', 'command', ['ag', '--follow', '--nocolor', '--nogroup', '-g', ''])
" use 'ag' as command for Denite grep command
call denite#custom#var('grep', 'command', ['ag'])
call denite#custom#var('grep', 'default_opts', ['-i', '--nocolor', '--nogroup', '--column'])
call denite#custom#var('grep', 'recursive_opts', [])
call denite#custom#var('grep', 'pattern_opt', [])
call denite#custom#var('grep', 'separator', ['--'])
call denite#custom#var('grep', 'final_opts', [])

"" Commands
" Set capital w to save
command! W w
" Set capital q to quit
command! Q q

"" Setup Airline extension
if !exists('g:airline_symbols')
  let g:airline_symbols = {}
endif
let g:airline_left_sep = ''
let g:airline_left_alt_sep = ''
let g:airline_right_sep = ''
let g:airline_right_alt_sep = ''
let g:airline_symbols.branch = ''
let g:airline_symbols.readonly = ''
let g:airline_symbols.linenr = ''
" let g:airline_left_sep = '⮀'
" let g:airline_left_alt_sep = '⮁'
" let g:airline_right_sep = '⮂'
" let g:airline_right_alt_sep = '⮃'
" let g:airline_symbols.branch = '⭠'
" let g:airline_symbols.readonly = '⭤'
" let g:airline_symbols.linenr = '⭡'
" Enable buffer-line from Airline extension
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#left_sep = ''
let g:airline#extensions#tabline#left_alt_sep = ''
" let g:airline#extensions#tabline#left_sep = '⮀'
" let g:airline#extensions#tabline#left_alt_sep = '⮁'
set laststatus=2
" Add linecount to Airline
call airline#parts#define_raw('lineno', '%L ')
call airline#parts#define_raw('columnno', ':%3v')
call airline#parts#define_accent('columnno', 'italic')
function! AirlineAddLinecount()
  let g:airline_section_z = airline#section#create(['windowswap', 'linenr', '/', 'lineno', 'columnno'])
  AirlineRefresh
endfunction
autocmd VimEnter * call AirlineAddLinecount()
" autocmd BufEnter * highlight Comment gui=italic cterm=italic term=italic

" Enable Syntastic
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*
let b:syntastic_mode = "passive"
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 0
let g:syntastic_check_on_wq = 0
let b:syntastic_mode = 'passive'
let g:syntastic_cpp_remove_include_errors = 1
let g:syntastic_quiet_messages = { "level": "warning" }

"" Ctags options
" look recursively for tags file
set tags=tags;
" make completion go faster by eliminating include files
set complete-=i
" force vertical diff ALWAYS
set diffopt+=vertical

" For conceal markers.
if has('conceal')
  set conceallevel=2 concealcursor=niv
endif

" workaround for autopairs+clang_complete
" let g:AutoPairsMapCR = 0
" imap <silent><CR> <CR><Plug>AutoPairsReturn
" settings for auto-pairs
" let g:AutoPairsMultilineClose = 0
let g:AutoPairsFlyMode = 0


" neocomplete
let g:neocomplete#enable_at_startup = 1
let g:neocomplete#enable_smart_case = 1
let g:neocomplete#sources#syntax#min_keyword_length = 3
" Recommended key-mappings.
" For smart TAB completion.
inoremap <expr><TAB>  pumvisible() ? "\<C-n>" :
        \ <SID>check_back_space() ? "\<TAB>" :
        \ neocomplete#start_manual_complete()
function! s:check_back_space()
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~ '\s'
endfunction
" <CR>: close popup and save indent.
inoremap <silent> <CR> <C-r>=<SID>my_cr_function()<CR>
function! s:my_cr_function()
  return (pumvisible() ? "\<C-y>" : "" ) . "\<CR>"
  " For no inserting <CR> key.
  "return pumvisible() ? "\<C-y>" : "\<CR>"
endfunction
" <TAB>: completion.
inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"

" neosnippet
" Note: It must be "imap" and "smap".  It uses <Plug> mappings.
imap <C-k>     <Plug>(neosnippet_expand_or_jump)
smap <C-k>     <Plug>(neosnippet_expand_or_jump)
xmap <C-k>     <Plug>(neosnippet_expand_target)

" SuperTab-like snippets behavior.
" Note: It must be "imap" and "smap".  It uses <Plug> mappings.
" imap <C-k>     <Plug>(neosnippet_expand_or_jump)
map <expr><TAB>
\ pumvisible() ? "\<C-n>" :
\ neosnippet#expandable_or_jumpable() ?
\    "\<Plug>(neosnippet_expand_or_jump)" : "\<TAB>"
smap <expr><TAB> neosnippet#expandable_or_jumpable() ?
\ "\<Plug>(neosnippet_expand_or_jump)" : "\<TAB>"

" settings for SuperTab
" let g:SuperTabDefaultCompletionType = "context"

" settings for Xolox vim-shell
let g:shell_fullscreen_items = 'meT'
call xolox#shell#maximize()

" settings for PlantUML
let g:plantuml_executable_script = 'java -jar c:\users\irgpqt\plantuml.jar'

" settings for Rainbow parens
let g:rainbow_active = 1

" settings for jedi-vim (python)
let g:jedi#auto_vim_configuration = 0
let g:jedi#completions_enabled = 0

" If 'Ag' is installed, then let it run instead of Ack
if executable('ag')
  let g:ackprg = 'ag --column --nogroup --nocolor'
endif

" highlight Comment gui=italic cterm=italic term=italic

fun! TrimWhitespace()
    let l:save = winsaveview()
    %s/\s\+$//e
    call winrestview(l:save)
endfun

" Map TrimWhitespace to key:
noremap <Leader><Leader><Leader> :call TrimWhitespace()<CR>

" File settings for Markdown files
au BufRead,BufNewFile *.md setlocal textwidth=80 linebreak wrap
au BufRead,BufNewFile *.md nnoremap <buffer> j gj
au BufRead,BufNewFile *.md nnoremap <buffer> k gk
