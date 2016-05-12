"NeoBundle Scripts-----------------------------
if has('vim_starting')
  if &compatible
    set nocompatible               " Be iMproved
  endif

  " Required:
  set runtimepath+=/Users/rmalik/.vim/bundle/neobundle.vim/
endif

" Required:
call neobundle#begin(expand('/Users/rmalik/.vim/bundle'))

" Let NeoBundle manage NeoBundle
" Required:
NeoBundleFetch 'Shougo/neobundle.vim'

" Add or remove your Bundles here:
NeoBundle 'Shougo/neosnippet.vim'
NeoBundle 'Shougo/neosnippet-snippets'
NeoBundle 'tpope/vim-fugitive'
NeoBundle 'ctrlpvim/ctrlp.vim'
NeoBundle 'flazz/vim-colorschemes'
NeoBundle 'wincent/command-t'
NeoBundle 'scrooloose/nerdcommenter'
NeoBundle 'nvie/vim-flake8'
NeoBundle 'tell-k/vim-autopep8'
NeoBundle 'Valloric/YouCompleteMe'
NeoBundle 'uarun/vim-protobuf'
NeoBundle 'solarnz/arcanist.vim'
NeoBundle 'elzr/vim-json'

" You can specify revision/branch/tag.
NeoBundle 'Shougo/vimshell', { 'rev' : '3787e5' }

" Required:
call neobundle#end()

" Required:
filetype plugin indent on

" If there are uninstalled bundles found on startup,
" this will conveniently prompt you to install them.
NeoBundleCheck
"End NeoBundle Scripts-------------------------


"Generally Helpful settings
syntax on " Enable syntax highlighting
set nu! " Show line numbers
set textwidth=79  " lines longer than 79 columns will be broken
set encoding=utf8 " Set utf8 as standard encoding and en_US as the standard language
set shiftwidth=4  " operation >> indents 4 columns; << unindents 4 columns
set tabstop=4     " a hard TAB displays as 4 columns
set expandtab     " insert spaces when hitting TABs
set softtabstop=4 " insert/delete 4 spaces when hitting a TAB/BACKSPACE
set shiftround    " round indent to multiple of 'shiftwidth'
set autoindent    " align the new line indent with the previous line
set ignorecase
set smartcase
set incsearch
set hlsearch " Highlight search results
set lazyredraw " Don't redraw while executing macros (good performance config)
set magic " For regular expressions turn magic on
set showmatch " Show matching brackets when text indicator is over them
set autoread " Set to auto read when a file is changed from the outside
set ruler "Always show current position

" No annoying sound on errors
set noerrorbells
set novisualbell
set t_vb=
set tm=500

" Don't redraw while executing macros (good performance config)
set lazyredraw


" => Files, backups and undo
" Turn backup off, since most stuff is in SVN, git et.c anyway...
set nobackup
set nowb
set noswapfile



" Simpler way to switch between vertical / horizontal splits
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

" Open new split panes to right and bottom, which feels more natural than Vim’s
" default
set splitbelow
set splitright


autocmd BufWritePre * :%s/\s\+$//e " Remove trailing whitespace on save
autocmd BufWritePost *.py call Flake8()
"
" Return to last edit position when opening files (You want this!)
autocmd BufReadPost *
     \ if line("'\"") > 0 && line("'\"") <= line("$") |
     \   exe "normal! g`\"" |
     \ endif
