cat << EOF
rbenv --version             # => version check
rbenv install --list        # => display the version list
rbenv install [version]     # => install ruby
rbenv rehash                # => reload rbenv
rbenv global [version]      # => setuup the default ruby version
sudo gem update --system
# install vagrant plugin
vagrant plugin install sahara vagrant-cachier vagrant-exec vagrant-proxyconf vagrant-vbguest vagrant-omnibus
EOF
