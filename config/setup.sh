# Make this script execution path-independent
export DOTFILES_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

echo_success() {
    echo -e "\n\x1B[00;32m$1\x1B[00m"
}

echo_info() {
    echo -e "\n\x1B[00;34m$1\x1B[00m"
}

echo_warning() {
    echo -e "\n\x1B[00;33m$1\x1B[00m"
}

echo_error() {
    echo -e "\n\x1B[00;31m$1\x1B[00m"
}

verify() {
    $* || (echo_error failed 1>&2 && exit 1)
}

###############################################################################
# Setup
###############################################################################
export GITHUB_MAIL="jcrafford@gmail.com"

mkdir ~/Projects 2> /dev/null

###############################################################################
# Xcode (Manual install)
###############################################################################
# https://developer.apple.com/downloads/index.action

# Check that Xcode command line tools exist
echo_info "Checking for Xcode command line tools..."
clang_path=`which clang`
if [[ ! -f $clang_path ]]; then
	echo_error "You need Xcode command line tools to proceed:"
	echo "https://developer.apple.com/downloads/index.action"
	exit -1
fi

###############################################################################
# Homebrew
###############################################################################
# http://mxcl.github.io/homebrew/
# Requires Xcode CLI tools

brew_path=`which brew`
if [[ ! -f $brew_path ]]; then
    echo_info "Installing Homebrew..."
    verify ruby <(curl -fsS https://raw.github.com/mxcl/homebrew/go)
fi

echo_info "Verifying Homebrew install..."
verify brew doctor

# If you get the error:
#   Error: No such file or directory - /usr/local/Cellar
# Run the following:
#   sudo mkdir /usr/local/Cellar
# and
#   sudo chown -R `whoami` /usr/local

echo_info "Updating Homebrew..."
verify brew update

echo_info "Upgrading Homebrew..."
verify brew upgrade

echo_info "Installing Homebrew Formulae and Casks (this may take a while)..."
$DOTFILES_DIR/config/brew.sh

# FIXME: Source .bash_profile or .path now to get updated path before proceeding?

echo_info "Installing Homebrew bash completion..."
# Requires bash-completion formula
verify ln -s "/usr/local/Library/Contributions/brew_bash_completion.sh" "/usr/local/etc/bash_completion.d"

###############################################################################
# Python, pip, Virtualenv, Virtualenvwrapper
###############################################################################
if [ ! -f /usr/local/bin/python ]; then
    mkdir ~/Frameworks
    ln -s "/usr/local/Cellar/python/2.7.2/Frameworks/Python.framework" ~/Frameworks

    pip install --upgrade distribute
    pip install --upgrade pip

    pip install virtualenv
    pip install virtualenvwrapper
fi

###############################################################################
# Git
###############################################################################
echo_info "Checking for SSH key, generating one if it doesn't exist ..."
[[ -f ~/.ssh/id_rsa.pub ]] || ssh-keygen -t rsa -C "$GITHUB_MAIL" -f ~/.ssh/id_rsa

echo_warning "Copying public key to clipboard. Paste it into your Github account ..."
[[ -f ~/.ssh/id_rsa.pub ]] && cat ~/.ssh/id_rsa.pub | pbcopy
verify open https://github.com/settings/ssh

echo_warning "Accept Github fingerprint: (16:27:ac:a5:76:28:2d:36:63:1b:56:4d:eb:df:a6:48)"
ssh -T git@github.com

###############################################################################
# RVM
###############################################################################
# https://rvm.io
# Requires automake formula
curl -L https://get.rvm.io | bash -s stable --ruby

###############################################################################
# nave
###############################################################################
# https://github.com/isaacs/nave
# TODO: curl the nave.sh, symlink it into /bin and use that for initial node install
#npm install -g nave

###############################################################################
# z
###############################################################################
# https://github.com/rupa/z
# z, oh how i love you
#mkdir -p ~/code/z
#curl https://raw.github.com/rupa/z/master/z.sh > ~/code/z/z.sh
#chmod +x ~/code/z/z.sh

###############################################################################
# Pygments
###############################################################################
# for the c alias (syntax highlighted cat)
# FIXME: Use pip install instead
#sudo easy_install Pygments