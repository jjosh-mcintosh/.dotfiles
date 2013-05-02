" ----------------------------------------------------------------------------
" GUI Settings
" ----------------------------------------------------------------------------

set guioptions-=T               " Hide toolbar.
set guioptions-=l               " Don't show left scrollbar
set guioptions-=L               " Don't show left scrollbar
set guioptions-=r               " Don't show right scrollbar
set guioptions-=R               " Don't show right scrollbar

set guioptions+=aA              " Autoselect.
set guioptions+=c               " Use console dialogs

" Font family and font size.
"set guifont=Mensch\ for\ Powerline:h12
set guifont=Inconsolata-dz\ for\ Powerline:h12
"set guifont=Menlo\ for\ Powerline:h12
"set guifont=Meslo\ LG\ S:h12

set antialias                   " MacVim: smooth fonts.

if has('mouse')
    set mouse=a                 " Enable mouse usage (all modes) in terminal
endif


