# Macbook Provisioning

## When you got a new macbook
```
xcode-select --install
/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
brew install ansible
brew install git
brew cask install 1password
brew cask install google-chrome
# login to google account
# generate ssh key for github: https://help.github.com/articles/generating-a-new-ssh-key-and-adding-it-to-the-ssh-agent/
ssh -T git@github.com
git clone git@github.com:doi-t/.macbook-provisioning.git
```

### Install packages and propagate configurations
```
make provision
```
