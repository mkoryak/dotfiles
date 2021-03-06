###############################################################################
# Dotfiles
###############################################################################
## Source files in ~/.dotfiles/source/
function src() {
    for file in ~/.dotfiles/source/.{path,colors,prompt,bash_prompt,exports,aliases,functions}; do
        [ -r "$file" ] && source "$file"
    done
}

src

###############################################################################
# Bash Options
###############################################################################
# Files will be created with these permissions:
#   files 644 -rw-r--r-- (666 minus 022)
#   dirs  755 drwxr-xr-x (777 minus 022)
umask 022

# Case-insensitive globbing (used in pathname expansion)
shopt -s nocaseglob

# Append to the Bash history file, rather than overwriting it
shopt -s histappend

# Allows you to re-edit a failed history substitution
shopt -s histreedit

# Auto-correct typos in path names when using `cd`
shopt -s cdspell

# Enable some Bash  4 features when possible:
# * `autocd`, e.g. `**/qux` will enter `./foo/bar/baz/qux`
# * Recursive globbing, e.g. `echo **/*.txt`
for option in autocd globstar; do
    shopt -s "$option" 2> /dev/null
done

# Don't check mail when opening terminal
unset MAILCHECK

###############################################################################
# Completions
###############################################################################
#=====================
# OS X
#=====================
# `defaults read|write NSGlobalDomain`
complete -W "NSGlobalDomain" defaults

#=====================
# Homebrew
#=====================
if [[ "$(type -P brew)" ]]; then
    if [ -f $(brew --prefix)/etc/bash_completion ]; then
        . $(brew --prefix)/etc/bash_completion
    fi
fi

#=====================
# SSH
#=====================
# hostnames based on ~/.ssh/config, ignoring wildcards
[ -e "$HOME/.ssh/config" ] && complete -o "default" -o "nospace" -W "$(grep "^Host" ~/.ssh/config | grep -v "[?*]" | cut -d " " -f2)" scp sftp ssh

#=====================
# Grunt
#=====================
if [[ "$(type -P grunt)" ]]; then
    eval "$(grunt --completion=bash)"
fi

#=====================
# pip
#=====================
function _pip_completion() {
    COMPREPLY=( $( COMP_WORDS="${COMP_WORDS[*]}" \
                   COMP_CWORD=$COMP_CWORD \
                   PIP_AUTO_COMPLETE=1 $1 ) )
}
complete -o default -F _pip_completion pip

#=====================
# z
#=====================
complete -C 'z --complete "$COMP_LINE"' z

###############################################################################
# Initialize Tools
###############################################################################
#=====================
# z
#=====================
if [[ "$(type -P brew)" ]]; then
    if [ -f $(brew --prefix)/etc/profile.d/z.sh ]; then
        . $(brew --prefix)/etc/profile.d/z.sh
    else
        echo "WARNING: Can't find z.sh"
    fi
fi

#=====================
# virtualenvwrapper
#=====================
if [[ "$OSTYPE" =~ ^darwin ]]; then
    if [[ -r "/usr/local/bin/virtualenvwrapper.sh" ]]; then
        source "/usr/local/bin/virtualenvwrapper.sh"
    else
        echo "WARNING: Can't find virtualenvwrapper.sh"
    fi
elif [[ "$(cat /etc/issue 2> /dev/null)" =~ Ubuntu ]]; then
    # The virtualenvwrapper commands are available only after sourcing the completion script
    source "/etc/bash_completion.d/virtualenvwrapper"
fi

#=====================
# rbenv
#=====================
if [[ "$(type -P rbenv)" && ! "$(type -t _rbenv)" ]]; then
    eval "$(rbenv init -)"
fi
