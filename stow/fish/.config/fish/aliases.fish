
#########################
# BASIC ABBREVIATIONS #
#########################

abbr .. "cd ../"
abbr .2 "cd ../.."
abbr .3 "cd ../../.."
abbr .4 "cd ../../../.."
abbr .5 "cd ../../../../.."
abbr cx "chmod +x"
alias c clear
abbr !! sudo !!

#########################
# OPERATIONAL ALIASES #
#########################

#Editor
alias vim "nvim"
alias vi "nvim"
alias n "nvim"
alias v "nvim"
alias . "nvim ."
alias vimdiff 'nvim -d'

#Tmux
alias tx "tmux"
alias txl "tmux ls"
alias txk "tmux kill-server"
alias txks "tmux kill-session -t"
alias txas "tmux attach-session -t"
alias txds "tmux detach -s"
alias txns "tmux new -s"
alias txnds "tmux new -d -s" 

#Programs
abbr ld "lazydocker"
abbr lg "lazygit"
abbr cat "bat"
abbr ls "lsd -al ."
abbr lt "lsd --tree"
abbr search "findme"
abbr stow "stow --target $HOME"
abbr gpg "7DAAE552563BD34F"

#Brew
abbr bi "brew install"
abbr bic "brew install --cask"
abbr binf "brew info"
abbr binfc "brew info --cask"

#Git
alias g  "git"
alias ga "git add"
alias ga. "git add ."
alias gs "git status"
alias gc "git commit -m"
alias gd "git diff"
alias gps "git push"
alias gpl "git pull"
alias gssh "ssh-add --apple-use-keychain ~/.ssh/id_ed25519"
alias gem "git commit --allow-empty -m 'empty'"
alias gch "git checkout"
alias glog "git log --graph --pretty=\"%C(yellow)%h%Creset%C(auto)%d%Creset %s %Cgreen%cr %C(bold blue)%an%Creset\""
abbr grao "git remote add origin"
abbr grau "git remote add upstream"
abbr gma "git merge --abort"
abbr gmc "git merge --continue"
abbr gf "git fetch --all"
abbr gdn "nvim +DiffviewOpen"
abbr gcl "git clone"

#Dots
abbr usezsh "nvim ~/.dotfiles/stow/zsh/.zshrc"
abbr omz "~/.oh-my-zsh"
abbr dots "nvim ~/.dotfiles/stow"
abbr d. "cd ~/.dotfiles/stow"
abbr f. "$EDITOR ~/.dotfiles/stow/fish/.config/fish"
abbr k. "$EDITOR ~/.dotfiles/stow/kitty/.config/kitty/kitty.conf"
abbr y. "$EDITOR ~/.dotfiles/stow/yabai/.config/yabai/yabairc"
abbr s. "$EDITOR ~/.dotfiles/stow/skhd/.config/skhd/skhdrc"
abbr sk. "$EDITOR ~/.dotfiles/stow/sketchybar/.config/sketchybar/"
abbr sc. "$EDITOR ~/.dotfiles/stow/scripts/.config/scripts/"

#Processes
abbr nst "npm start"
abbr nrs "npm run serve"
abbr nrsr "npm run server"
abbr nrst "npm run start"
abbr jup "jupyter notebook"
abbr vs "code-insiders ./"
abbr dw "dotnet watch run"
abbr db "dotnet build"
abbr zoostart "~/kafka34/bin/zookeeper-server-start.sh ~/kafka34/config/zookeeper.properties"
abbr kafkastart "~/kafka34/bin/kafka-server-start.sh ~/kafka34/config/server.properties"
abbr sy "yabai --start-service; and skhd --start-service"
abbr ry "yabai --restart-service; and skhd --restart-service"
abbr spy "yabai --stop-service; and skhd --stop-service"
abbr skr "brew services restart sketchybar"
abbr sks "brew services start sketchybar"
abbr sksp "brew services stop sketchybar"


###############
# DMG ALIASES #
###############

alias rocks "rm -rf bin/Debug/net7.0/rocksdb/ && rm -rf rocksdb"
alias dmg "cd ~/code/dmg"
alias leapi "cd ~/code/dmg/LegacyProviderOnboarding/API/dmg.legacy-provider-onboarding-app.api"
alias lest "cd ~/code/dmg/LegacyProviderOnboarding/State/dmg.legacy-provider-onboarding-app.state"
alias meapi "cd ~/code/dmg/Members/API/dmg.providerorg-member-edit-app.api"
alias mest "cd ~/code/dmg/Members/State/dmg.providerorg-member-edit-app.state"
alias csapi "cd ~/code/dmg/CompanySettings/API/dmg.providerorg-profile-edit-app.api"
alias csst "cd ~/code/dmg/CompanySettings/State/dmg.providerorg-profile-edit-app.state"
alias opapi "cd ~/code/dmg/Opportunities/API/dmg.opportunity-app.api"
alias opst "cd ~/code/dmg/Opportunities/State/dmg.opportunity-app.state"
alias neapi "cd ~/code/dmg/NewProviderOnboarding/API/dmg.new-provider-onboarding-app.api"
alias apapi "cd ~/code/dmg/ApprovalDashboard/API/dmg.approval-dashboard-app.api"
alias apst "cd ~/code/dmg/ApprovalDashboard/State/dmg.approval-dashboard-app.state"
alias apmat "cd ~/code/dmg/ApprovalDashboard/Materializer/dmg.approval-dashboard-app.materializer"
alias invite "cd ~/code/dmg/inviteMember/dmg.providerorg-invite-member.api"
alias master "cd ~/code/dmg/Provider/Master/dmg.provider.master"
alias maapi "cd ~/code/dmg/Provider/API/dmg.provider.api"
alias taapi "cd ~/code/dmg/TechnicianApp/API/dmg.technician-app.provider-api"
alias tast "cd ~/code/dmg/TechnicianApp/State/dmg.technician-app.state"
alias fast "cd ~/code/dmg/FastAccept/State/dmg.fast-accept-app.state"
alias myst "cd ~/code/dmg/MyJobs/State/dmg.my-jobs-app.state"
alias myapi "cd ~/code/dmg/MyJobs/API/dmg.my-jobs-app.api"
alias diapi "cd ~/code/dmg/DispatcherInvoicerOnboarding/API/dmg.dispatcher-invoicer-onboarding-app.api"

#########################
# PERSONAL PROJ ALIASES #
#########################

abbr ifaa "cd ~/code/ifaadfw/Server"


#############
# FUNCTIONS #
#############

function cd
    builtin cd $argv; and lsd -al .
end

# Pretty prints the disk space of the given directory
function ds -a dir
  printf "Disk Space for $(set_color -i red)$dir$(set_color normal):$(set_color -o cyan) "
  du -sh $dir | head -n1 | awk '{print $1;}'
end

# See what is runnin on what port
function port -a PORT
  sudo lsof -i -n -P | grep TCP | grep $PORT
end

# Creates a dir and CD into it
function take -a dir
  mkdir -p $dir
  cd $dir
end

# Fancy find shit
function findme 
   rg --line-number --no-heading --color always --smart-case "$1" | fzf -d ':' -n 2.. --ansi --no-sort --preview-window 'right:70%:+{2}' --preview 'bat --style numbers --color always --highlight-line {2} {1}'
end

function sudo --description "Replacement for Bash 'sudo !!' command to run last command using sudo."
    if test "$argv" = !!
        echo sudo $history[1]
        eval command sudo $history[1]
    else
        command sudo $argv
    end
end
