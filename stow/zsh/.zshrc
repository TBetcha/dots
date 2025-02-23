# #####################################################
# IF  I EVER GO BACK TO ZSH FIX ALIASES TO MATCH FISH #
# #####################################################
#
# fig pre block. keep at the top of this file.zsh
# [[ -f "$home/.fig/shell/zshrc.pre.zsh" ]] && builtin source "$home/.fig/shell/zshrc.pre.zsh"
# enable powerlevel10k instant prompt. should stay close to the top of ~/.zshrc.
# initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
 
if [[ -r "${xdg_cache_home:-$home/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
 source "${xdg_cache_home:-$home/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

#########
# path #
#########

# all the kids are doing it
export editor="nvim"

# home dir
export xdg_config_home=$home/.config
 
# append path+=()
# prepend path=()

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
# export path=$path/usr/local/bin
#
# export path=$path:/usr/local/share/dotnet/dotnet
# export path=$path:~/.dotnet
# export dotnet_root=$home/.dotnet
# export path=$path:$dotnet_root:$dotnet_root/tools
#
# export path=$path:~/.config/scripts/bin_scripts
# export path=$path:~/.config/scripts
#
# export path=/opt/homebrew/bin:$path
# export path=/opt/homebrew/sbin:$path
#
# export path="$path:/users/tmb/kafka_2.13-3.4.0/bin"

export protoc=/opt/homebrew/bin/protoc
export protoc_include=/opt/homebrew/include

export zsh="/users/tmb/.oh-my-zsh"



export bat_theme="twodark"


# all the kids are doing it
export editor="nvim"

# unused old exports
#tmux 
# export tmux=$home/.tmux.conf
#export tmux_dir=$home/.tmux
#export path=$path:~/.dotnet/tools
#
# change to use dotnet versions
#export path="/opt/homebrew/opt/dotnet@7/bin:$path"
# i configured to show
#export path="$path:/opt/homebrew/opt/dotnet@7/bin" 
#export path="$path:/opt/homebrew/opt/dotnet@6/bin"

zsh_theme="amuse"

# set list of themes to pick from when loading at random
# setting this variable when zsh_theme=random will cause zsh to load
# a theme from this variable instead of looking in $zsh/themes/
# if set to an empty array, this variable will have no effect.
# zsh_theme_random_candidates=( "robbyrussell" "agnoster" )

# uncomment the following line to use case-sensitive completion.
# case_sensitive="true"

# uncomment the following line to use hyphen-insensitive completion.
# case-sensitive completion must be off. _ and - will be interchangeable.
# hyphen_insensitive="true"

# disable_auto_update="true"
# disable_update_prompt="true"
# export update_zsh_days=13
# disable_ls_colors="true"
#
disable_auto_title="true"
# enable_correction="true"
# disable_untracked_files_dirty="true"
#
# uncomment the following line if pasting urls and other text is messed up.
# disable_magic_functions="true"

 completion_waiting_dots="true"

# uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# you can set one of the optional three formats:
# "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# or set a custom format using the strftime function format specifications,
# see 'man strftime' for details.
# hist_stamps="mm/dd/yyyy"

# would you like to use another custom folder than $zsh/custom?
# zsh_custom=/path/to/new-custom-folder

# which plugins would you like to load?
# standard plugins can be found in $zsh/plugins/
# custom plugins may be added to $zsh_custom/plugins/
# example format: plugins=(rails git textmate ruby lighthouse)
# add wisely, as too many plugins slow down shell startup.
plugins=(git docker docker-compose battery colorize dirhistory direnv macos fzf sudo fzf-zsh-plugin k vi-mode)

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

##############
# functions #
##############

# pretty prints the disk space of the given directory
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

 
#########################
# operational aliases #
#########################

# cd
alias ..="cd ../"
alias ...="cd ../../"
alias ....="cd ../../../"

#editor
alias vim="nvim"
alias vi="nvim"
alias n="nvim"
alias v="nvim"

#tmux
# alias tmux=tmux -f "/opt/homebrew/bin/tmux"
alias tx="tmux"
alias txk="tmux kill-server"
alias txks="tmux kill-session -t"
alias txas="tmux attach-session -t"
alias txds="tmux detach -s"
alias txns="tmux new -s"
alias txnds="tmux new -d -s" 

#programs
alias lzd="lazydocker"
alias lzg="lazygit"
alias cat="ccat"
alias ls="lsd -al ."
alias lt="lsd --tree"
alias search="findme"
alias stow="stow --target $home"

#git
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
alias glog='g log --graph --pretty='\''%c(yellow)%h%creset%c(auto)%d%creset %s %cgreen%cr %c(bold blue)%an%creset'\'''

#dots
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

#processes
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
# dmg aliases #
#################

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

###########################
# personal proj aliases #
###########################

alias ifaa="cd ~/code/ifaadfw/server"

##############
# vim stuff #
##############

bindkey -v
export keytimeout=1

# change cursor shape for different vi modes.zsh
function zle-keymap-select {
      if [[ ${keymap} == vicmd ]] ||
         [[ $1 = 'block' ]]; then
        echo -ne '\e[1 q'
      elif [[ ${keymap} == main ]] ||
           [[ ${keymap} == viins ]] ||
           [[ ${keymap} = '' ]] ||
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


## fzf 
# Set up fzf key bindings and fuzzy completion
source <(fzf --zsh) 

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh


# to customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
prompt+=' %{$fg[cyan]%}%d%{$reset_color%} '
source ~/powerlevel10k/powerlevel10k.zsh-theme
source /users/tmb/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
eval "$(zoxide init zsh)"
source /users/tmb/.config/broot/launcher/bash/br

# fig post block. keep at the bottom of this file.
# [[ -f "$home/.fig/shell/zshrc.post.zsh" ]] && builtin source "$home/.fig/shell/zshrc.post.zsh"
