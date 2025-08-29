# if [[ ":$FPATH:" != ":/home/sam/.zsh/completions:"* ]]; then export FPATH="/home/sam/.zsh/completions:$FPATH"; fi
export ZSH="$HOME/.oh-my-zsh"
# export XDG_CONFIG_HOME="$HOME"
# export PATH=/home/sam/.opencode/bin:$PATH
ZSH_THEME="norm"

plugins=(
  zsh-autosuggestions
  zsh-syntax-highlighting
  zsh-completions
  zsh-snippets
  fzf
  git
  # devbox
  asdf
)
source $ZSH/oh-my-zsh.sh

# [ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
source /usr/share/fzf/key-bindings.zsh
source /usr/share/fzf/completion.zsh
source /usr/share/zsh/plugins/zsh-vi-mode/zsh-vi-mode.plugin.zsh
# bindkey -v # Ensure vi-mode is enabled


bindkey -M viins '^R' fzf-history-widget
bindkey -M emacs '^R' fzf-history-widget
bindkey -M vicmd '^R' fzf-history-widget
# bindkey -v
# User configuration

export EDITOR="nvim"
export VISUAL="nvim"
bindkey -s '^o' 'urlview\n'
alias matrix="~/dotfiles/matrix.sh"
alias vmrss='function _vmrss(){ if [ -f /proc/$1/status ]; then grep VmRSS /proc/$1/status | awk "{printf \"%.2f MB\n\", $2 / 1024}"; else echo "Process with PID $1 not found."; fi }; _vmrss'
export PATH="$HOME/.cargo/bin:$PATH"
# export PATH=$PATH:/usr/local/go/bin
HISTFILE=~/.zsh_history
HISTSIZE=10000
SAVEHIST=10000
setopt appendhistory
export PATH=$HOME/.local/bin:$PATH
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
eval "$(zoxide init --cmd cd zsh)"
[ -s "$HOME/.config/envman/load.sh" ] && source "$HOME/.config/envman/load.sh"
# export PATH=$PATH:$HOME/go/bin
alias nuget='mono /usr/local/bin/nuget.exe'

# pnpm
export PNPM_HOME="/home/sam/.local/share/pnpm"
case ":$PATH:" in
  *":$PNPM_HOME:"*) ;;
  *)
    export PATH="$PNPM_HOME:$PATH"
    ;;
esac
# pnpm end
fpath=($HOME/.asdf/completions $fpath)
autoload -Uz compinit

# g eval "$(task --completion zsh)"
export PATH="$HOME/.local/share/lvim/mason/bin:$PATH"

[[ -s "/home/sam/.gvm/scripts/gvm" ]] && source "/home/sam/.gvm/scripts/gvm"
export PATH="$HOME/zig-linux-x86_64-0.15.0-dev:$PATH"
setopt extendedglob
autoload -U compinit; compinit


export ZSH_SYSTEM_CLIPBOARD_USE_WL_CLIPBOARD=true
source ~/.oh-my-zsh/custom/plugins/zsh-system-clipboard/zsh-system-clipboard.zsh
