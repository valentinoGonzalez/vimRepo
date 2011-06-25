" .vimrc File
" Maintained by: Valentino Gonzalez
" Very basic stuff, started from the file by 
" Jeffrey Way: https://github.com/JeffreyWay/My-Vim-Repo
" Now using pathogen and submodules for easier maintenance
" see: http://vimcasts.org/episodes/synchronizing-plugins-with-git-submodules-and-pathogen/

" Compatibility with Vi, nah
set nocompatible

runtime! autoload/pathogen.vim
silent! call pathogen#runtime_append_all_bundles()
silent! call pathogen#helptags()

" Enable filetypes
filetype on
filetype plugin on
filetype indent on
syntax on

" Avoid any kind of backup files
set nobackup
set nowritebackup
set noswapfile

" Write old file out when switching between files.
set autowrite

" Switch between buffers without saving
set hidden

" Show command in bottom right portion of the screen
set showcmd

" Show lines numbers
set number

" Display current cursor position in lower right corner.
set ruler

" Default Tab sizes
set tabstop=4
set shiftwidth=4
set softtabstop=4
set expandtab

" Indentation
set smartindent
set autoindent

" Always show the status line
set laststatus=2

" Set incremental searching
set incsearch

" Highlight searching
set hlsearch

" Case insensitive search
set ignorecase
set smartcase

" Enable code folding
set foldenable

" Hide mouse when typing
set mousehide

" Create dictionary for custom expansions
set dictionary+=$HOME/.vim/myDicts/myDict1.txt

" Split windows below the current window.
set splitbelow              

" Session settings
set sessionoptions=resize,winpos,winsize,buffers,tabpages,folds,curdir,help

" More useful command-line completion
set wildmenu

" Auto-completion menu
set wildmode=list:longest

" Commands dependent on autocmd
if has("autocmd")
    " Source the vimrc/gvimrc files after saving them. This way, you 
    " don't have to reload Vim to see the changes.
    autocmd bufwritepost .vimrc source $VIM_DIR/vimrc
    autocmd bufwritepost .gvimrc source $VIM_DIR/gvimrc

    " Automatically change current directory to that of the file in the buffer
    autocmd BufEnter * cd %:p:h
endif

" Change zen coding plugin expansion key to shift + e
let g:user_zen_expandabbr_key = '<C-e>'

" ------------------------ "
" NERDTREE PLUGIN SETTINGS "
" ------------------------ "
" Shortcut for NERDTreeToggle
nmap ,nt :NERDTreeToggle

" Show hidden files in NerdTree
let NERDTreeShowHidden=1

"------------------------------------------------------------ "
" SnipMate needs a little tweaking to read my custom snippets "
"------------------------------------------------------------ "
let g:snippets_dir = '$VIM_DIR/bundle/mySnippets/snippets/, $VIM_DIR/bundle/snipmate/snippets/'

"------------------------------------------------------------ "

" ####  MAPPINGS ###

"Map escape key to ii -- much faster
imap ii <esc>

" Saves time; maps the spacebar to colon
nmap <space> :

" Shortcut for editing  vimrc file in a new tab
nmap ,ev :tabedit $VIM_DIR/vimrc<cr>
nmap ,egv :tabedit $VIM_DIR/gvimrc<cr>

" Delete all buffers (via Derek Wyatt)
nmap <silent> ,da :exec "1," . bufnr('$') . "bd"<cr>

" Shortcut to imitate TextMate commenting. Requires T-Comment plugin
" This one works in case not in a Mac
map ,/ <c-_><c-_>

" Map code completion to , + tab
imap ,<tab> <C-x><C-o>

" Shortcut to fold tags with leader (usually \) + ft
nnoremap <leader>ft Vatzf

" Opens a vertical split and switches over (\v)
nnoremap <leader>v <C-w>v<C-w>l

" Hard-wrap paragraphs of text
nnoremap <leader>q gqip

" ---------- MAPPINGS END ------------------------------------------- "

" -------------------------------- "
" Some automatic Spelling corrects "
" -------------------------------- "
iab teh the
iab Teh The
iab redshit redshift
iab redshits redshifts
iab Redshit Redshift
iab Redshits Redshifts
" -------------------------------------------------------------------- "

" ---------------------- " 
" Helpeful abbreviations "
" ---------------------- " 
iab lorem Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.

iab llorem Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. 

" -------------------------------------------------------------------- "

" -------------------- "
" Latex specific Loads "
" -------------------- "
" these should probably be moved to a filetype thing...

" Set textwidth and wrapping properties when a .tex file is loaded
autocmd BufRead,BufNewFile *.tex setlocal wrap | setlocal textwidth=70 | setlocal spell spelllang=en_us

" Run latexmk in current file using latexmk
abbrev compile ! latexmk -pdfps -pv %:p<cr>
" Force it if necessary
abbrev fcompile ! latexmk -f -pdfps -pv %:p<cr>

" -------------------------------------------------------------------- "

