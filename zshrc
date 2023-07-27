# paths
export ZSH="$HOME/.oh-my-zsh"

export PATH="${PATH}:${HOME}/.local/bin/"
export PATH="${PATH}:${HOME}/.cargo/bin"

export OPENAI_KEY=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

# apps
eval "$(starship init zsh)"
eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"

if [ -d "/var/lib/flatpak/exports/bin" ] ; then
    PATH="/var/lib/flatpak/exports/bin:$PATH"
fi

if [ -e /home/msbis/.nix-profile/etc/profile.d/nix.sh ]; then . /home/msbis/.nix-profile/etc/profile.d/nix.sh; fi # added by Nix installer

# scripts
colorscript -r

# ZSH_THEME="robbyrussell"

plugins=( git z zsh-autosuggestions zsh-syntax-highlighting web-search vi-mode fzf-tab command-not-found fast-syntax-highlighting )

# sources
source $ZSH/oh-my-zsh.sh

#######################################################
# MACHINE SPECIFIC ALIAS'S
#######################################################

# Alias's to change the directory
alias web='cd /var/www/html'

# Edit this .bashrc file
alias ebrc='ni ~/.bashrc'
alias ezrc='ni ~/.zshrc'
alias efrc='ni ~/.config/fish/config.fish'

# Show help for this .bashrc file
alias hlp='less ~/.bashrc_help'

# alias to show the date
alias da='date "+%Y-%m-%d %A %T %Z"'

# Alias's to modified commands
alias cp='cp -i'
alias mv='mv -i'
alias rms='rm -iv'
alias mkdir='mkdir -p'
alias ps='ps auxf'
alias ping='ping -c 10'
alias less='less -R'
alias c='clear'

alias update='sudo nala update'
alias upgrade='sudo nala upgrade'
alias .apt='sudo nala'
alias s.apt='sudo nala search'
alias i.apt='sudo nala install'
alias r.apt='sudo nala remove'
#alias sug='--install-suggests'
alias s.fpk='flatpak search'
alias i.fpk='flatpak install'
alias r.fpk='flatpak remove'
alias s.snp='snap search'
alias i.snp='snap install'
alias r.snp='snap remove'
alias r.plasma='kwin_x11 --replace; plasmashell --replace'

alias multitail='multitail --no-repeat -c'
alias freshclam='sudo freshclam'

alias kitty='LIBGL_ALWAYS_SOFTWARE=true GALLIUM_DRIVER=llvmpipe kitty'
alias alacritty='LIBGL_ALWAYS_SOFTWARE=1 alacritty'
alias gtc='git clone'

alias colorscheme='bash -c "$(wget -qO- https://git.io/vQgMr)"'
alias svi='sudo vim'
alias vis='nvim "+set si"'
alias grep='grep --color=auto'
alias ni='nvim'
alias sni='sudo nvim'
alias update-grub='sudo grub2-mkconfig -o "$(readlink -e /etc/grub2.cfg)"'
alias evrc='edit ~/.vimrc'
alias enrc='edit ~/.nanorc'
alias na='nano'
alias sna='sudo nano'
# alias sublime='/opt/sublime_text/sublime_text %F'
alias li='lvim'
alias sli='sudo lvim'
alias firefox-esr='gtk3-nocsd firefox-esr'
alias lutris='gtk3-nocsd lutris'
alias mpv='io.mpv.Mpv'
# Change directory aliases
alias home='cd ~'
alias cd..='cd ..'
alias ..='cd ..'
alias ...='cd ../..'
alias ....='cd ../../..'
alias .....='cd ../../../..'

# cd into the old directory
alias bd='cd "$OLDPWD"'

alias le='ls -aFh --color=always' # add colors and file type extensions
alias lx='ls -lXBh' # sort by extension
alias lk='ls -lSrh' # sort by size
alias lc='ls -lcrh' # sort by change time
alias lu='ls -luh' # sort by access time
alias lr='ls -lRh' # recursive ls
alias lt='ls -ltrh' # sort by date
alias lm='ls -alh |more' # pipe through 'more'
alias lw='ls -xAh' # wide listing format
alias labc='ls -lap' #alphabetical sort
alias lf="ls -l | egrep -v '^d'" # files only
alias ldir="ls -l | egrep '^d'" # directories only

# special
alias ls='exa --icons --color=always --group-directories-first'
alias ll='exa -halF --icons --color=always --group-directories-first'
alias la='exa -a --icons --color=always --group-directories-first'
alias l='exa --icons --color=always --group-directories-first'
alias lis='exa -1 --icons --color=always --group-directories-first'
alias l.='exa -a | egrep "^\."'

# alias chmod commands
alias mx='chmod a+x'
alias 000='chmod -R 000'
alias 644='chmod -R 644'
alias 664='chmod -R 664'
alias 666='chmod -R 666'
alias 755='chmod -R 755'
alias 777='chmod -R 777'

# Search command line history
alias h="history | grep "

