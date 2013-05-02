"Enable filetypes
set nocp
filetype plugin indent on

set history=50
set suffixes=.bak,~,.swp,.o,.info,.aux,.log,.dvi,.bbl,.blg,.brf,.cb,.ind,.idx,.ilg,.inx,.out,.toc

set ffs=unix,dos,mac            " Support these files
set isk+=_,$,@,%,#,-            " None word dividers
set viminfo='1000,f1,:100,@100,/20
set modeline                    " Make sure modeline support is enabled
set autoread                    " Reload the files if they changed on disk
set tabpagemax=50               " Open 50 tabs max
set encoding=utf-8              " Always use UTF-8 by default
set timeoutlen=500              " Timeout between key command combos

set nobackup                    " do not keep backups after close
set nowritebackup               " do not keep a backup while working
set noswapfile                  " don't keep swp files either
set backupdir=$HOME/.vim/backup " store backups under ~/.vim/backup
set backupcopy=yes              " keep attributes of original file
set backupskip=/tmp/*,/private/tmp/*,$TMPDIR/*,$TMP/*,$TEMP/*
set directory=~/.vim/swap,~/tmp,.
