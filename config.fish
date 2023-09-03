# scirpts
if status --is-interactive
    colorscript -r
end

set -Ux fifc_editor nvim
set -U fifc_keybinding \cx
set fish_greeting
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
# eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"

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
        exa --icons --color=always --group-directories-first
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
# MACHINE SPECIFIC abbr'S
#######################################################

abbr web 'cd /var/www/html'
abbr lg 'lazygit'

# Edit this .bashrc file
abbr ebrc 'nvim ~/.bashrc'
abbr ezrc 'nvim ~/.zshrc'
abbr efrc 'nvim ~/.config/fish/config.fish'

# Show help for this .bashrc file
abbr hlp 'less ~/.bashrc_help'

# abbr to show the date
abbr da 'date "+%Y-%m-%d %A %T %Z"'

# abbr's to modified commands
abbr cp 'cp -i'
abbr mv 'mv -i'
abbr rms 'rm -iv'
abbr mkdir 'mkdir -p'
abbr ps 'ps auxf'
abbr ping 'ping -c 10'
abbr less 'less -R'
abbr c 'clear'
abbr Logout 'qdbus org.kde.ksmserver /KSMServer logout 1 0 3'
abbr multitail 'multitail --no-repeat -c'
abbr freshclam 'sudo freshclam'
abbr gtc 'git clone'
abbr colorscheme 'bash -c "$(wget -qO- https://git.io/vQgMr)"'
# abbr grep 'grep --color=auto'
abbr ni 'nvim'
abbr update-grub 'sudo grub2-mkconfig -o "$(readlink -e /etc/grub2.cfg)"'
abbr evrc 'edit ~/.vimrc'
abbr enrc 'edit ~/.nanorc'	
abbr kitty 'LIBGL_ALWAYS_SOFTWARE=true GALLIUM_DRIVER=llvmpipe kitty'

# Remove a directory and all files
abbr rmd '/bin/rm  --recursive --force --verbose '

# Change directory abbres
abbr home 'cd ~'
abbr cd.. 'cd ..'
abbr .. 'cd ..'
abbr ... 'cd ../..'
abbr .... 'cd ../../..'
abbr ..... 'cd ../../../..'

# cd into the old directory
abbr bd 'cd "$OLDPWD"'

abbr le 'ls -ah --color=always' # add colors and file type extensions
abbr lx 'ls -lXBh' # sort by extension
abbr lk 'ls -lSrh' # sort by size
abbr lc 'ls -lcrh' # sort by change time
abbr lu 'ls -luh' # sort by access time
abbr lr 'ls -lRh' # recursive ls
abbr lt 'ls -ltrh' # sort by date
abbr lm 'ls -alh |more' # pipe through 'more'
abbr lw 'ls -xAh' # wide listing format
abbr labc 'ls -lap' #alphabetical sort
abbr lF "ls -l | egrep -v '^d'" # files only
abbr ldir "ls -l | egrep '^d'" # directories only

# special
alias ls='exa -hl --icons --color=always --group-directories-first'
alias ll='exa -hal --icons --color=always --group-directories-first'
alias la='exa -a --icons --color=always --group-directories-first'
alias l='exa --icons --color=always --group-directories-first'
alias lis='exa -1 --icons --color=always --group-directories-first'
alias l.='exa -a | egrep "^\."'

# abbr chmod commands
abbr mx 'chmod a+x'
abbr 000 'chmod -R 000'
abbr 644 'chmod -R 644'
abbr 664 'chmod -R 664'
abbr 666 'chmod -R 666'
abbr 755 'chmod -R 755'
abbr 777 'chmod -R 777'

# Search command line history
abbr h "history | grep "

# Search running processes
abbr p "ps aux | grep "
abbr topcpu "/bin/ps -eo pcpu,pid,user,args | sort -k 1 -r | head -10"

# Search files in the current folder
abbr f "find . | grep "
abbr g "grep -rni --color=auto "
# To see if a command is abbred, a file, or a built-in command
abbr checkcommand "type"

# Show current network connections to the server
abbr ipview "netstat -anpl | grep :80 | awk {'print \$5'} | cut -d\":\" -f1 | sort | uniq -c | sort -n | sed -e 's/^ *//' -e 's/ *\$//'"

# Show open ports
abbr openports 'netstat -nape --inet'

# abbr's for safe and forced reboots
abbr rebootsafe 'sudo shutdown -r now'
abbr rebootforce 'sudo shutdown -r -n now'

# abbr's to show disk space and space used in a folder
abbr diskspace "du -S | sort -n -r |more"
abbr folders 'du -h --max-depth=1'
abbr folderssort 'find . -maxdepth 1 -type d -print0 | xargs -0 du -sk | sort -rn'
abbr tree 'tree -CAhF --dirsfirst'
abbr treed 'tree -CAFd'
abbr mountedinfo 'df -hT'

# abbr's for archives
abbr mktar 'tar -cvf'
abbr mkbz2 'tar -cvjf'
abbr mkgz 'tar -cvzf'
abbr untar 'tar -xvf'
abbr unbz2 'tar -xvjf'
abbr ungz 'tar -xvzf'

# SHA1
abbr sha1 'openssl sha1'
abbr clickpaste 'sleep 3; xdotool type "$(xclip -o -selection clipboard)"'

# fish exclusive
abbr bcd 'bettercd'
abbr bcdun 'bettercd --undo'
abbr lookingglass "~/looking-glass-B5.0.1/client/build/looking-glass-client -F"
abbr cpu "grep 'cpu ' /proc/stat | awk '{usage=(\$2+\$4)*100/(\$2+\$4+\$5)} END {print usage}' | awk '{printf(\"%.1f\n\", \$1)}'"
# set -f --export SHELL (command --search fish)
