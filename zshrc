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
alias lg='lazygit'

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
alias ls='exa -hl --icons --color=always --group-directories-first'
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

alias lookingglass="~/looking-glass-B5.0.1/client/build/looking-glass-client -F"
alias cpu="grep 'cpu ' /proc/stat | awk '{usage=(\$2+\$4)*100/(\$2+\$4+\$5)} END {print usage}' | awk '{printf(\"%.1f\n\", \$1)}'"

#######################################################
# SPECIAL FUNCTIONS
#######################################################

# Use the best version of pico installed
edit() {
    if [ "$(type -t jpico)" = "file" ]; then
        # Use JOE text editor http://joe-editor.sourceforge.net/
        jpico -nonotice -linums -nobackups "$@"
    elif [ "$(type -t nano)" = "file" ]; then
        nano -c "$@"
    elif [ "$(type -t pico)" = "file" ]; then
        pico "$@"
    else
        nvim "$@"
    fi
}
sedit() {
    if [ "$(type -t jpico)" = "file" ]; then
        # Use JOE text editor http://joe-editor.sourceforge.net/
        sudo jpico -nonotice -linums -nobackups "$@"
    elif [ "$(type -t nano)" = "file" ]; then
        sudo nano -c "$@"
    elif [ "$(type -t pico)" = "file" ]; then
        sudo pico "$@"
    else
        sudo nvim "$@"
    fi
}

# Extracts any archive(s) (if unp isn't installed)
extract() {
    for archive in "$@"; do
        if [ -f "$archive" ]; then
            case $archive in
                *.tar.bz2) tar xvjf "$archive" ;;
                *.tar.gz) tar xvzf "$archive" ;;
                *.bz2) bunzip2 "$archive" ;;
                *.rar) rar x "$archive" ;;
                *.gz) gunzip "$archive" ;;
                *.tar) tar xvf "$archive" ;;
                *.tbz2) tar xvjf "$archive" ;;
                *.tgz) tar xvzf "$archive" ;;
                *.zip) unzip "$archive" ;;
                *.Z) uncompress "$archive" ;;
                *.7z) 7z x "$archive" ;;
                *) echo "don't know how to extract '$archive'..." ;;
            esac
        else
            echo "'$archive' is not a valid file!"
        fi
    done
}

# Searches for text in all files in the current folder
ftext() {
    # -i case-insensitive
    # -I ignore binary files
    # -H causes filename to be printed
    # -r recursive search
    # -n causes line number to be printed
    # optional: -F treat search term as a literal, not a regular expression
    # optional: -l only print filenames and not the matching lines ex. grep -irl "$1" *
    grep -iIHrn --color=always "$1" . | less -r
}

# Copy file with a progress bar
cpp() {
    set -e
    strace -q -ewrite cp -- "${1}" "${2}" 2>&1 |
    awk '{
	count += $NF
	if (count % 10 == 0) {
		percent = count / total_size * 100
		printf "%3d%% [", percent
		for (i=0;i<=percent;i++)
			printf "="
			printf ">"
			for (i=percent;i<100;i++)
				printf " "
				printf "]\r"
			}
		}
END { print "" }' total_size="$(stat -c '%s' "${1}")" count=0
}

# Copy and go to the directory
cpg() {
if [ -d "$2" ]; then
    cp "$1" "$2" && cd "$2"
else
    cp "$1" "$2"
fi
}

# Move and go to the directory
mvg() {
if [ -d "$2" ]; then
    mv "$1" "$2" && cd "$2"
else
    mv "$1" "$2"
fi
}

# Create and go to the directory
mkdirg() {
mkdir -p "$1"
cd "$1"
}

# Goes up a specified number of directories  (i.e. up 4)
up() {
local d=""
limit=$1
for ((i = 1; i <= limit; i++)); do
    d=$d/..
done
d=$(echo "$d" | sed 's/^\///')
if [ "$d" = "" ]; then
    d=..
fi
cd "$d"
}

