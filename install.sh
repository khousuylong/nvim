#!/bin/bash

apt-get install -y neovim fd-find

sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs \
       https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'

curl https://github.com/wfxr/code-minimap/releases/download/v0.6.2/code-minimap-musl_0.6.2_amd64.deb
dpkg -i code-minimap-musl_0.6.2_amd64.deb
rm code-minimap-musl_0.6.2_amd64.deb

npm install -g prettier

# Ripgrap required by Telescope
curl -LO https://github.com/BurntSushi/ripgrep/releases/download/13.0.0/ripgrep_13.0.0_amd64.deb
dpkg -i ripgrep_13.0.0_amd64.deb
rm ripgrep_13.0.0_amd64.deb


mkdir -p /usr/share/fonts/operator/
cp -u fonts/* /usr/share/fonts/operator/
