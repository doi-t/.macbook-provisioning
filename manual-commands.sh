cat << EOF
rbenv --version             # => version check
rbenv install --list        # => display the version list
rbenv install [version]     # => install ruby
rbenv rehash                # => reload rbenv
rbenv global [version]      # => setuup the default ruby version
sudo gem update --system
# install vagrant plugin
vagrant plugin install sahara vagrant-cachier vagrant-exec vagrant-proxyconf vagrant-vbguest vagrant-omnibus
# python tools
easy_install pip
pip install awscli
pip install virtualenv
# setup iteam2 for solarized http://qiita.com/ApricotHoney/items/f83e4aa9c1cd83755c68
# choose Ricty in iTerm2 preferences: Performances > Profiles > Text
EOF