# Automatically do an ls after each cd
cd ()
{
	if [ -n "$1" ]; then
		builtin cd "$@" && l
	else
		builtin cd ~ && l
	fi
}

# Returns the last 2 fields of the working directory
pwdtail() {
pwd | awk -F/ '{nlast = NF -1;print $nlast"/"$NF}'
}

# Show the current distribution
distribution() {
local dtype
# Assume unknown
dtype="unknown"

# First test against Fedora / RHEL / CentOS / generic Redhat derivative
if [ -r /etc/rc.d/init.d/functions ]; then
    source /etc/rc.d/init.d/functions
    [ zz"$(type -t passed 2>/dev/null)" == "zzfunction" ] && dtype="redhat"

    # Then test against SUSE (must be after Redhat,
    # I've seen rc.status on Ubuntu I think? TODO: Recheck that)
elif [ -r /etc/rc.status ]; then
    source /etc/rc.status
    [ zz"$(type -t rc_reset 2>/dev/null)" == "zzfunction" ] && dtype="suse"

    # Then test against Debian, Ubuntu and friends
elif [ -r /lib/lsb/init-functions ]; then
    source /lib/lsb/init-functions
    [ zz"$(type -t log_begin_msg 2>/dev/null)" == "zzfunction" ] && dtype="debian"

    # Then test against Gentoo
elif [ -r /etc/init.d/functions.sh ]; then
    source /etc/init.d/functions.sh
    [ zz"$(type -t ebegin 2>/dev/null)" == "zzfunction" ] && dtype="gentoo"

    # For Mandriva we currently just test if /etc/mandriva-release exists
    # and isn't empty (TODO: Find a better way :)
elif [ -s /etc/mandriva-release ]; then
    dtype="mandriva"

    # For Slackware we currently just test if /etc/slackware-version exists
elif [ -s /etc/slackware-version ]; then
    dtype="slackware"

fi
echo "$dtype"
}

# Show the current version of the operating system
ver() {
local dtype
dtype=$(distribution)

if [ "$dtype" == "redhat" ]; then
    if [ -s /etc/redhat-release ]; then
        cat /etc/redhat-release && uname -a
    else
        cat /etc/issue && uname -a
    fi
elif [ "$dtype" == "suse" ]; then
    cat /etc/SuSE-release
elif [ "$dtype" == "debian" ]; then
    lsb_release -a
    # sudo cat /etc/issue && sudo cat /etc/issue.net && sudo cat /etc/lsb_release && sudo cat /etc/os-release # Linux Mint option 2
elif [ "$dtype" == "gentoo" ]; then
    cat /etc/gentoo-release
elif [ "$dtype" == "mandriva" ]; then
    cat /etc/mandriva-release
elif [ "$dtype" == "slackware" ]; then
    cat /etc/slackware-version
else
    if [ -s /etc/issue ]; then
        cat /etc/issue
    else
        echo "Error: Unknown distribution"
        exit 1
    fi
fi
}

# Automatically install the needed support files for this .bashrc file
install_bashrc_support() {
local dtype
dtype=$(distribution)

if [ "$dtype" == "redhat" ]; then
    sudo yum install multitail tree joe
elif [ "$dtype" == "suse" ]; then
    sudo zypper install multitail
    sudo zypper install tree
    sudo zypper install joe
elif [ "$dtype" == "debian" ]; then
    sudo apt-get install multitail tree joe
elif [ "$dtype" == "gentoo" ]; then
    sudo emerge multitail
    sudo emerge tree
    sudo emerge joe
elif [ "$dtype" == "mandriva" ]; then
    sudo urpmi multitail
    sudo urpmi tree
    sudo urpmi joe
elif [ "$dtype" == "slackware" ]; then
    echo "No install support for Slackware"
else
    echo "Unknown distribution"
fi
}

# Show current network information
netinfo() {
echo "--------------- Network Information ---------------"
/sbin/ifconfig | awk /'inet addr/ {print $2}'
echo ""
/sbin/ifconfig | awk /'Bcast/ {print $3}'
echo ""
/sbin/ifconfig | awk /'inet addr/ {print $4}'

/sbin/ifconfig | awk /'HWaddr/ {print $4,$5}'
echo "---------------------------------------------------"
}

