set nocompatible
if empty(glob('~/.vim/autoload/plug.vim'))
          silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
              \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
            autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
    endif
call plug#begin('~/.vim/bundle')
Plug 'vim-syntastic/syntastic'
Plug 'junegunn/vim-plug'
Plug 'keith/swift.vim'
Plug 'flazz/vim-colorschemes'
Plug 'vim-airline/vim-airline'
Plug 'scrooloose/nerdtree'
Plug 'vimwiki/vimwiki'
call plug#end()


if has("vms")
  set nobackup          " do not keep a backup file, use versions instead
else
    set backup            " keep a backup file (restore to previous version)              
    set undofile          " keep an undo file (undo changes after closing)
endif
set history=50          " keep 50 lines of command line history
set ruler               " show the cursor position all the time
set showcmd             " display incomplete commands

set backspace=indent,eol,start
set number          " line numbers
set tabstop=4       " visual tab count
set softtabstop=4   " actual space count per tab
imap jj <esc>
set expandtab       " tabs are spaces
set cursorline      " line appears at cursor location
set showmatch       " highlights matching parenthesis
set incsearch       " search as characters are entered
set hlsearch        " highlight search matches
nnoremap <leader><space> :nohlsearch<CR>
set wildmenu        " visual autocomplete for command menu
set nocompatible
filetype plugin on



set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0


let g:syntastic_swift_checkers = ['swiftpm', 'swiftlint']
set background=dark
colorscheme gruvbox

autocmd FileType text setlocal textwidth=78
autocmd vimenter * NERDTree

autocmd BufReadPost *
    \ if line("'\"") >= 1 && line("'\"") <= line("$") |
    \   exe "normal! g`\"" |
    \ endif


map <C-n> :NERDTreeToggle<CR>
