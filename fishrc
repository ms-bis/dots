# scirpts
if status --is-interactive
    colorscript -r
end

set -Ux fifc_editor nvim
set -U fifc_keybinding \cx

# app
starship init fish | source

# "bat" as manpager
set -x MANPAGER "sh -c 'col -bx | bat -l man -p'"

# vi-mode
fish_vi_key_bindings

# vi-mode bindings
bind yy fish_clipboard_copy
bind Y fish_clipboard_copy
bind p fish_clipboard_paste

# fish vi-mode cursor 
function set_insert_mode_cursor
  echo -en "\e[5 q"  # Set cursor style to blinking vertical bar (|) for insert mode
end

function set_normal_mode_cursor
  echo -en "\e[2 q"  # Set cursor style to block (█) for normal mode
end

function fish_vi_cursor_handle --on-variable fish_bind_mode
  if test "$fish_bind_mode" = "insert"
    set_insert_mode_cursor
  else
    set_normal_mode_cursor
  end
end

# paths, export, source 
eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"

if test -d "/var/lib/flatpak/exports/bin"
    set -gx PATH "/var/lib/flatpak/exports/bin" $PATH
end

set -gx VISUAL nvim
set -gx EDITOR $VISUAL

# Add directories to the PATH
set -x PATH $PATH ~/.local/bin/ ~/.cargo/bin

# Set the OpenAI key
set -x OPENAI_KEY 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

# Add Python executable path to PATH
fish_add_path /usr/bin/python3

# spotify-cli
set -x PATH $PATH ~/.spicetify

# auto ls after cd 
function cd
    # Check if Neovim is running
    if pgrep -x "nvim" > /dev/null
        builtin cd $argv
    else
        builtin cd $argv
        l
    end
end

if status is-interactive
    # Commands to run in interactive sessions can go here
end

function gac
  git add .
  git commit -m $argv[1]
end

function lgac
  git add .
  git commit -m $argv[1]
  git push
end 

#######################################################
# MACHINE SPECIFIC ALIAS'S
#######################################################

alias web='cd /var/www/html'
alias lg='lazygit'

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
alias Logout='qdbus org.kde.ksmserver /KSMServer logout 1 0 3'
alias multitail='multitail --no-repeat -c'
alias freshclam='sudo freshclam'
alias gtc='git clone'
alias colorscheme='bash -c "$(wget -qO- https://git.io/vQgMr)"'
alias grep='grep --color=auto'
alias ni='nvim'
alias update-grub='sudo grub2-mkconfig -o "$(readlink -e /etc/grub2.cfg)"'
alias evrc='edit ~/.vimrc'
alias enrc='edit ~/.nanorc'
	
# Remove a directory and all files
alias rmd='/bin/rm  --recursive --force --verbose '

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
alias ll='exa -hal --icons --color=always --group-directories-first'
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

# SHA1
alias sha1='openssl sha1'
alias clickpaste='sleep 3; xdotool type "$(xclip -o -selection clipboard)"'

# fish exclusive
alias bcd='bettercd'
alias bcdun='bettercd --undo'
alias lookingglass="~/looking-glass-B5.0.1/client/build/looking-glass-client -F"
alias cpu="grep 'cpu ' /proc/stat | awk '{usage=(\$2+\$4)*100/(\$2+\$4+\$5)} END {print usage}' | awk '{printf(\"%.1f\n\", \$1)}'"
