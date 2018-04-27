alias ls='ls --color' #I like color
alias l='ls -lFh'     #size,show type,human readable
alias la='ls -lAFh'   #long list,show almost all,show type,human readable
alias lr='ls -tRFh'   #sorted by date,recursive,show type,human readable
alias lt='ls -ltFh'   #long list,sorted by date,show type,human readable
alias ,='ls'
alias ,='la'

# cd .. is a LOT of work!
alias ..='cd ../../; ls'
alias ...='cd ../../../; ls'
alias ....='cd ../../../../; ls'

# spawns new xterm in the current directory. 
alias fork='nohup xterm -e zsh > /dev/null 2>&1 &'
alias g='git'
alias psmem='ps aux --sort=%mem'
alias swisshelp='vim ~/.oh-my-zsh/plugins/swissknife/swissknife.plugin.zsh'

lbn() {`npm-which babel-node` ${1}}

# find files recursively, ignore case 
ff () { find ./ -iname "*${1}*" }

# grep recursively, case insensitive (to me, this is default)
gg () {
        grep --color=auto --exclude-dir={.bzr,CVS,.git,.hg,.svn,node_modules,build} -ir "${1}" *
}

# grep recursively, case sensitive (gc = Grep, Case)
gc () { grep -r "${1}" * }

# grep and search combined ftw (gs = Grep in Search results)
# example: "gs .php todo" finds all todos in all .php files (well, it also matches sth.php.js)
gs () { find ./ -iname "*${1}*" -exec grep -iH "${2}" \{\} \; }

# 'cd' is one character too long. Also, after cd you usually want to know, where you are, so ls comes
# handy
function c() { cd "$@"; ls}

function v() { vim "$@"; ls}

magic-enter () {
        if [[ -z $BUFFER ]]
        then
                cd ../; echo; ls
                zle accept-line
        else
                zle accept-line
        fi
}

zle -N magic-enter
bindkey "^M" magic-enter
