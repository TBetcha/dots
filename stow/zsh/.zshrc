# Fig pre block. Keep at the top of this file.zsh
[[ -f "$HOME/.fig/shell/zshrc.pre.zsh" ]] && builtin source "$HOME/.fig/shell/zshrc.pre.zsh"
# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
 
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
 source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

#########
# PATH #
#########

# all the kids are doing it
export EDITOR="nvim"

# Home dir
export XDG_CONFIG_HOME=$HOME/.config
 
export PATH=$HOME/bin:/usr/local/bin:$PATH

export PATH=$PATH:/usr/local/share/dotnet/dotnet
export PATH=$PATH:~/.dotnet
export DOTNET_ROOT=$HOME/.dotnet
export PATH=$PATH:$DOTNET_ROOT:$DOTNET_ROOT/tools

export PATH=$PATH:~/.config/scripts/bin_scripts
export PATH=$PATH:~/.config/scripts

export PATH=/opt/homebrew/bin:$PATH
export PATH=/opt/homebrew/sbin:$PATH

export PATH="$PATH:/Users/tmb/kafka_2.13-3.4.0/bin"

export PROTOC=/opt/homebrew/bin/protoc
export PROTOC_INCLUDE=/opt/homebrew/include

export ZSH="/Users/tmb/.oh-my-zsh"



export BAT_THEME="TwoDark"


# all the kids are doing it
export EDITOR="nvim"

# Unused old exports
#TMUX 
# export TMUX=$HOME/.tmux.conf
#export TMUX_DIR=$HOME/.tmux
#export PATH=$PATH:~/.dotnet/tools
#
# Change to use dotnet versions
#export PATH="/opt/homebrew/opt/dotnet@7/bin:$PATH"
# I configured to show
#export PATH="$PATH:/opt/homebrew/opt/dotnet@7/bin" 
#export PATH="$PATH:/opt/homebrew/opt/dotnet@6/bin"

ZSH_THEME="amuse"

# Set list of themes to pick from when loading at random
# Setting this variable when ZSH_THEME=random will cause zsh to load
# a theme from this variable instead of looking in $ZSH/themes/
# If set to an empty array, this variable will have no effect.
# ZSH_THEME_RANDOM_CANDIDATES=( "robbyrussell" "agnoster" )

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion.
# Case-sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# DISABLE_AUTO_UPDATE="true"
# DISABLE_UPDATE_PROMPT="true"
# export UPDATE_ZSH_DAYS=13
# DISABLE_LS_COLORS="true"
#
DISABLE_AUTO_TITLE="true"
# ENABLE_CORRECTION="true"
# DISABLE_UNTRACKED_FILES_DIRTY="true"
#
# Uncomment the following line if pasting URLs and other text is messed up.
# DISABLE_MAGIC_FUNCTIONS="true"

 COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# You can set one of the optional three formats:
# "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# or set a custom format using the strftime function format specifications,
# see 'man strftime' for details.
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load?
# Standard plugins can be found in $ZSH/plugins/
# Custom plugins may be added to $ZSH_CUSTOM/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(git docker docker-compose battery colorize dirhistory direnv macos fzf sudo fzf-zsh-plugin k fd vi-mode)

source $ZSH/oh-my-zsh.sh


# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
if [[ -n $SSH_CONNECTION ]]; then
 export EDITOR='nvim'
else
 export EDITOR='mvim'
fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

##############
# FUNCTIONS #
##############

