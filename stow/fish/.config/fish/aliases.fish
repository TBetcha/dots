
#########################
# BASIC ABBREVIATIONS #
#########################

abbr .. "cd ../"
abbr .2 "cd ../.."
abbr .3 "cd ../../.."
abbr .4 "cd ../../../.."
abbr .5 "cd ../../../../.."
abbr cx "chmod +x"
abbr c clear


#########################
# OPERATIONAL ALIASES #
#########################

#Editor
abbr vim "nvim"
abbr vi "nvim"
abbr n "nvim"
abbr v "nvim"

#Tmux
alias tx "tmux"
abbr txl "tmux ls"
abbr txk "tmux kill-server"
abbr txks "tmux kill-session -t"
abbr txas "tmux attach-session -t"
abbr txds "tmux detach -s"
abbr txns "tmux new -s"
abbr txnds "tmux new -d -s" 

#Programs
abbr ld "lazydocker"
abbr lg "lazygit"
abbr cat "bat"
abbr ls "lsd -al ."
abbr lt "lsd --tree"
abbr search "findme"
abbr stow "stow --target $HOME"

#Brew
abbr bi "brew install"
abbr bic "brew install --cask"
abbr bin "brew info"
abbr binc "brew info --cask"

#Git
abbr g  "git"
abbr ga. "git add ."
abbr gs "git status"
abbr gc "git commit -m"
abbr gd "git diff"
abbr gps "git push"
abbr gpl "git pull"
abbr gssh "ssh-add --apple-use-keychain ~/.ssh/id_ed25519"
abbr gem "git commit --allow-empty -m 'empty'"
abbr gch "git checkout"
abbr glog "git log --graph --pretty=\"%C(yellow)%h%Creset%C(auto)%d%Creset %s %Cgreen%cr %C(bold blue)%an%Creset\""
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

abbr rocks "rm -rf bin/Debug/net7.0/rocksdb/ && rm -rf rocksdb"
abbr dmg "cd ~/code/dmg"
abbr leapi "cd ~/code/dmg/LegacyProviderOnboarding/API/dmg.legacy-provider-onboarding-app.api"
abbr lestate "cd ~/code/dmg/LegacyProviderOnboarding/State/dmg.legacy-provider-onboarding-app.state"
abbr meapi "cd ~/code/dmg/Members/API/dmg.providerorg-member-edit-app.api"
abbr mestate "cd ~/code/dmg/Members/State/dmg.providerorg-member-edit-app.state"
abbr csapi "cd ~/code/dmg/CompanySettings/API/dmg.providerorg-profile-edit-app.api"
abbr csstate "cd ~/code/dmg/CompanySettings/State/dmg.providerorg-profile-edit-app.state"
abbr opapi "cd ~/code/dmg/Opportunities/API/dmg.opportunity-app.api"
abbr opstate "cd ~/code/dmg/Opportunities/State/dmg.opportunity-app.state"
abbr neapi "cd ~/code/dmg/NewProviderOnboarding/API/dmg.new-provider-onboarding-app.api"
abbr apapi "cd ~/code/dmg/ApprovalDashboard/API/dmg.approval-dashboard-app.api"
abbr apstate "cd ~/code/dmg/ApprovalDashboard/State/dmg.approval-dashboard-app.state"
abbr apmat "cd ~/code/dmg/ApprovalDashboard/Materializer/dmg.approval-dashboard-app.materializer"
abbr invite "cd ~/code/dmg/inviteMember/dmg.providerorg-invite-member.api"
abbr master "cd ~/code/dmg/Provider/Master/dmg.provider.master"
abbr maapi "cd ~/code/dmg/Provider/API/dmg.provider.api"
abbr teapi "cd ~/code/dmg/TechnicianApp/API/dmg.technician-app.provider-api"
abbr testate "cd ~/code/dmg/TechnicianApp/State/dmg.technician-app.state"
abbr fastate "cd ~/code/dmg/FastAccept/State/dmg.fast-accept-app.state"
abbr mystate "cd ~/code/dmg/MyJobs/State/dmg.my-jobs-app.state"
abbr myapi "cd ~/code/dmg/MyJobs/API/dmg.my-jobs-app.api"
abbr diapi "cd ~/code/dmg/DispatcherInvoicerOnboarding/API/dmg.dispatcher-invoicer-onboarding-app.api"

#########################
# PERSONAL PROJ ALIASES #
#########################

abbr ifaa "cd ~/code/ifaadfw/Server"


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

