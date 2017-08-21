#!/usr/bin/env bash

# Install command-line tools using Homebrew.
# Add tab completion for many Bash commands
if ! which brew &> /dev/null; then
    /usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)";
    brew tap caskroom/cask;
    brew tap caskroom/fonts;
fi;

# Make sure we’re using the latest Homebrew.
brew update
# Upgrade any already-installed formulae.
brew upgrade

# Install GNU core utilities (those that come with macOS are outdated).
# Don’t forget to add `$(brew --prefix coreutils)/libexec/gnubin` to `$PATH`.
brew install coreutils
# Install GNU `find`, `locate`, `updatedb`, and `xargs`, `g`-prefixed.
brew install findutils
# Install GNU `sed`, overwriting the built-in `sed`.
brew install gnu-sed --with-default-names
# Install Bash 4.
brew install bash
brew install bash-completion2

# Switch to using brew-installed bash as default shell
if ! fgrep -q '/usr/local/bin/bash' /etc/shells; then
  # Add `/usr/local/bin/bash` to `/etc/shells` before calling chsh.
  echo '/usr/local/bin/bash' | sudo tee -a /etc/shells;
  chsh -s /usr/local/bin/bash;
fi;

# Symlink Docker bash-completion files if they are installed.
for dockerfile in /Applications/Docker.app/Contents/Resources/etc/{docker.bash-completion,docker-machine.bash-completion,docker-compose.bash-completion}; do
    if [ -f $dockerfile ]; then
        ln -s $dockerfile $(brew --prefix)/etc/bash_completion.d;
    fi
done;
unset dockerfile;

# Install `wget` with IRI support.
brew install wget --with-iri

# Install GnuPG to enable PGP-signing commits.
#brew install gnupg

# Install more recent versions of some macOS tools.
brew install vim --with-override-system-vi
brew install grep
brew install openssh
brew install screen

# Install other useful binaries.
brew install ack
brew install aircrack-ng
brew install dns2tcp
brew install dos2unix
brew install freetype
brew install git
brew install git-lfs
brew install go
brew install hugo
brew install imagemagick --with-webp
brew install mongoose
brew install netcat
brew install nmap
brew install p7zip
brew install pandoc
brew install pngcheck
brew install rename
brew install s3cmd
brew install socat
brew install ssh-copy-id
brew install tcpflow
brew install tcpreplay
brew install tcptrace
brew install tmux
brew install tor
brew install tree
brew install unison
brew install vbindiff
brew install xz
brew install z
brew install zopfli

# Install Caskroom applications.
brew cask install adium
brew cask install cheatsheet
brew cask install dash
brew cask install duet
brew cask install firefox
brew cask install flux
brew cask install gas-mask
brew cask install grammarly
brew cask install kap
brew cask install licecap
brew cask install lingon-x
brew cask install omnigraffle
brew cask install omnioutliner
brew cask install teamviewer
brew cask install vagrant
brew cask install vlc
brew cask install vmware-horizon-client
brew cask install vmware-remote-console
brew cask install wireshark

# Install Caskroom fonts.
brew cask install font-exo
brew cask install font-roboto
brew cask install font-roboto-condensed
brew cask install font-source-code-pro
brew cask install font-source-sans-pro

# Remove outdated versions from the cellar.
brew cleanup
brew cask cleanup

