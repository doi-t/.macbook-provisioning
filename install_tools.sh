#!/bin/bash

# install vagrant plugin
vagrant plugin install sahara vagrant-cachier vagrant-exec vagrant-proxyconf vagrant-vbguest vagrant-omnibus vagrant-rsync-back

# terminal
echo 'setup iTerm2 Color Presets: https://github.com/altercation/solarized/tree/master/iterm2-colors-solarized'
echo 'choose Ricty in iTerm2 preferences: Performances > Profiles > Text'

# kubernetes
echo 'Download the Google Cloud SDK from https://cloud.google.com/sdk/docs/quickstart-mac-os-x'
sh /usr/local/bin/google-cloud-sdk/install.sh
gcloud components update
