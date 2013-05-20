#!/bin/bash

# Utilities, helpers
source ~/.dotfiles/config/utils.sh

###############################################################################
# Personal Configuration
###############################################################################
export GITHUB_MAIL="jcrafford@gmail.com"

# Create development directories
mkdir ~/Projects 2> /dev/null
mkdir ~/Tools 2> /dev/null

###############################################################################
# Python, pip, Virtualenv, Virtualenvwrapper
###############################################################################
e_header "Configuring Python and tools..."
if ! skip; then
    if [[ "$(type -P python)" ]]; then
        if [[ "$OSTYPE" =~ ^darwin ]]; then
            e_header "Linking Python framework..."
            ln -s "/usr/local/Cellar/python/2.7.4/Frameworks/Python.framework" ~/Frameworks
        fi

        e_header "Upgrading Distribute and pip..."
        sudo pip install --upgrade distribute
        sudo pip install --upgrade pip

        e_header "Installing pip tools..."
        # pip-tools includes:
        #   pip-review - reports available updates
        #   pip-dump - generates requirements.txt
        sudo pip install pip-tools

        e_header "Installing virtualenv and virtualenvwrapper..."
        sudo pip install virtualenv
        sudo pip install virtualenvwrapper

        e_header "Installing IPython..."
        sudo pip install ipython
    fi
fi

###############################################################################
# Git
###############################################################################
e_header "Configuring GitHub for SSH access..."
if ! skip; then
    e_header "Checking for SSH key, generating one if it doesn't exist ..."
    [[ -f ~/.ssh/id_rsa.pub ]] || ssh-keygen -t rsa -C "$GITHUB_MAIL" -f ~/.ssh/id_rsa

    echo_warning "Copying public key to clipboard. Paste it into your Github account ..."
    [[ -f ~/.ssh/id_rsa.pub ]] && cat ~/.ssh/id_rsa.pub | pbcopy
    verify open https://github.com/settings/ssh

    echo_warning "Accept Github fingerprint: (16:27:ac:a5:76:28:2d:36:63:1b:56:4d:eb:df:a6:48)"
    ssh -T git@github.com
fi

###############################################################################
# nginx
###############################################################################
# http://learnaholic.me/2012/10/10/installing-nginx-in-mac-os-x-mountain-lion/
# https://openmile.unfuddle.com/a#/projects/1/notebooks/2/pages/195/latest

###############################################################################
# MySQL
###############################################################################
# http://madebyhoundstooth.com/blog/install-mysql-on-mountain-lion-with-homebrew/
# https://openmile.unfuddle.com/a#/projects/1/notebooks/2/pages/13/latest
# http://dev.mysql.com/doc/refman/5.0/en/macosx-installation.html

if [[ "$(type -P mysql)" ]]; then
    if [[ "$OSTYPE" =~ ^darwin ]]; then
        e_header "Installing MySQL DB..."
        if ! skip; then
            unset TMPDIR
            mysql_install_db --verbose --user=`whoami` --basedir="$(brew --prefix mysql)" --datadir=/usr/local/var/mysql --tmpdir=/tmp

            # To start mysqld at boot time you have to copy support-files/mysql.server to the right place for your system
            e_header "Installing MySQL startup item..."
            sudo mkdir /Library/StartupItems/MySQLCOM
            sudo ln -s $(brew --prefix mysql)/support-files/mysql.server /Library/StartupItems/MySQLCOM/MySQLCOM
        fi
    fi
fi

# PLEASE REMEMBER TO SET A PASSWORD FOR THE MySQL root USER !
# To do so, start the server, then issue the following commands:
#   mysql.server start
#   /usr/local/opt/mysql/bin/mysqladmin -u root password 'new-password'
#   /usr/local/opt/mysql/bin/mysqladmin -u root -h Justins-MacBook-Pro.local password 'new-password'

# Alternatively you can run:
#  /usr/local/opt/mysql/bin/mysql_secure_installation

# which will also give you the option of removing the test databases and anonymous user created by default.
# This is strongly recommended for production servers.

# You can start the MySQL daemon with:
#   cd . ; /usr/local/opt/mysql/bin/mysqld_safe &

# You can test the MySQL daemon with mysql-test-run.pl
#   cd mysql-test ; perl mysql-test-run.pl

# WARNING: Found existing config file /usr/local/opt/mysql/my.cnf on the system.
# The new default config file was created as /usr/local/opt/mysql/my-new.cnf

###############################################################################
# MySQL-diff
###############################################################################
# https://bitbucket.org/stepancheg/mysql-diff/downloads
# FIXME: wget and install mysql-diff into ~/Tools/mysql-diff

###############################################################################
# RabbitMQ
###############################################################################
# https://openmile.unfuddle.com/a#/projects/1/notebooks/2/pages/122/latest
e_header 'Configuring RabbitMQ users and permissions...'
if ! skip; then
    if [[ "$(type -P rabbitmqctl)" ]]; then
        e_header 'Starting RabbitMQ server...'
        rabbitmq-server

        e_header 'Creating Open Mile users...'
        sudo rabbitmqctl add_user om om
        sudo rabbitmqctl set_user_tags om administrator
        sudo rabbitmqctl set_permissions om ".*" ".*" ".*"
        sudo rabbitmqctl delete_user guest
    fi
fi

###############################################################################
# Install Npm modules
###############################################################################
npm_globals=(
    grunt
    bower
    less
    jshint
    uglify-js
)

if [[ "$(type -P npm)" ]]; then
    e_header "Updating Npm..."
    npm update -g npm

    { pushd "$(npm config get prefix)/lib/node_modules"; installed=(*); popd; } > /dev/null
    list="$(to_install "${npm_globals[*]}" "${installed[*]}")"
    if [[ "$list" ]]; then
        e_header "Installing Npm modules: $list"
        npm install -g $list
    fi
fi

###############################################################################
# Install Node.js via nave
###############################################################################
#if [[ "$(type -P nave)" ]]; then
#    nave_stable="$(nave stable)"
#    if [[ "$(node --version 2>/dev/null)" != "v$nave_stable" ]]; then
#        e_header "Installing Node.js $nave_stable"
#        # Install most recent stable version.
#        nave install stable >/dev/null 2>&1
#    fi
#    if [[ "$(nave ls | awk '/^default/ {print $2}')" != "$nave_stable" ]]; then
#        # Alias the stable version of node as "default".
#        nave use default stable true
#    fi
#fi

###############################################################################
# Install Ruby
###############################################################################
if [[ "$(type -P rbenv)" ]]; then
    versions=( 1.9.3-p194 1.9.2-p290 )

    list="$(to_install "${versions[*]}" "$(rbenv whence ruby)")"
    if [[ "$list" ]]; then
        e_header "Installing Ruby versions: $list"
        for version in $list; do
            rbenv install "$version";
        done
        [[ "$(echo "$list" | grep -w "${versions[0]}")" ]] && rbenv global "${versions[0]}"
        rbenv rehash
    fi
fi

###############################################################################
# Install Gems
###############################################################################
if [[ "$(type -P gem)" ]]; then
    gems=( bundler interactive_editor )

    list="$(to_install "${gems[*]}" "$(gem list | awk '{print $1}')")"
    if [[ "$list" ]]; then
        e_header "Installing Ruby gems: $list"
        gem install $list
    fi
fi

