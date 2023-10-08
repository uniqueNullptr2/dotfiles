if [ "$TMUX" = "" ]; then tmux; fi

# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# Created by newuser for 5.9
eval "$(starship init zsh)"
source ~/powerlevel10k/powerlevel10k.zsh-theme

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

export GOPATH="$HOME/go"
export GOBIN="$HOME/go/bin"

path+=($HOME'/.cargo/bin')
path+=("$HOME/.local/bin")
path+=($GOBIN)

export PATH
export TERM=xterm-256color

HISTFILE=~/.zhistory
HISTSIZE=10000
SAVEHIST=10000
setopt share_history
export PROMPT_COMMAND="history -a"

alias exa="exa -l"
alias ls="ls -lh"
alias ncon="nordvpn connect Netherlands && nordvpn set killswitch true && nordvpn set autoconnect true"
alias ndis="nordvpn set killswitch false && nordvpn set autoconnect false && nordvpn disconnect"
alias cargo="cargo mommy"
alias gcc32='gcc -no-pie -m32 -fno-stack-protector -z execstack'
alias vaoff='echo 0 | sudo tee /proc/sys/kernel/randomize_va_space'
alias vaon='echo 2 | sudo tee /proc/sys/kernel/randomize_va_space'