# IP address lookup
alias whatismyip="whatsmyip"
function whatsmyip() {
# Dumps a list of all IP addresses for every device
# /sbin/ifconfig |grep -B1 "inet addr" |awk '{ if ( $1 == "inet" ) { print $2 } else if ( $2 == "Link" ) { printf "%s:" ,$1 } }' |awk -F: '{ print $1 ": " $3 }';

# Internal IP Lookup
echo -n "Internal IP: "
/sbin/ifconfig eth0 | grep "inet addr" | awk -F: '{print $2}' | awk '{print $1}'

# External IP Lookup
echo -n "External IP: "
wget http://smart-ip.net/myip -O - -q
}

# View Apache logs
apachelog() {
if [ -f /etc/httpd/conf/httpd.conf ]; then
    cd /var/log/httpd && ls -xAh && multitail --no-repeat -c -s 2 /var/log/httpd/*_log
else
    cd /var/log/apache2 && ls -xAh && multitail --no-repeat -c -s 2 /var/log/apache2/*.log
fi
}

# Edit the Apache configuration
apacheconfig() {
if [ -f /etc/httpd/conf/httpd.conf ]; then
    sedit /etc/httpd/conf/httpd.conf
elif [ -f /etc/apache2/apache2.conf ]; then
    sedit /etc/apache2/apache2.conf
else
    echo "Error: Apache config file could not be found."
    echo "Searching for possible locations:"
    sudo updatedb && locate httpd.conf && locate apache2.conf
fi
}

# Edit the PHP configuration file
phpconfig() {
if [ -f /etc/php.ini ]; then
    sedit /etc/php.ini
elif [ -f /etc/php/php.ini ]; then
    sedit /etc/php/php.ini
elif [ -f /etc/php5/php.ini ]; then
    sedit /etc/php5/php.ini
elif [ -f /usr/bin/php5/bin/php.ini ]; then
    sedit /usr/bin/php5/bin/php.ini
elif [ -f /etc/php5/apache2/php.ini ]; then
    sedit /etc/php5/apache2/php.ini
else
    echo "Error: php.ini file could not be found."
    echo "Searching for possible locations:"
    sudo updatedb && locate php.ini
fi
}

# Edit the MySQL configuration file
mysqlconfig() {
if [ -f /etc/my.cnf ]; then
    sedit /etc/my.cnf
elif [ -f /etc/mysql/my.cnf ]; then
    sedit /etc/mysql/my.cnf
elif [ -f /usr/local/etc/my.cnf ]; then
    sedit /usr/local/etc/my.cnf
elif [ -f /usr/bin/mysql/my.cnf ]; then
    sedit /usr/bin/mysql/my.cnf
elif [ -f ~/my.cnf ]; then
    sedit ~/my.cnf
elif [ -f ~/.my.cnf ]; then
    sedit ~/.my.cnf
else
    echo "Error: my.cnf file could not be found."
    echo "Searching for possible locations:"
    sudo updatedb && locate my.cnf
fi
}

# For some reason, rot13 pops up everywhere
rot13() {
if [ $# -eq 0 ]; then
    tr '[a-m][n-z][A-M][N-Z]' '[n-z][a-m][N-Z][A-M]'
else
    echo "$@" | tr '[a-m][n-z][A-M][N-Z]' '[n-z][a-m][N-Z][A-M]'
fi
}

# Trim leading and trailing spaces (for scripts)
trim() {
local var=$@
var="${var#"${var%%[![:space:]]*}"}" # remove leading whitespace characters
var="${var%"${var##*[![:space:]]}"}" # remove trailing whitespace characters
echo -n "$var"
}
# GitHub Titus Additions

gcom() {
git add .
git commit -m "$1"
}
lazyg() {
git add .
git commit -m "$1"
git push
}

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



