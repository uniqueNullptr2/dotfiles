# if [ "$TMUX" = "" ]; then tmux; fi

# Created by newuser for 5.9
eval "$(starship init zsh)"

export GOPATH="$HOME/go"
export GOBIN="$HOME/go/bin"

path+=($HOME'/.cargo/bin')
path+=("$HOME/.local/bin")
path+=("/opt/zig")
path+=($GOBIN)

export PATH
export TERM=xterm-256color

HISTFILE=~/.zhistory
HISTSIZE=10000
SAVEHIST=10000
setopt share_history
export PROMPT_COMMAND="history -a"

# create a zkbd compatible hash;
# to add other keys to this hash, see: man 5 terminfo
typeset -g -A key

key[Home]="$terminfo[khome]"
key[End]="$terminfo[kend]"
key[Insert]="$terminfo[kich1]"
key[Backspace]="$terminfo[kbs]"
key[Delete]="$terminfo[kdch1]"
key[Up]="$terminfo[kcuu1]"
key[Down]="$terminfo[kcud1]"
key[Left]="$terminfo[kcub1]"
key[Right]="$terminfo[kcuf1]"
key[PageUp]="$terminfo[kpp]"
key[PageDown]="$terminfo[knp]"

# setup key accordingly
[[ -n "$key[Home]"      ]] && bindkey -- "$key[Home]"      beginning-of-line
[[ -n "$key[End]"       ]] && bindkey -- "$key[End]"       end-of-line
[[ -n "$key[Insert]"    ]] && bindkey -- "$key[Insert]"    overwrite-mode
[[ -n "$key[Backspace]" ]] && bindkey -- "$key[Backspace]" backward-delete-char
[[ -n "$key[Delete]"    ]] && bindkey -- "$key[Delete]"    delete-char
[[ -n "$key[Up]"        ]] && bindkey -- "$key[Up]"        up-line-or-history
[[ -n "$key[Down]"      ]] && bindkey -- "$key[Down]"      down-line-or-history
[[ -n "$key[Left]"      ]] && bindkey -- "$key[Left]"      backward-char
[[ -n "$key[Right]"     ]] && bindkey -- "$key[Right]"     forward-char

# Finally, make sure the terminal is in application mode, when zle is
# active. Only then are the values from $terminfo valid.
if (( ${+terminfo[smkx]} )) && (( ${+terminfo[rmkx]} )); then
    function zle-line-init () {
        echoti smkx
    }
    function zle-line-finish () {
        echoti rmkx
    }
    zle -N zle-line-init
    zle -N zle-line-finish
fi

alias ll="eza -l"
alias cargo="cargo mommy"
alias gcc32='gcc -no-pie -m32 -fno-stack-protector -z execstack'
alias vaoff='echo 0 | sudo tee /proc/sys/kernel/randomize_va_space'
alias vaon='echo 2 | sudo tee /proc/sys/kernel/randomize_va_space'
alias con_home="sudo systemctl start wg-quick@wg1"
alias dcon_home="sudo systemctl stop wg-quick@wg1"
alias mount_home="sudo mount -t cifs -o rw,uid=erika,gid=erika,user=rika //nas.foxhome.club/NASSI /mnt/nas"
alias umount_home="sudo umount /mnt/nas"

export CARGO_MOMMYS_LITTLE="girl/fox/doll"
export CARGO_MOMMYS_MOODS="chill/thirsty"

# source $HOME/.zsh-local

function dls(){ docker container ls -a --format 'table | {{printf "%-25s" .Names}} | {{printf "%-25s" .Status}} | {{printf "%-40.40s" .Ports}} |\n----------------------------------------------------------------------------------------------------'; }
