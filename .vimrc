set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'
Plugin 'scrooloose/nerdtree.git'
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
Plugin 'morhetz/gruvbox'
Plugin 'hashivim/vim-terraform.git'
Plugin 'ctrlpvim/ctrlp.vim.git'
Plugin 'ntpeters/vim-better-whitespace'
Plugin 'cespare/vim-toml'
" Plugin 'mileszs/ack.vim'
Plugin 'kchmck/vim-coffee-script'
Plugin 'tpope/vim-rails'

" fuzzy finding = https://github.com/junegunn/fzf#as-vim-plugin
set rtp+=~/.fzf
Plugin 'junegunn/fzf'
Plugin 'junegunn/fzf.vim'

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
" To ignore plugin indent changes, instead use:
filetype plugin on
set omnifunc=syntaxcomplete#Complete

" fuck the default leader make it space bar
let mapleader = "\<Space>"

" esc insert mode with jj
inoremap jj <ESC>

" save with leader+w
nnoremap <Leader>w :w<CR>

nnoremap <Leader>W mzgg=G`z:w<CR>

" buffer movement
nnoremap <Leader>bb :BuffergatorToggle<CR>
nnoremap <Leader>bn :bnext<CR>
nnoremap <Leader>bv :bprev<CR>

"open vimrc in new tab with :vimrc
map <Leader>vimrc :tabe ~/.vimrc<cr>

"change hash syntax
"nmap <Leader>h :%s/\:\([a-zA-Z_]*\)\s=>/\1\:/gc<CR>`
nmap <Leader>h <CR>`

"format all
nmap <Leader>y mzgg=G`z

" airline
let g:airline_theme='gruvbox'
set laststatus=2
set showcmd                                                                     "show command line
let g:airline_powerline_fonts = 1                                               "Enable powerline fonts
let g:airline_theme = "gruvbox"                                                  "Set theme to powerline default theme
let g:airline_section_y = '%{substitute(getcwd(), expand("$HOME"), "~", "g")}'  "Set relative path
let g:airline#extensions#whitespace#enabled = 1                                 "Disable whitespace extension
let g:airline#extensions#tabline#enabled = 1                                    "Enable tabline extension
let g:airline#extensions#tabline#left_sep = ' '                                 "Left separator for tabline
let g:airline#extensions#tabline#left_alt_sep = '│'                             "Right separator for tabline

syntax enable                                                                   "syntax on
colorscheme gruvbox                                                             "gruvbox on
let g:enable_bold_font = 1                                                      "enable bold stuff
set background=dark                                                             "DO NOT REMOVE - BREAKS THEME
set t_Co=256                                                                    "256 color is dope
set cursorline                                                                  "Highlight current line
set tabstop=2                                                                   "tab stuff
set expandtab                                                                   "tab stuff
set shiftwidth=2
set cursorcolumn                                                                "highlight current column

set runtimepath^=~/.vim/bundle/ctrlp.vim                                        "ctrl-p - manually clones git repo
let g:ctrlp_show_hidden = 1
set backspace=indent,eol,start                                                  "ctrl-p - manually clones git repo

packadd! matchit

" configure line numbering
set ruler
set relativenumber
set number
nmap <silent> <C-m> :exec &nu==&rnu? "se nu!" : "se rnu!"<CR>
nmap <silent> <C-m> :exec &nu? "se nu! relativenumber!" : "se nu"<CR>


"splits remap
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

" mouse resize
:set mouse=n
:set ttymouse=xterm2

set splitbelow
set splitright

" NERDTree
let g:NERDTreeShowHidden = 1
let g:NERDTreeHighlightCursorline = 1
let g:NERDTreeMinimalUI = 1
let g:NERDTreeAutoDeleteBuffer = 1
let g:NERDTreeWinSize = 51

" Make sure NERDTree doesn't hijack <C-J>
let g:NERDTreeMapJumpNextSibling = ''

" NERDTree
nnoremap <Leader>t :NERDTreeToggle<CR>
nnoremap <Leader>T :NERDTreeFind<CR>

if executable('ag')
  let g:ackprg = 'ag --vimgrep'
endif

" fzf - fuzzy finding - Alex Gaman gave me all of this, blame him!
nmap <leader><tab> <plug>(fzf-maps-n)

" FZF
nnoremap <C-f> :GFiles<CR>
nnoremap <C-e> :FzfRg<CR>
nnoremap <C-a> :Buffers<CR>
" nnoremap <C-> :History<CR>
" nnoremap <C-t> :Tags<CR>

" FZF find with preview
command! -bang -nargs=* FzfRg
  \ call fzf#vim#grep(
  \ 'rg --column --line-number --no-heading --color=always .'.shellescape(<q-args>),
  \ 1,
  \ fzf#vim#with_preview({'options': '-d: -n3..'}, 'right:50%'), <bang>0)

"split in fidn
let g:fzf_action = {
  \ 'ctrl-s': 'split',
  \ 'ctrl-v': 'vsplit' }
let g:fzf_layout = { 'down': '~40%' }

"strip whitespace on save
" autocmd BufEnter * EnableStripWhitespaceOnSave

