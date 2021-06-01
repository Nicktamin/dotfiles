" #### Vim Configfile

" Set encoding
set encoding=UTF-8

" Set colour
if !has('gui_running')
      set t_Co=256
  endif

" Act like vi improved, not like vi
set nocompatible

" Set filetype to on for Nerdcommentor
filetype plugin on

" Set Leader for Keybinds
let mapleader = ","

" Show line numbers dynamicly
set number relativenumber

augroup numbertoggle
    autocmd!
    autocmd BufEnter,FocusGained,InsertLeave * set relativenumber
    autocmd BufLeave,FocusLost,InsertEnter   * set norelativenumber
augroup END

" Show the current line of the cursor
set cursorline

" Sets how many lines of history VIM has to remember
set history=700

" Set to auto read when a file is changed from the outside
set autoread

" Always show current position
set ruler

" Ignore case when searching
set ignorecase

" When searching try to be smart about cases 
set smartcase

" Highlight search results
set hlsearch

" Makes search act like search in modern browsers
set incsearch

" For regular expressions turn magic on
set magic

" Enable syntax highlighting
syntax enable

" Use Unix as the standard file type
set ffs=unix,dos,mac

" Turn backup off, since most stuff is in SVN, git et.c anyway...
"set nobackup
"set nowb
set noswapfile

" Use spaces instead of tabs
set expandtab

" Be smart when using tabs
set smarttab

" 1 tab == 4 spaces
set shiftwidth=4
set tabstop=4

" Treat long lines as break lines (useful when moving around in them)
map j gj
map k gk

" Always show the status line
set laststatus=2

" Remove mode information
set noshowmode

" Provides tab-completion for all file-related tasks
set path+=**

" Display all matching files when we tab complete
set wildmenu

" Create the `tags` file (may need to install ctags first)
 command! MakeTags !ctags -R .

" Enable persistent undo so that undo history persists across vim sessions
set undofile
set undodir=~/.vim/undo

" Key Mapping for UndoTree
nnoremap <F5> :UndotreeToggle<CR>
nnoremap <C-u> :UndotreeShow<CR>

"Keybind for NerdTree
nnoremap <leader>n :NERDTreeFocus<CR>
nnoremap <C-n> :NERDTree<CR>
nnoremap <C-t> :NERDTreeToggle<CR>
nnoremap <C-f> :NERDTreeFind<CR>

" Auto install Vim-Plug
if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

" Specify a directory for plugins
" - For Neovim: stdpath('data') . '/plugged'
" - Avoid using standard Vim directory names like 'plugin'
call plug#begin('~/.vim/plugged')

" Make sure you use single quotes

" Graphical undo
Plug 'mbbill/undotree'

" Help promt for Vim-Plug
Plug 'junegunn/vim-plug'

" Vim sugar for the UNIX shell commands
Plug 'tpope/vim-eunuch'

" A light and configurable statusline/tabline plugin
Plug 'itchyny/lightline.vim'

" Vim plugin for Git, so awesome, it should be illegal
Plug 'tpope/vim-fugitive'

" Comment functions so powerful—no comment necessary
Plug 'preservim/nerdcommenter'

" File system explorer for the Vim editor
Plug 'preservim/nerdtree'

" All about surroundings
Plug 'tpope/vim-surround'

" Visually displaying indent levels
Plug 'nathanaelkane/vim-indent-guides'

" A plugin of NERDTree showing git status flags
Plug 'xuyuanp/nerdtree-git-plugin'

" Adds syntax for nerdtree
Plug 'tiagofumo/vim-nerdtree-syntax-highlight'

" Adds fuzzyfind
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }

" !!!NEEDS TO BE LAST!!! Icons for Nerdtree
Plug 'ryanoasis/vim-devicons'

" Initialize plugin system
call plug#end()

" Close Nerdtree when opening a file
let NERDTreeQuitOnOpen = 1

" Minimize Nerdtree clutter
let NERDTreeMinimalUI = 1
let NERDTreeDirArrows = 1
let NERDTreeShowHidden= 1

" Start NERDTree when Vim is started without file arguments.
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists('s:std_in') | NERDTree | endif

" Exit Vim if NERDTree is the only window left.
autocmd BufEnter * if tabpagenr('$') == 1 && winnr('$') == 1 && exists('b:NERDTree') && b:NERDTree.isTabTree() | quit | endif