# Search running processes
alias p="ps aux | grep "
alias topcpu="/bin/ps -eo pcpu,pid,user,args | sort -k 1 -r | head -10"

# Search files in the current folder
alias f="find . | grep "

# Count all files (recursively) in the current folder
alias countfiles="for t in files links directories; do echo \`find . -type \${t:0:1} | wc -l\` \$t; done 2> /dev/null"

# To see if a command is aliased, a file, or a built-in command
alias checkcommand="type"

# Show current network connections to the server
alias ipview="netstat -anpl | grep :80 | awk {'print \$5'} | cut -d\":\" -f1 | sort | uniq -c | sort -n | sed -e 's/^ *//' -e 's/ *\$//'"

# Show open ports
alias openports='netstat -nape --inet'

# Alias's for safe and forced reboots
alias rebootsafe='sudo shutdown -r now'
alias rebootforce='sudo shutdown -r -n now'

# Alias's to show disk space and space used in a folder
alias diskspace="du -S | sort -n -r |more"
alias folders='du -h --max-depth=1'
alias folderssort='find . -maxdepth 1 -type d -print0 | xargs -0 du -sk | sort -rn'
alias tree='tree -CAhF --dirsfirst'
alias treed='tree -CAFd'
alias mountedinfo='df -hT'

# Alias's for archives
alias mktar='tar -cvf'
alias mkbz2='tar -cvjf'
alias mkgz='tar -cvzf'
alias untar='tar -xvf'
alias unbz2='tar -xvjf'
alias ungz='tar -xvzf'

# Show all logs in /var/log
alias logs="sudo find /var/log -type f -exec file {} \; | grep 'text' | cut -d' ' -f1 | sed -e's/:$//g' | grep -v '[0-9]$' | xargs tail -f"

# SHA1
alias sha1='openssl sha1'
alias clickpaste='sleep 3; xdotool type "$(xclip -o -selection clipboard)"'

# #######################################################
# ## fzf-tab
# #######################################################
# disable sort when completing `git checkout`
zstyle ':completion:*:git-checkout:*' sort false
# set descriptions format to enable group support
zstyle ':completion:*:descriptions' format '[%d]'
# set list-colors to enable filename colorizing
zstyle ':completion:*' list-colors ${(s.:.)LS_COLORS}
# preview directory's content with exa when completing cd
zstyle ':fzf-tab:complete:cd:*' fzf-preview 'exa -1 --icons --color=always $realpath'
# switch group using `,` and `.`
zstyle ':fzf-tab:*' switch-group ',' '.'
zstyle ':fzf-tab:*' show-group full
# disable sort when completing options of any command
zstyle ':completion:complete:*:options' sort false
# use input as query string when completing zlua
zstyle ':fzf-tab:complete:_zlua:*' query-string input
zstyle ':fzf-tab:complete:cd:*' fzf-preview 'exa -1 --icons --color=always $realpath' # remember to use single quote here!!!
zstyle ':fzf-tab:complete:systemctl-*:*' fzf-preview 'SYSTEMD_COLORS=1 systemctl status $word'
zstyle ':fzf-tab:complete:*:*' fzf-preview 'less ${(Q)realpath}'
export LESSOPEN='|~/.lessfilter %s'
zstyle ':fzf-tab:complete:(-command-|-parameter-|-brace-parameter-|export|unset|expand):*' \
    fzf-preview 'echo ${(P)word}'
zstyle ':fzf-tab:complete:-command-:*' \
    fzf-preview '(out=$(tldr --color always "$word") 2>/dev/null && echo $out) || (out=$(MANWIDTH=$FZF_PREVIEW_COLUMNS man "$word") 2>/dev/null && echo $out) || (out=$(which "$word") && echo $out) || echo "${(P)word}"'
zstyle ':fzf-tab:complete:tldr:argument-1' fzf-preview 'tldr --color always $word'
zstyle ':fzf-tab:complete:brew-(install|uninstall|search|info):*-argument-rest' fzf-preview 'brew info $word'
# this is an example
zstyle ':fzf-tab:complete:(\\|)run-help:*' fzf-preview 'run-help $word'
zstyle ':fzf-tab:complete:(\\|*/|)man:*' fzf-preview 'man $word'
# Git
# it is an example. you can change it
zstyle ':fzf-tab:complete:git-(add|diff|restore):*' fzf-preview \
    'git diff $word | delta'
zstyle ':fzf-tab:complete:git-log:*' fzf-preview \
    'git log --color=always $word'
zstyle ':fzf-tab:complete:git-help:*' fzf-preview \
    'git help $word | bat -plman --color=always'
zstyle ':fzf-tab:complete:git-show:*' fzf-preview \
    'case "$group" in
	"commit tag") git show --color=always $word ;;
	*) git show --color=always $word | delta ;;
esac'
zstyle ':fzf-tab:complete:git-checkout:*' fzf-preview \
    'case "$group" in
	"modified file") git diff $word | delta ;;
	"recent commit object name") git show --color=always $word | delta ;;
	*) git log --color=always $word ;;
esac'


