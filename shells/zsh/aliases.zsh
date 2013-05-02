# grc overides for ls
#   Made possible through contributions from generous benefactors like
#   `brew install coreutils`
if $(gls &>/dev/null || ls --color=auto &>/dev/null)
then
  alias ls="ls -F --color"
  alias l="ls -lAh --color"
  alias ll="ls++ --potsf"
  alias la='ls -A --color'
fi

# to kill off sudo rights
alias skill="sudo -k"

# what's connected?
alias net-processes='sudo netstat -tulp'

# psc, or cgroups (I think?)
alias psc='ps xawf -eo pid,user,cgroup,args'

alias emacs='emacs -nw'
