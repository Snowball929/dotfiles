# Lines configured by zsh-newuser-install
HISTFILE=~/.histfile
HISTSIZE=1000
SAVEHIST=1000
# setopt nomatch
export PATH=$PATH:/home/snow/.cargo/bin
export EZA_COLORS="da=32:uu=0:gu=0"
export PKG_CONFIG_PATH=/usr/lib64/pkgconfig/:$PKG_CONFIG_PATH
export WORDCHARS="*?_-.[]~=&;!#$%^(){}<>"
export GREP_COLORS='mt=95'
export FZF_CTRL_R_OPTS="--layout=reverse --color=fg:8,fg+:12,hl:2,hl+:10,gutter:8,info:8,pointer:12,bg+:-1 --border=rounded --height=40%"
export FZF_CTRL_T_OPTS="--layout=reverse --color=fg:8,fg+:12,hl:2,hl+:10,gutter:8,info:8,pointer:12,bg+:-1 --border=rounded --height=40% --preview 'bat --style=numbers --color=always {}'"
setopt GLOB_DOTS
nvidia-smi
clear
#fastfetch
~/scripts/pokefetch.sh

source ~/.zsh/zsh-autosuggestions/zsh-autosuggestions.zsh
source ~/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

alias zi='sudo zypper in '
alias zs='zypper se'
alias zr='sudo zypper rm '
alias zu='sudo zypper dup'
# alias ll='ls -l'
# alias lll='ls -la'
alias ls='eza --icons'
alias ll='eza --icons -lh'
alias lll='eza --icons -lah'
alias lst='eza --icons -laTh'
alias llt='eza --icons -laTh'

alias cat='bat --theme-dark Catppuccin\ Mocha --paging=never'
alias bat='bat --theme-dark Catppuccin\ Mocha --paging=never'
# old_dirfind(){ find $1 -iname "*$2*" -type d 2>/dev/null; }
# old_filefind(){ find $1 -iname "*$2*" -type f 2>/dev/null; }
# old_textfind(){ grep -rnw $1 -e ".*$2.*" 2>/dev/null ; }

alias rg="rg -i. --max-columns 200 2>/dev/null"
alias filefind="fd -H -t f"
alias dirfind="fd -H -t d"

#note that the previous rg alias is effectively used inside textfind alias
alias textfind="rg"


ffmpeg10MB(){ ffmpeg -hide_banner -i $1 -b:v $((75200/$2))k -c:v libsvtav1 $"${1%.*}_shrunk.mp4";}
# alias lt='wine ~/.wine/drive_c/users/snow/AppData/Local/Programs/ADI/LTspice/LTspice.exe&'
alias steg='fortune | cowsay -f stegosaurus'
# alias refreshtheme='kitten themes --reload-in=all porple'
alias dysker='dysk -f "mount=mnt | id=76" -c fs+type+disk+used+free+size+use+mount+label'

# alias clients="hyprctl clients | grep -E --color='auto' 'Window|workspace|class|title|xwayland|size'"
# alias clientsfull="hyprctl clients"
# alias oxicord='~/.cargo/oxicord/target/release/oxicord'
alias hyp='sudo zypper refresh ; zypper if waybar | grep -E "Name|Status|Version"'
alias doomGAME='~/Documents/games/doom-ascii-0.3.1-x86_64-linux/doom-ascii -iwad ~/Documents/games/doom-ascii-0.3.1-x86_64-linux/DOOM1.WAD'
# alias gbash='kate --platformtheme kde ~/.bashrc'
# alias kbash='kate --platformtheme kde ~/.bashrc'
alias kate='kate --platformtheme kde -s Main '
alias geany='kate --platformtheme kde -s Main '
alias konsole='konsole --platformtheme kde'
alias sddm_test='cd /usr/share/sddm/themes/silent/ ; sleep 0.5 ; ./test.sh'

alias pg='pokeget --hide-name '
alias waybarm='nohup waybar -c ~/.config/waybar/configMango.jsonc -s ~/.config/waybar/styleMango.css'
alias mclients="mmsg get all-clients | jq '.'"
alias open='xdg-open'

dotpush() {
  dot add -u
  dot commit -m "update $(date +%Y-%m-%d-%H-%M)"
  dot push
}
bindkey "^[[F" end-of-line
bindkey "^[[H" beginning-of-line
bindkey "^[[3~" delete-char
bindkey "^[[1;5D" backward-word
bindkey "^[[1;5C" forward-word
bindkey "^[[3;5~" kill-word
source <(fzf --zsh)

zstyle ':fzf-tab:*' fzf-flags --color=fg:8,fg+:12,hl:2,hl+:10,gutter:8,info:8,pointer:12,bg+:-1 --border=rounded --height=70% --bind=tab:accept
PROMPT='%n@%m:%~> '

bindkey -e
# End of lines configured by zsh-newuser-install
# The following lines were added by compinstall
zstyle :compinstall filename '/home/snow/.zshrc'

autoload -Uz compinit
compinit


source ~/fzf-tab/fzf-tab.plugin.zsh
unsetopt autocd beep extendedglob notify
# End of lines added by compinstall
ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE='fg=white'
ZSH_HIGHLIGHT_STYLES[suffix-alias]=fg=blue,underline
ZSH_HIGHLIGHT_STYLES[precommand]=fg=blue,underline
ZSH_HIGHLIGHT_STYLES[arg0]=fg=blue

eval "$(zoxide init zsh --cmd cd)"
source ~/powerlevel10k/powerlevel10k.zsh-theme

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh
