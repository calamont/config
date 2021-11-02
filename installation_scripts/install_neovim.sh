#!/bin/bash
# title:         Install_neovim.sh
# description:   Installs neovim from source to get the very latest stable version. The `apt-get`
#                version still has the old neovim version on it.
# author:        Callum Lamont

# Download prerequisites
sudo apt-get install ninja-build gettext libtool libtool-bin autoconf automake cmake g++ pkg-config unzip curl

# Clone and build source code
# From the repository's root directory, running make will download and build all the needed 
# dependencies and put the nvim executable in build/bin. Third-party dependencies (libuv, LuaJIT,
# etc.) are downloaded automatically to .deps/. See the FAQ if you have issues.
git clone https://github.com/neovim/neovim
git checkout stable
cd neovim && make -j4
sudo make install

# Install vim-plug
sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs \
       https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'

# Install plugins for neovim

# TODO: should there be a clean up step removing the git repository?
