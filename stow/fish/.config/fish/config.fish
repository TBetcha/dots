

######################
## GENERAL SETTINGS ##
######################

set -U fish_greeting 
set -g fish_autosuggestion_enabled 1

# VIM Stuff
export DISABLE_AUTO_TITLE true
fish_vi_key_bindings
# Emulates vim's cursor shape behavior
# Set the normal and visual mode cursors to a block
set fish_cursor_default block
# Set the insert mode cursor to a line
set fish_cursor_insert line
# Set the replace mode cursor to an underscore
set fish_cursor_replace_one underscore
# The following variable can be used to configure cursor shape in
# visual mode, but due to fish_cursor_default, is redundant here
set fish_cursor_visual block

##########
## PATH ##
##########

fish_add_path /opt/homebrew/bin 
fish_add_path /opt/homebrew/sbin 
fish_add_path {$HOME}/bin fish_add_path {$HOME}/Library/Application\ Support/JetBrains/Toolbox/scripts/
fish_add_path {$HOME}/.cargo/bin
fish_add_path {$HOME}/.local/bin
fish_add_path {$HOME}/.dotnet/tools
fish_add_path {$HOME}/usr/local/share/dotnet/dotnet
fish_add_path {$HOME}/.dotnet
fish_add_path {$HOME}/kafka_2.13-3.4.0/bin
fish_add_path {$HOME}/.config/scripts/bin_scripts
fish_add_path {$DOTNET_ROOT}/tools
# fish_add_path {$HOME}/.fig/bin
#set GOPATH {$HOME}

#############
## ALIASES ##
#############

source ~/.config/fish/aliases.fish

#################################
## ITERM2  SHELL INTEGRATION ##
#################################

test -e {$HOME}/.iterm2_shell_integration.fish ; and source {$HOME}/.iterm2_shell_integration.fish

function ab $color
  echo -n $color | nc -4u -w0 localhost 1738
end

###############
## EXPORTS ##
###############

# Fig pre block. Keep at the top of this file.
#[[ -f "$HOME/.fig/shell/zshrc.pre.zsh" ]] && builtin source "$HOME/.fig/shell/zshrc.pre.zsh"

# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

#dotent brew suggest to show this version first - change based on what dotnet version I want to use
#set -x DOTNET_ROOT $HOME/.dotnet
set -x DOTNET_ROOT $HOME/.dotnet
set -x PROTOC /opt/homebrew/bin/protoc
set -x PROTOC_INCLUDE /opt/homebrew/include
# set -x BW_CLIENTSECRET "YEDWxmFQVZ2JK4XhQRn8NUjDOiBPxx"
set -x BAT_THEME "TwoDark"
set -x EDITOR nvim

#################
## FISH PROMPT ##
#################

set --global hydro_symbol_prompt ">>>"
set --global hydro_symbol_git_dirty "*"

set --global hydro_color_pwd blue
set --global hydro_color_git green
set --global hydro_color_error red
set --global hydro_color_prompt magenta
set --global hydro_color_duration yellow

set --global lucid_prompt_symbol ">>>"
set --global lucid_cwd_color blue
set --global lucid_git_color green
set --global lucid_prompt_error_color red
set --global lucid_prompt_symbol_color magenta
set --global lucid_dirty_indicator "*"
set --global lucid_prompt_symbol_error "!!!"
set --global lucid_prompt_symbol_error_color red

set --global tide_character_icon "λ"
set --global tide_pwd_color_truncated_dirs blue

function @@@
  exit
end

function font
  echo "  o0O s5S 9gq z2Z !|l1Iij {([|])} .,;: ``''""
  a@#* vVuUwW <>;^°=-~ öÖüÜäÄßµ \/\/ -- == __
  the quick brown fox jumps over the lazy dog
  THE QUICK BROWN FOX JUMPS OVER THE LAZY DOG
  0123456789 &-+@ for (int i=0; i<=j; i++) {}"
end

# ASCII Art
function fish_greeting
    ECHO "Tbetcha" | figlet | ~/.config/scripts/color_it.sh 75
end

[ -f ~/.fzf.fish ] && source ~/.fzf.fish


# pnpm
set -gx PNPM_HOME "/Users/tmb/Library/pnpm"
if not string match -q -- $PNPM_HOME $PATH
  set -gx PATH "$PNPM_HOME" $PATH
end
# pnpm end


zoxide init fish | source
starship init fish | source
