# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# fig pre block. keep at the top of this file.zsh
# [[ -f "$home/.fig/shell/zshrc.pre.zsh" ]] && builtin source "$home/.fig/shell/zshrc.pre.zsh"
# enable powerlevel10k instant prompt. should stay close to the top of ~/.zshrc.
# initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
 
## NOTE: UNCOMMENT FOR p10k
# if [[ -r "${xdg_cache_home:-$home/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
#  source "${xdg_cache_home:-$home/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
# fi

###############################################################################
#################################### ENV ######################################
###############################################################################

export editor="nvim"

# home dir
export xdg_config_home=$home/.config
 

# export path=$path/bin
path+=('/bin')
path+=('/usr/local/bin')
path+=('/usr/local/share/dotnet/dotnet')
path+=('/.dotnet')
path+=('$dotnet_root:$dotnet_root/tools')
path+=('~/.config/scripts/bin_scripts')
path+=('~/.config/scripts')
path+=('opt/homebrew/bin')
path+=('opt/homebrew/sbin')
path+=('/users/tmb/kafka_2.13-3.4.0/bin')

export PATH
export protoc=/opt/homebrew/bin/protoc
export protoc_include=/opt/homebrew/include
export zsh="/users/tmb/.oh-my-zsh"
export bat_theme="twodark"
export editor="nvim"

# export ZO_DATA_DIR = "'Users/tmb/Library/Application\\ Support/zoxide'"


zsh_theme="amuse"

# set list of themes to pick from when loading at random
# setting this variable when zsh_theme=random will cause zsh to load
# a theme from this variable instead of looking in $zsh/themes/
# if set to an empty array, this variable will have no effect.
# zsh_theme_random_candidates=( "robbyrussell" "agnoster" )

# case_sensitive="true"
# uncomment the following line to use hyphen-insensitive completion.
# case-sensitive completion must be off. _ and - will be interchangeable.
# hyphen_insensitive="true"
# disable_auto_update="true"
# disable_update_prompt="true"
# export update_zsh_days=13
# disable_ls_colors="true"
# enable_correction="true"
# disable_untracked_files_dirty="true"
# disable_magic_functions="true"
disable_auto_title="true"
completion_waiting_dots="true"


# would you like to use another custom folder than $zsh/custom?
# zsh_custom=/path/to/new-custom-folder

plugins=(battery brew colorize dirhistory direnv docker docker-compose fzf fzf-zsh-plugin git git-prompt git-extras macos sudo vi-mode wd zsh-autosuggestions zsh-syntax-highlighting fast-syntax-highlighting zsh-autocomplete)

source $zsh/oh-my-zsh.sh


# export manpath="/usr/local/man:$manpath"

# you may need to manually set your language environment
# export lang=en_us.utf-8

# preferred editor for local and remote sessions
if [[ -n $ssh_connection ]]; then
 export editor='nvim'
else
 export editor='mvim'
fi

# compilation flags
# export archflags="-arch x86_64"

###############################################################################
###################################### FUNCTIONS ##############################
###############################################################################

# pretty prints the disk space of the given directory

# function cd() {
#     builtin cd "$@" && eza -la --icons --git
# }

