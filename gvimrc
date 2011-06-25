" These configuration option will be used if using the grahical
" interface

" The color scheme
colorscheme dusk

" I Prefer a slightly higher line height
set linespace=2

" Hide MacVim toolbar by default
set go-=T

" Shortcuts that only work on a Mac
let uname = substitute(system('uname'), '\n', '', '')
if uname == "Darwin"
    " Shortcut to imitate TextMate commenting. Requires T-Comment plugin
    map <D-/> <c-_><c-_>

    " Bubble single lines (kicks butt)
    " http://vimcasts.org/episodes/bubbling-text/
    nmap <M-D-Up> [e
    nmap <M-D-Down> ]e
    " Bubble multiple lines
    vmap <M-D-Down> ]egv
    vmap <M-D-Up> [egv

endif

" Font type and size, depends on resolution of machine
let hostname = substitute(system('hostname'), '\n', '', '')
if hostname == "antu.ucolick.org"
    set guifont=Monaco:h13
elseif hostname == "Valentino-Gonzalezs-MacBook-Pro.local"
    set guifont=Monaco:h12
endif

