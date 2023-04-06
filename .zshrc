# alias config='/usr/bin/git --git-dir=/Users/asif/dev/dotfiles --work-tree=/Users/asif'

export LANG=en_US.UTF-8
export LANGUAGE=en_US.UTF-8
export LC_ALL=en_US.UTF-8

#export GOPATH=~/dev/go
#export PATH=$PATH:$(go env GOPATH)/bin

export PATH=$PATH:~/dev/flutter/bin
export PATH=$PATH:$HOME/.pub-cache/bin
# export PATH=$PATH:/Users/asif/Library/Python/3.9/bin/locust
export PATH="$HOME/.cargo/bin:$PATH"

# export PUPPETEER_SKIP_CHROMIUM_DOWNLOAD=true
# export PUPPETEER_EXECUTABLE_PATH="/Applications/Google Chrome.app/Contents/MacOS/Google Chrome"

# If you come from bash you might have to change your $PATH.
#Loads the Starship Prompt
eval "$(starship init zsh)"
eval "$(zoxide init zsh)"
eval "$(rbenv init - zsh)"

# General Aliases
alias tf="fd --type f --hidden --exclude .git | fzf-tmux -p | xargs nvim"
alias nf="fd --type f --hidden --exclude .git | fzf | xargs nvim"
alias ..="cd .."
alias gitauth="ssh-add --apple-use-keychain ~/.ssh/id_ed25519"

alias mknvmrc="node --version > .nvmrc"

alias ~=" cd ~"
alias v="nvim"
alias n="nvim"
alias nrc="nvim ~/.config/nvim/init.lua"
alias ~="cd ~"
alias zrc="nvim ~/.zshrc"
alias vrc="nvim ~/.vimrc"
alias c="clear"
alias kbssh="ssh -t root@68.183.80.200"
alias szrc="source ~/.zshrc"
alias l="exa -laF --git --git-ignore --no-user --group-directories-first --icons"
alias lt="exa -lDT --git-ignore --no-user"
alias lg="exa -laFG --git-ignore --no-user --group-directories-first"
alias ld="exa -lD --git-ignore --no-user"
alias python='python3'

#Brew Aliases
alias bu="brew upgrade && brew update && brew cleanup"
alias bl="brew ls"

# Git Aliasesa
alias gi="lazygit"
alias gs="git status"
alias gpa="git push -u origin --all"
alias gpm="git push -u origin master"
alias gpd="git push -u origin develop"
alias gcm="git checkout main"
alias gcd="git checkout develop"
alias gmd="git merge develop"
alias gupd="gcm && gmd && gpa && gcd"
alias ga="git add ."
alias gst="git stash"
alias gstd="git stash drop"
alias gstp="git stash pop"
alias gcom="git commit -m"

#tmux
alias mxn="tmux -2 new -s"
alias mxk="tmux kill-session -t"
alias mxl="tmux ls"
alias mxa="tmux -2 a -t"
alias mxconf="v ~/.tmux.conf"
alias mxsrc="tmux source ~/.tmux.conf"

#elxir
# alias elcon="docker run -it --rm elixir"
# alias elbash="docker run -it --rm elixir bash"
alias supatypes="npx supabase gen types typescript --project-id "sqtnxtyswztlpiwembfr" > src/types.ts"

export EDITOR='neovim'

# Load Zsh Plugins
source /opt/homebrew/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
source /opt/homebrew/share/zsh-autosuggestions/zsh-autosuggestions.zsh


  export NVM_DIR="$HOME/.nvm"
  [ -s "/opt/homebrew/opt/nvm/nvm.sh" ] && \. "/opt/homebrew/opt/nvm/nvm.sh"  # This loads nvm
  [ -s "/opt/homebrew/opt/nvm/etc/bash_completion.d/nvm" ] && \. "/opt/homebrew/opt/nvm/etc/bash_completion.d/nvm"  # This loads nvm bash_completion

autoload -U add-zsh-hook
load-nvmrc() {
  local node_version="$(nvm version)"
  local nvmrc_path="$(nvm_find_nvmrc)"

  if [ -n "$nvmrc_path" ]; then
    local nvmrc_node_version=$(nvm version "$(cat "${nvmrc_path}")")

    if [ "$nvmrc_node_version" = "N/A" ]; then
      nvm install
    elif [ "$nvmrc_node_version" != "$node_version" ]; then
      nvm use
    fi
  elif [ "$node_version" != "$(nvm version default)" ]; then
    echo "Reverting to nvm default version"
    nvm use default
  fi
}
add-zsh-hook chpwd load-nvmrc
load-nvmrc

# The next line updates PATH for the Google Cloud SDK.
# if [ -f '/Users/asif/google-cloud-sdk/path.zsh.inc' ]; then . '/Users/asif/google-cloud-sdk/path.zsh.inc'; fi

# The next line enables shell command completion for gcloud.
# if [ -f '/Users/asif/google-cloud-sdk/completion.zsh.inc' ]; then . '/Users/asif/google-cloud-sdk/completion.zsh.inc'; fi
# export PATH="/opt/homebrew/opt/openjdk/bin:$PATH"
# export CPPFLAGS="-I/opt/homebrew/opt/openjdk/include"

# pnpm
# export PNPM_HOME="/Users/asif/Library/pnpm"
# case ":$PATH:" in
  # *":$PNPM_HOME:"*) ;;
  # *) export PATH="$PNPM_HOME:$PATH" ;;
# esac
# pnpm end
