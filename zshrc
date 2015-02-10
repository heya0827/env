export LANG=ja_JP.UTF-8
#export PATH=~/bin:/sbin:/usr/sbin:$PATH

[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm" # Load RVM into a shell session *as a function*

# ---------------------------------------
# Lines configured by zsh-newuser-install
# ---------------------------------------
HISTFILE=~/.zhistory
HISTSIZE=1000000
SAVEHIST=1000000

setopt hist_ignore_all_dups # ignore duplication command history list(all)
setopt hist_ignore_dups     # ignore duplication command history list
setopt hist_save_no_dups
setopt hist_reduce_blanks
setopt extended_history     # 履歴ファイルに時刻を記録
setopt share_history        # share command history data 
setopt inc_append_history

bindkey -v
#zle-line-init() { zle -K vicmd; } ; zle -N zle-line-init # 初期状態をコマンドモード

autoload history-search-end
zle -N history-beginning-search-backward-end history-search-end
zle -N history-beginning-search-forward-end history-search-end
bindkey "^P" history-beginning-search-backward-end
bindkey "^N" history-beginning-search-forward-end 

# ----------------------
# コマンドラインスタック
# ----------------------
setopt noflowcontrol
bindkey "^Q" vi-cmd-mode
bindkey "^S" push-input
bindkey -a "H" run-help

# ---------------------------------------------
# The following lines were added by compinstall
# ---------------------------------------------
zstyle ':completion:*' list-colors 'di=;34;1' 'ln=;36;1' 'so=;32;1' 'ex=32;1' 'bd=46;34' 'cd=43;34'

autoload -Uz compinit
compinit -u

# ----------
# zsh editor
# ----------
autoload zed

# ------
# Prompt
# ------

autoload colors
colors

setopt prompt_subst

if [ ${STY} ]; then
    screen_no="No.${WINDOW} "
else
    screen_no=""
fi
PROMPT="${fg_bold[cyan]}%D{%Y/%m/%d %H:%M:%S} ${screen_no}%/${reset_color}"$'\n'"%# "

PROMPT2="%_%% "
SPROMPT="%r is correct? [n,y,a,e]: " 

#precmd() {
#   echo -ne "\033]0;${USER}@${HOST%%.*}:${PWD}\007"
##  [ ${STY} ] && echo -ne "\ek$(basename $(pwd))\e\\"
#}

#preexec() {
##  [ ${STY} ] && echo -ne "\ek${1%% *}\e\\"
#   [ ${STY} ] && echo -ne "\ek$1\e\\"
#}

#chpwd() {
#   ls
#}

# -------
# Options
# -------

setopt auto_cd
setopt auto_pushd
setopt cdable_vars
setopt pushd_ignore_dups
setopt list_packed
setopt noautoremoveslash
setopt nolistbeep
setopt extended_glob
setopt hist_ignore_space
setopt complete_aliases

# -------
# Aliases
# -------
alias ls='ls -F --show-control-chars --color'
alias l='ls -lh'
alias la='l -A'
alias lt='l -t|head'

alias cp='cp -p'
alias less='less -r'
alias grep='grep --color'
alias h='history -i 1'
alias df='df -h'
alias du='du -h'
alias dirs='dirs -v'
alias pstree='pstree -ap'
alias updatedb="updatedb --localpaths='/' --prunepaths='/cygdrive /proc'"

alias comp='cygstart "Z:\bin\df141\df.exe"'

alias -s pdf=pdf

# --------
# Function
# --------

color() {
    key_word = $1
    sed -e 's/key_word/\x1b[31m&\x1b\[0m/g'
}

edit() {
    dir=`dirname $1`
    file=`basename $1`
    
    cd $dir
    cygstart "C:\Program Files (x86)\sakura\sakura.exe" $file
    cd -
}

gvim() {
    dir=`dirname $1`
    file=`basename $1`
    
    cd $dir
    cygstart "C:\Users\heya\Downloads\install\vim73-kaoriya-win64\gvim.exe" $file
    cd -
}

pdf() {
    dir=`dirname $1`
    file=`basename $1`
    
    cd $dir
    cygstart "C:\Program Files\Adobe\Reader 8.0\Reader\AcroRd32.exe" $file
    cd -
}

