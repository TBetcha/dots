
#########################
# BASIC ABBREVIATIONS #
#########################

abbr .. "cd ../"
abbr ... "cd ../../"
abbr .... "cd ../../../"


#########################
# OPERATIONAL ALIASES #
#########################

#Editor
alias vim "nvim"
alias vi "nvim"
alias n "nvim"
alias v "nvim"

#Tmux
alias tx "tmux"
alias txk "tmux kill-server"
alias txks "tmux kill-session -t"
alias txas "tmux attach-session -t"
alias txds "tmux detach -s"
alias txns "tmux new -s"
alias txnds "tmux new -d -s" 

#Programs
alias ld "lazydocker"
alias lg "lazygit"
alias cat "ccat"
alias ls "lsd -al ."
alias lt "lsd --tree"
alias search "findme"
alias stow "stow --target $HOME"


#Git
alias g  "git"
alias ga "git add"
alias gs "git status"
alias gc "git commit -m"
alias gd "git diff"
alias gps "git push"
alias gpl "git pull"
alias gcreds "ssh-add --apple-use-keychain ~/.ssh/id_ed25519"
alias gempty "git commit --allow-empty -m 'empty'"
alias gch "git checkout"
alias glog "git log --graph --pretty=\"%C(yellow)%h%Creset%C(auto)%d%Creset %s %Cgreen%cr %C(bold blue)%an%Creset\""

#Dots
alias usezsh "nvim ~/.dotfiles/stow/zsh/.zshrc"
alias omz "~/.oh-my-zsh"
alias dots "nvim ~/.dotfiles/stow"
alias dotfiles "cd ~/.dotfiles/stow"
alias fishdot "$EDITOR ~/.dotfiles/stow/fish/.config/fish"
alias kittydot "$EDITOR ~/.dotfiles/stow/kitty/.config/kitty/kitty.conf"
alias yabaidot "$EDITOR ~/.dotfiles/stow/yabai/.config/yabai/yabairc"
alias skhddot "$EDITOR ~/.dotfiles/stow/skhd/.config/skhd/skhdrc"
alias sketchdot "$EDITOR ~/.dotfiles/stow/sketchybar/.config/sketchybar/"
alias scripts "$EDITOR ~/.dotfiles/stow/scripts/.config/scripts/"

#Processes
alias nst "npm start"
alias nserve "npm run serve"
alias nserver "npm run server"
alias nstart "npm run start"
alias jup "jupyter notebook"
alias vs "code-insiders ./"
alias watch "dotnet watch run"
alias zoostart "~/kafka34/bin/zookeeper-server-start.sh ~/kafka34/config/zookeeper.properties"
alias kafkastart "~/kafka34/bin/kafka-server-start.sh ~/kafka34/config/server.properties"
alias styabai "yabai --start-service; and skhd --start-service"
alias reyabai "yabai --restart-service; and skhd --restart-service"
alias stopyabai "yabai --stop-service; and skhd --stop-service"
alias skres "brew services restart sketchybar"
alias skstart "brew services start sketchybar"
alias skstop "brew services stop sketchybar"


###############
# DMG ALIASES #
###############

alias rocks "rm -rf bin/Debug/net7.0/rocksdb/ && rm -rf rocksdb"
alias dmg "cd ~/code/dmg"
alias leapi "cd ~/code/dmg/LegacyProviderOnboarding/API/dmg.legacy-provider-onboarding-app.api"
alias lestate "cd ~/code/dmg/LegacyProviderOnboarding/State/dmg.legacy-provider-onboarding-app.state"
alias meapi "cd ~/code/dmg/Members/API/dmg.providerorg-member-edit-app.api"
alias mestate "cd ~/code/dmg/Members/State/dmg.providerorg-member-edit-app.state"
alias csapi "cd ~/code/dmg/CompanySettings/API/dmg.providerorg-profile-edit-app.api"
alias csstate "cd ~/code/dmg/CompanySettings/State/dmg.providerorg-profile-edit-app.state"
alias opapi "cd ~/code/dmg/Opportunities/API/dmg.opportunity-app.api"
alias opstate "cd ~/code/dmg/Opportunities/State/dmg.opportunity-app.state"
alias neapi "cd ~/code/dmg/NewProviderOnboarding/API/dmg.new-provider-onboarding-app.api"
alias apapi "cd ~/code/dmg/ApprovalDashboard/API/dmg.approval-dashboard-app.api"
alias apstate "cd ~/code/dmg/ApprovalDashboard/State/dmg.approval-dashboard-app.state"
alias apmat "cd ~/code/dmg/ApprovalDashboard/Materializer/dmg.approval-dashboard-app.materializer"
alias invite "cd ~/code/dmg/inviteMember/dmg.providerorg-invite-member.api"
alias master "cd ~/code/dmg/Provider/Master/dmg.provider.master"
alias maapi "cd ~/code/dmg/Provider/API/dmg.provider.api"
alias teapi "cd ~/code/dmg/TechnicianApp/API/dmg.technician-app.provider-api"
alias testate "cd ~/code/dmg/TechnicianApp/State/dmg.technician-app.state"
alias fastate "cd ~/code/dmg/FastAccept/State/dmg.fast-accept-app.state"
alias mystate "cd ~/code/dmg/MyJobs/State/dmg.my-jobs-app.state"
alias myapi "cd ~/code/dmg/MyJobs/API/dmg.my-jobs-app.api"
alias diapi "cd ~/code/dmg/DispatcherInvoicerOnboarding/API/dmg.dispatcher-invoicer-onboarding-app.api"

#########################
# PERSONAL PROJ ALIASES #
#########################

alias ifaa "cd ~/code/ifaadfw/Server"


#############
# FUNCTIONS #
#############

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