function ds() {
  if [ $# -eq 0 ]; then
    echo "usage: disk_space_usage <directory>"
    return 1
  fi

  directory="$1"

  if [ ! -d "$directory" ]; then
    echo "error: '$directory' is not a valid directory."
    return 1
  fi

  # get the disk usage in human-readable format and extract the size
  disk_usage=$(du -sh "$directory" | awk '{print $1}')

  # define colors (you can customize these)
  green="\033[0;32m"
  reset_color="\033[0m"

  # print the disk usage with colored output
  echo -e "disk usage for '$directory': ${green}$disk_usage${reset_color}"
}

# see what is runnin on what port
function port () {
  sudo lsof -i -n -p | grep tcp | grep "$port"
}

# creates a dir and cd into it
function take () {
  mkdir "$1"
  cd "$1"
}

# fancy find shit
function findme {
     rg --line-number --no-heading --color=always --smart-case "$1" | fzf -d ':' -n 2.. --ansi --no-sort --preview-window 'right:70%:+{2}' --preview 'bat --style=numbers --color=always --highlight-line {2} {1}'
}

function start_shell {
    echo "tbetcha" | figlet | ~/.config/scripts/color_it.sh 75
}

###############################################################################
############################# OPERATIONAL ALIASES ############################
##############################################################################

#################################### CD ######################################
alias ..="cd ../"
alias ...="cd ../../"
alias ....="cd ../../../"

alias z="__zoxide_z"
alias ..="cd ../"
alias .2="cd ../.."
alias .3="cd ../../.."
alias .4="cd ../../../.."
alias .5="cd ../../../../.."
alias cx="chmod +x"
alias c=clear

##################################### EDITOR #################################
alias vim="nvim"
alias vi="nvim"
alias n="nvim ."
alias v="nvim"

##################################### TMUX ##################################
# alias tmux=tmux -f "/opt/homebrew/bin/tmux"
alias tx="tmux"
alias txl="tmux ls"
alias tksv="tmux kill-server"
alias tkss="tmux kill-session -t"
alias ta="tmux attach-session -t"
alias td="tmux detach -s"
alias ts="tmux new -s"
alias tnds="tmux new -d -s" 

################################## PROGRAMS ###################################
alias lzd="lazydocker"
alias lzg="lazygit"
alias cat="bat"
alias search="findme"
alias stow="stow --target $home"
alias y="yazi"

################################ LS ALIASES ###################################
alias l="eza -la --icons --git"
alias ls="eza -la --icons --git"
alias lT="eza -lT --icons --git"
alias ld="eza -lD"
alias lf="eza -lF --color=always | grep -v /"
alias lh="eza -dl .* --group-directories-first"
alias ll="eza -al --group-directories-first"
alias lt="eza -al --sort=modified"

################################### DOTS ######################################

alias usezsh="nvim ~/.dotfiles/stow/zsh/.zshrc"
alias omz="~/.oh-my-zsh"
alias dots="nvim ~/.dotfiles/stow"
alias d.="cd ~/.dotfiles/stow"
alias f.="$EDITOR ~/.dotfiles/stow/fish/.config/fish"
alias k.="$EDITOR ~/.dotfiles/stow/kitty/.config/kitty/kitty.conf"
alias y.="$EDITOR ~/.dotfiles/stow/yabai/.config/yabai/yabairc"
alias s.="$EDITOR ~/.dotfiles/stow/skhd/.config/skhd/skhdrc"


#Brew
# alias bi="brew install"
# alias bun="brew uninstall"
# alias bic="brew install --cask"
# alias binf="brew info
# alias binfc="brew info --cask

######################################### GIT ################################
alias g="git"
# alias ga="git add"
# alias gs="git status"
# alias gc="git commit -m"
# alias gd="git diff"
# alias gps="git push"
# alias gpl="git pull"
alias gcreds="ssh-add --apple-use-keychain ~/.ssh/id_ed25519"
alias gempty="git commit --allow-empty -m 'empty'"
alias gch="git checkout"
alias glog='g log --graph --pretty='\''%C(bold blue)%h%C(reset) - %C(cyan)%ad%C(reset) %C(yellow)%d%C(reset) %C(normal)%s%C(reset)  %C(dim normal)[%an]%C(reset)'\'''
# '%C(bold blue)%h%C(reset) - %C(cyan)%ad%C(reset) %C(yellow)%d%C(reset) %C(normal)%s%C(reset)  %C(dim normal)[%an]%C(reset)'
######################################### DOTS ################################
alias usezsh="nvim ~/.dotfiles/stow/zsh/.zshrc"
alias omz="~/.oh-my-zsh"
alias dots="nvim ~/.dotfiles/stow"
alias dotfiles="cd ~/.dotfiles/stow"
alias fishdot="$editor ~/.dotfiles/stow/fish/.config/fish"
alias kittydot="$editor ~/.dotfiles/stow/kitty/.config/kitty/kitty.conf"
alias yabaidot="$editor ~/.dotfiles/stow/yabai/.config/yabai/yabairc"
alias skhddot="$editor ~/.dotfiles/stow/skhd/.config/skhd/skhdrc"
alias sketchdot="$editor ~/.dotfiles/stow/sketchybar/.config/sketchybar/"
alias scripts="$editor ~/.dotfiles/stow/scripts/.config/scripts/"

##################################### PROCESSES ################################
alias jup="jupyter notebook"
alias vs="code-insiders ./"
alias zoostart="~/kafka34/bin/zookeeper-server-start.sh ~/kafka34/config/zookeeper.properties"
alias kafkastart="~/kafka34/bin/kafka-server-start.sh ~/kafka34/config/server.properties"
alias sy="yabai --start-service && skhd --start-service"
alias ry="yabai --restart-service && skhd --restart-service"
alias spy="yabai --stop-service && skhd --stop-service"
alias skres="brew services restart sketchybar"
alias skstart="brew services start sketchybar"
alias skstop="brew services stop sketchybar"


################################### DOTNET ####################################

alias dw="dotnet watch run"
alias db="dotnet build"
alias drs="dotnet restore"
alias dr="dotnet run"

#################################### NODE #####################################

alias nst="npm start"
alias nrd="npm run dev"
alias nrs="npm run serve"
alias nrsr="npm run server"
alias nrst="npm run start"

###################################### DMG ALIASES ############################

alias rocks="rm -rf bin/debug/net7.0/rocksdb/ && rm -rf rocksdb"
alias dmg="cd ~/code/dmg"
alias leapi="cd ~/code/dmg/legacyprovideronboarding/api/dmg.legacy-provider-onboarding-app.api"
alias lestate="cd ~/code/dmg/legacyprovideronboarding/state/dmg.legacy-provider-onboarding-app.state"
alias meapi="cd ~/code/dmg/members/api/dmg.providerorg-member-edit-app.api"
alias mestate="cd ~/code/dmg/members/state/dmg.providerorg-member-edit-app.state"
alias csapi="cd ~/code/dmg/companysettings/api/dmg.providerorg-profile-edit-app.api"
alias csstate="cd ~/code/dmg/companysettings/state/dmg.providerorg-profile-edit-app.state"
alias opapi="cd ~/code/dmg/opportunities/api/dmg.opportunity-app.api"
alias opstate="cd ~/code/dmg/opportunities/state/dmg.opportunity-app.state"
alias neapi="cd ~/code/dmg/newprovideronboarding/api/dmg.new-provider-onboarding-app.api"
alias apapi="cd ~/code/dmg/approvaldashboard/api/dmg.approval-dashboard-app.api"
alias apstate="cd ~/code/dmg/approvaldashboard/state/dmg.approval-dashboard-app.state"
alias apmat="cd ~/code/dmg/approvaldashboard/materializer/dmg.approval-dashboard-app.materializer"
alias invite="cd ~/code/dmg/invitemember/dmg.providerorg-invite-member.api"
alias master="cd ~/code/dmg/provider/master/dmg.provider.master"
alias maapi="cd ~/code/dmg/provider/api/dmg.provider.api"
alias teapi="cd ~/code/dmg/technicianapp/api/dmg.technician-app.provider-api"
alias testate="cd ~/code/dmg/technicianapp/state/dmg.technician-app.state"
alias fastate="cd ~/code/dmg/fastaccept/state/dmg.fast-accept-app.state"
alias mystate="cd ~/code/dmg/myjobs/state/dmg.my-jobs-app.state"
alias myapi="cd ~/code/dmg/myjobs/api/dmg.my-jobs-app.api"
alias diapi="cd ~/code/dmg/dispatcherinvoiceronboarding/api/dmg.dispatcher-invoicer-onboarding-app.api"

############################ PERSONAL PROJ ALIASES ############################

alias ifaa="cd ~/code/ifaadfw/server"

###############################################################################
################################## FZF ########################################
###############################################################################

function envfzf() {
    # Ensure fzf is installed
    if ! command -v fzf &> /dev/null; then
        echo "fzf is not installed. Please install it first."
        return 1
    fi

    # Use fzf to select an environment variable
    local selected=$(env | fzf --prompt="Select an environment variable: " --height=40% --reverse)

    # Check if a variable was selected
    if [[ -n "$selected" ]]; then
        local key=$(echo "$selected" | cut -d '=' -f1)
        local value=$(echo "$selected" | cut -d '=' -f2-)

        # Display the selected variable
        echo "Selected: $key"
        echo "$value"

        # Prompt user to manually copy it using Ctrl+Shift+C
        echo "🔹 Use Ctrl+Shift+C to copy the value!"
    else
        echo "No selection made."
    fi
}

function _fzf_wrapper() {
    # Make sure fzf uses the correct shell and sets the necessary environment variables
    # For Bash, we typically don't need to use `SHELL` the way Fish does, so this is omitted

    # If neither FZF_DEFAULT_OPTS nor FZF_DEFAULT_OPTS_FILE are set, set sane defaults
    if [[ -z "$FZF_DEFAULT_OPTS" && -z "$FZF_DEFAULT_OPTS_FILE" ]]; then
        # These options optimize fzf for git logs, history, and other common uses
        export FZF_DEFAULT_OPTS='--cycle --layout=reverse --border --height=90% --preview-window=wrap --marker="*"'
    fi

    # Run fzf with the provided arguments (e.g., from git log search)
    fzf "$@"
}

function _fzf_search_git_log() {
    # Check if the current directory is inside a git repository
    if ! git rev-parse --git-dir >/dev/null 2>&1; then
        echo '_fzf_search_git_log: Not in a git repository.' >&2
        return 1
    fi

    # Set default log format if not already set
    if [[ -z "$fzf_git_log_format" ]]; then
        # %h gives you the abbreviated commit hash, which is useful for saving screen space
        fzf_git_log_format='%C(bold blue)%h%C(reset) - %C(cyan)%ad%C(reset) %C(yellow)%d%C(reset) %C(normal)%s%C(reset)  %C(dim normal)[%an]%C(reset)'
    fi

    # Set the preview command for fzf
    preview_cmd="git show --color=always --stat --patch {1}"

    # Apply the fzf_diff_highlighter if it's set
    if [[ -n "$fzf_diff_highlighter" ]]; then
        preview_cmd="$preview_cmd | $fzf_diff_highlighter"
    fi

    # Get the selected log lines using fzf and git log
    selected_log_lines=$(git log --no-show-signature --color=always --format="$fzf_git_log_format" --date=short | \
        _fzf_wrapper --ansi \
            --multi \
            --scheme=history \
            --prompt="Git Log> " \
            --preview="$preview_cmd" \
            --query="$(commandline --current-token)" \
            $fzf_git_log_opts)

    # Check if a commit was selected (status 0 means selection was made)
    if [[ $? -eq 0 ]]; then
        commit_hashes=()
        for line in $selected_log_lines; do
            # Extract the abbreviated commit hash and convert to full commit hash
            abbreviated_commit_hash=$(echo "$line" | awk '{print $1}')
            full_commit_hash=$(git rev-parse "$abbreviated_commit_hash")
            commit_hashes+=("$full_commit_hash")
        done

        # Replace the current token with the selected commit hashes
        commandline --current-token --replace "$(IFS=' '; echo "${commit_hashes[*]}")"
    fi

    # Repaint the commandline (similar to Fish's commandline --function repaint)
    commandline --function repaint
}






function getGb() {
  fzf-git-checkout
}

function getEnvs(){
  envfzf
}

function getGitlog(){
  fzf_search_git_log
}

zle -N getGb
zle -N getEnvs
zle -N getGitlog

bindkey "^b" getGb
bindkey "^v" getEnvs
bindkey "^l" getGitlog

###############################################################################
################################## VIM STUFF ############################
###############################################################################

bindkey -v
export keytimeout=1


# Change cursor shape in normal and insert mode (like Vim)
function zle-keymap-select {
  case $KEYMAP in
    vicmd) echo -ne '\e[1 q' ;;  # Block cursor (normal mode)
    viins|main) echo -ne '\e[5 q' ;;  # Beam cursor (insert mode)
  esac
}
zle -N zle-keymap-select

# Restore cursor shape on shell exit
function zle-line-finish {
  echo -ne '\e[0 q'
}
zle -N zle-line-finish

# Start in insert mode with beam cursor
echo -ne '\e[5 q'

###############################################################################
###################################### SOURCING ###############################
###############################################################################

## fzf 
# Set up fzf key bindings and fuzzy completion
source <(fzf --zsh) 

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

eval $(thefuck --alias fck)
eval "$(zoxide init zsh)"
eval "$(starship init zsh)"

# to customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
prompt+=' %{$fg[cyan]%}%d%{$reset_color%} '
source ~/powerlevel10k/powerlevel10k.zsh-theme
source /users/tmb/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
source /users/tmb/.config/broot/launcher/bash/br
# fig post block. keep at the bottom of this file.
# [[ -f "$home/.fig/shell/zshrc.post.zsh" ]] && builtin source "$home/.fig/shell/zshrc.post.zsh"
