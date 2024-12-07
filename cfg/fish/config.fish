export _JAVA_AWT_WM_NONREPARENTING=1

set -gx PATH /opt/cuda/bin $PATH
set -gx PATH $HOME/go/bin $PATH
set -gx PATH $HOME/.local/bin $PATH
# set -g LD_LIBRARY_PATH /nix/store/gvb5mha0ly23nkfygl64v71r60sqczbc-system-path/lib/ $LD_LIBRARY_PATH

set -gx DIRENV_ALLOW 1

if status is-interactive
  alias qwenc 'function _qwenc; ollama run qwen2.5-coder p "$argv"; ollama stop qwen2.5-coder; end; _qwenc'
  alias glog="git log --graph --decorate --all --pretty=format:'%C(auto)%h%d %C(#888888)(%an; %ar)%Creset %s'"
  
  alias dnd="xfconf-query -c xfce4-notifyd -p /do-not-disturb --toggle"
  alias isdnd="xfconf-query -c xfce4-notifyd -p /do-not-disturb -v 2>/dev/null"
  
  alias nix-gc="sudo nix-collect-garbage -d"
  alias nix-conf="cd ~/.config/nix && nvim flake.nix"
  alias nix-rbs="sudo nixos-rebuild switch --flake ~/.config/nix#default"
end

# pnpm
set -gx PNPM_HOME "/home/syk/.local/share/pnpm"
if not string match -q -- $PNPM_HOME $PATH
  set -gx PATH "$PNPM_HOME" $PATH
end
# pnpm end

# bun
set --export BUN_INSTALL "$HOME/.bun"
set --export PATH $BUN_INSTALL/bin $PATH

# cargo
set -gx PATH $HOME/.cargo/bin $PATH

# direnv integration
direnv hook fish | source
