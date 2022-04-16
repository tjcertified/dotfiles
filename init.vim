" GENERAL {
" set all files to be interpreted as utf-8
set encoding=utf-8
" set THIS file to be interpreted as utf-8
" (allows whitespace chars to appear correctly)
scriptencoding utf-8
" enable syntax highlighting
syntax on
syntax enable
" disable vi-compatible mode, enabling more vim features
set nocompatible
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
" don't prompt to write when opening a new buffer
set hidden
" kind of like intellisense for command-line mode
set wildmode=list:longest,full
" set spell-checking
" set spell spelllang=en_us " turned off--annoying colors
" Show opposite parens when typing the other.
set showmatch
" color the 80th column for a guideline for line length
set colorcolumn=80
"" Set dirs
set backupdir=~/bkp
set undodir=~/bkp
set dir=~/bkp
" For complex commands, show what state you are in the command
" e.g. if typing '2dw' (delete two words), until the 'w' is pressed
" all other parts are shown in the bottom line
set showcmd
" show 3 lines of code around cursor (top or bottom), when possible
set scrolloff=3
" for coc
set shortmess+=c
" } // GENERAL

" SEARCH {
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
set wildignore+=cscope.out,tags
" } // SEARCH

" PLUGS {
call plug#begin()
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-surround'
Plug 'luochen1990/rainbow'
Plug 'jackguo380/vim-lsp-cxx-highlight'
Plug 'neoclide/coc.nvim', { 'branch': 'release'}
Plug 'junegunn/vim-easy-align'
Plug 'tpope/vim-unimpaired'
Plug 'scrooloose/nerdtree'
call plug#end()
" } // PLUGS

" KEY REMAPPINGS {
" remap 'jk' to Esc (to leave insert mode easily)
inoremap jk <Esc>
inoremap JK <Esc>
" Use movements to navigate split panes
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l
nnoremap <C-h> <C-w>h

" bring next match to middle of screen from either direction
nnoremap <silent> n nzz
nnoremap <silent> N Nzz

" remove trailing whitespace in entire file with F4
nnoremap <silent> <F4> :let _s=@/ <Bar> :%s/\s\+$//e <Bar> :let @/=_s <Bar> :nohl <Bar> :unlet _s <CR>

" EasyAlign mappings
" Start interactive EasyAlign in visual mode (e.g. vipga)
xmap ga <Plug>(EasyAlign)
" Start interactive EasyAlign for a motion/text object (e.g. gaip)
nmap ga <Plug>(EasyAlign)

" Use tab to autocomplete
" Use tab for trigger completion with characters ahead and navigate.
" NOTE: Use command ':verbose imap <tab>' to make sure tab is not mapped by
" other plugin before putting this into your config.
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Use <c-space> to trigger completion.
if has('nvim')
  inoremap <silent><expr> <c-space> coc#refresh()
else
  inoremap <silent><expr> <c-@> coc#refresh()
endif

" Make <CR> auto-select the first completion item and notify coc.nvim to
" format on enter, <cr> could be remapped by other vim plugin
inoremap <silent><expr> <cr> pumvisible() ? coc#_select_confirm()
                              \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"
" GoTo code navigation.
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Use K to show documentation in preview window.
nnoremap <silent> K :call <SID>show_documentation()<CR>

function! s:show_documentation()
  if CocAction('hasProvider', 'hover')
    call CocActionAsync('doHover')
  else
    call feedkeys('K', 'in')
  endif
endfunction

" Highlight the symbol and its references when holding the cursor.
autocmd CursorHold * silent call CocActionAsync('highlight')

" Symbol renaming.
nmap <leader>rn <Plug>(coc-rename)

" Formatting selected code.
xmap <leader>f  <Plug>(coc-format-selected)
nmap <leader>f  <Plug>(coc-format-selected)

" } // KEY REMAPPINGS

" LEADER KEY REMAPPINGS {
"" Set mapleader to , instead of \ for ease
let mapleader = ","
" lets <,><space> get rid of search highlights
nnoremap <silent> <leader><space> :noh<cr>
" <,><x> map to remove all extra windows
nnoremap <silent> <leader>x :ccl<cr> :lcl<cr> :pc<cr>
nnoremap <silent> - :NERDTreeToggle<CR>
" "} // LEADER KEY REMAPPINGS

" COMMANDS {
" command to open config
command NVC :e ~/.config/nvim/init.vim
command A :CocCommand clangd.switchSourceHeader
" } // COMMANDS

call plug#begin()

" AIRLINE SETUP {
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
" Enable buffer-line from Airline extension
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#left_sep = ''
let g:airline#extensions#tabline#left_alt_sep = ''
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
" } // AIRLINE SETUP


" File settings for Markdown files
au BufRead,BufNewFile *.md nnoremap <buffer> k gk
au BufRead,BufNewFile *.md setlocal textwidth=80 linebreak wrap
au BufRead,BufNewFile *.md nnoremap <buffer> j gj

" settings for Rainbow parens
let g:rainbow_active = 1

" If 'Ag' is installed, then let it run instead of Ack
if executable('ag')
  let g:ackprg = 'ag --column --nogroup --nocolor'
endif

