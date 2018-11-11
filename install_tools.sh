#!/bin/bash

# Ruby
rbenv install --list        # => display the version list
rbenv install [version]     # => install ruby
rbenv rehash                # => reload rbenv
rbenv global [version]      # => setuup the default ruby version
sudo gem update --system

# install vagrant plugin
vagrant plugin install sahara vagrant-cachier vagrant-exec vagrant-proxyconf vagrant-vbguest vagrant-omnibus vagrant-rsync-back

# python tools
pip install virtualenv

# terminal
echo 'setup iTerm2 Color Presets: https://github.com/altercation/solarized/tree/master/iterm2-colors-solarized'
echo 'choose Ricty in iTerm2 preferences: Performances > Profiles > Text'

# kubernetes
echo 'Download the Google Cloud SDK from https://cloud.google.com/sdk/docs/quickstart-mac-os-x'
sh /usr/local/bin/google-cloud-sdk/install.sh
gcloud components update

# go
gometalinter --install

# rust
cargo install bat

# terraform
terraform -install-autocomplete # Ref. https://github.com/hashicorp/terraform/tree/master/contrib/zsh-completion