# Pretty prints the disk space of the given directory
function ds() {
  if [ $# -eq 0 ]; then
    echo "Usage: disk_space_usage <directory>"
    return 1
  fi

  directory="$1"

  if [ ! -d "$directory" ]; then
    echo "Error: '$directory' is not a valid directory."
    return 1
  fi

  # Get the disk usage in human-readable format and extract the size
  disk_usage=$(du -sh "$directory" | awk '{print $1}')

  # Define colors (you can customize these)
  green="\033[0;32m"
  reset_color="\033[0m"

  # Print the disk usage with colored output
  echo -e "Disk usage for '$directory': ${green}$disk_usage${reset_color}"
}

# See what is runnin on what port
function port () {
  sudo lsof -i -n -P | grep TCP | grep "$PORT"
}

# Creates a dir and CD into it
function take () {
  mkdir "$1"
  cd "$1"
}

# Fancy find shit
function findme {
     rg --line-number --no-heading --color=always --smart-case "$1" | fzf -d ':' -n 2.. --ansi --no-sort --preview-window 'right:70%:+{2}' --preview 'bat --style=numbers --color=always --highlight-line {2} {1}'
}

function start_shell {
    ECHO "Tbetcha" | figlet | ~/.config/scripts/color_it.sh 75
}

 
#########################
# OPERATIONAL ALIASES #
#########################

# CD
alias ..="cd ../"
alias ...="cd ../../"
alias ....="cd ../../../"

#Editor
alias vim="nvim"
alias vi="nvim"
alias n="nvim"
alias v="nvim"

#Tmux
# alias tmux=tmux -f "/opt/homebrew/bin/tmux"
alias tx="tmux"
alias txk="tmux kill-server"
alias txks="tmux kill-session -t"
alias txas="tmux attach-session -t"
alias txds="tmux detach -s"
alias txns="tmux new -s"
alias txnds="tmux new -d -s" 

#Programs
alias ld="lazydocker"
alias lg="lazygit"
alias cat="ccat"
alias ls="lsd -al ."
alias lt="lsd --tree"
alias search="findme"
alias stow="stow --target $HOME"

#Git
alias g="git"
alias ga="git add"
alias gs="git status"
alias gc="git commit -m"
alias gd="git diff"
alias gps="git push"
alias gpl="git pull"
alias gcreds="ssh-add --apple-use-keychain ~/.ssh/id_ed25519"
alias gempty="git commit --allow-empty -m 'empty'"
alias gch="git checkout"
alias glog='g log --graph --pretty='\''%C(yellow)%h%Creset%C(auto)%d%Creset %s %Cgreen%cr %C(bold blue)%an%Creset'\'''

#Dots
alias usezsh="nvim ~/.dotfiles/stow/zsh/.zshrc"
alias omz="~/.oh-my-zsh"
alias dots="nvim ~/.dotfiles/stow"
alias dotfiles="cd ~/.dotfiles/stow"
alias fishdot="$EDITOR ~/.dotfiles/stow/fish/.config/fish"
alias kittydot="$EDITOR ~/.dotfiles/stow/kitty/.config/kitty/kitty.conf"
alias yabaidot="$EDITOR ~/.dotfiles/stow/yabai/.config/yabai/yabairc"
alias skhddot="$EDITOR ~/.dotfiles/stow/skhd/.config/skhd/skhdrc"
alias sketchdot="$EDITOR ~/.dotfiles/stow/sketchybar/.config/sketchybar/"
alias scripts="$EDITOR ~/.dotfiles/stow/scripts/.config/scripts/"

#Processes
alias nst="npm start"
alias nserve="npm run serve"
alias nserver="npm run server"
alias nstart="npm run start"
alias jup="jupyter notebook"
alias vs="code-insiders ./"
alias watch="dotnet watch run"
alias zoostart="~/kafka34/bin/zookeeper-server-start.sh ~/kafka34/config/zookeeper.properties"
alias kafkastart="~/kafka34/bin/kafka-server-start.sh ~/kafka34/config/server.properties"
alias styabai="yabai --start-service && skhd --start-service"
alias reyabai="yabai --restart-service && skhd --restart-service"
alias stopyabai="yabai --stop-service && skhd --stop-service"
alias skres="brew services restart sketchybar"
alias skstart="brew services start sketchybar"
alias skstop="brew services stop sketchybar"


#################
# DMG ALIASES #
#################

alias rocks="rm -rf bin/Debug/net7.0/rocksdb/ && rm -rf rocksdb"
alias dmg="cd ~/code/dmg"
alias leapi="cd ~/code/dmg/LegacyProviderOnboarding/API/dmg.legacy-provider-onboarding-app.api"
alias lestate="cd ~/code/dmg/LegacyProviderOnboarding/State/dmg.legacy-provider-onboarding-app.state"
alias meapi="cd ~/code/dmg/Members/API/dmg.providerorg-member-edit-app.api"
alias mestate="cd ~/code/dmg/Members/State/dmg.providerorg-member-edit-app.state"
alias csapi="cd ~/code/dmg/CompanySettings/API/dmg.providerorg-profile-edit-app.api"
alias csstate="cd ~/code/dmg/CompanySettings/State/dmg.providerorg-profile-edit-app.state"
alias opapi="cd ~/code/dmg/Opportunities/API/dmg.opportunity-app.api"
alias opstate="cd ~/code/dmg/Opportunities/State/dmg.opportunity-app.state"
alias neapi="cd ~/code/dmg/NewProviderOnboarding/API/dmg.new-provider-onboarding-app.api"
alias apapi="cd ~/code/dmg/ApprovalDashboard/API/dmg.approval-dashboard-app.api"
alias apstate="cd ~/code/dmg/ApprovalDashboard/State/dmg.approval-dashboard-app.state"
alias apmat="cd ~/code/dmg/ApprovalDashboard/Materializer/dmg.approval-dashboard-app.materializer"
alias invite="cd ~/code/dmg/inviteMember/dmg.providerorg-invite-member.api"
alias master="cd ~/code/dmg/Provider/Master/dmg.provider.master"
alias maapi="cd ~/code/dmg/Provider/API/dmg.provider.api"
alias teapi="cd ~/code/dmg/TechnicianApp/API/dmg.technician-app.provider-api"
alias testate="cd ~/code/dmg/TechnicianApp/State/dmg.technician-app.state"
alias fastate="cd ~/code/dmg/FastAccept/State/dmg.fast-accept-app.state"
alias mystate="cd ~/code/dmg/MyJobs/State/dmg.my-jobs-app.state"
alias myapi="cd ~/code/dmg/MyJobs/API/dmg.my-jobs-app.api"
alias diapi="cd ~/code/dmg/DispatcherInvoicerOnboarding/API/dmg.dispatcher-invoicer-onboarding-app.api"

###########################
# PERSONAL PROJ ALIASES #
###########################

alias ifaa="cd ~/code/ifaadfw/Server"

##############
# VIM Stuff #
##############

bindkey -v
export KEYTIMEOUT=1

# Change cursor shape for different vi modes.zsh
function zle-keymap-select {
      if [[ ${KEYMAP} == vicmd ]] ||
         [[ $1 = 'block' ]]; then
        echo -ne '\e[1 q'
      elif [[ ${KEYMAP} == main ]] ||
           [[ ${KEYMAP} == viins ]] ||
           [[ ${KEYMAP} = '' ]] ||
           [[ $1 = 'beam' ]]; then
         echo -ne '\e[5 q'
      fi
}

zle -N zle-keymap-select
zle-line-init() {
       zle -K viins # initiate `vi insert` as keymap (can be removed if `bindkey -V` has been set elsewhere)
           echo -ne "\e[5 q"
}

zle -N zle-line-init
echo -ne '\e[5 q' # Use beam shape cursor on startup.
preexec() { echo -ne '\e[5 q' ;} # Use beam shape cursor for each new prompt.



[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh


# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
PROMPT+=' %{$fg[cyan]%}%d%{$reset_color%} '
source ~/powerlevel10k/powerlevel10k.zsh-theme
source /Users/tmb/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
eval "$(zoxide init zsh)"
source /Users/tmb/.config/broot/launcher/bash/br

# Fig post block. Keep at the bottom of this file.
[[ -f "$HOME/.fig/shell/zshrc.post.zsh" ]] && builtin source "$HOME/.fig/shell/zshrc.post.zsh"
