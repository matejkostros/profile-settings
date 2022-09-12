#!/bin/bash

myname=$(whoami)
myhome=$(grep ${myname} /etc/passwd|awk -F':' '{print $6}')
PACKAGES="neovim tree python3-pip jq ansible"
#Functions 

# Get latest release of repo from github. Thanks Lukechilds.
# https://gist.github.com/lukechilds/a83e1d7127b78fef38c2914c4ececc3c
get_latest_release() { 
  curl --silent "https://api.github.com/repos/$1/releases/latest" | # Get latest release from GitHub api
    grep '"tag_name":' |                                            # Get tag line
    sed -E 's/.*"([^"]+)".*/\1/'                                    # Pluck JSON value
}

# Install Vivid for prompt coloring
# https://github.com/sharkdp/vivid

install_vivid() {
  VIVID="sharkdp/vivid"
  LATEST_VIVID=$(get_latest_release "${VIVID}")
  printf  "\n ####### Installing Vivid " 
  wget https://github.com/${VIVID}/releases/download/${LATEST_VIVID}/vivid-${LATEST_VIVID}-x86_64-unknown-linux-musl.tar.gz -q && 
  tar xzf vivid-${LATEST_VIVID}-x86_64-unknown-linux-musl.tar.gz && 
  sudo cp vivid-${LATEST_VIVID}-x86_64-unknown-linux-musl/vivid /usr/local/bin/vivid &&
  rm -rf vivid-${LATEST_VIVID}-x86_64-unknown-linux* && echo Success || echo Failed
}


################### MAIN 
# Get sudo password
#read -p "Provide sudo password: " -s sudopass
#printf "%sudopass" | sudo printf "OK" || (echo "Error" && exit 1)

# Find if we are deb or rpm
if test -f "/usr/bin/apt"; then
    INSTALL="sudo apt install"
elif test -f "/usr/bin/dnf"; then
    INSTALL="sudo dnf install"
else
    echo " ####### No known package manager found"
    exit 1
fi

# Install packages
sudo $INSTALL -y ${PACKAGES}   && echo -e "\n ####### Packages PACKAGES installed Successfully"

##### Configure Environment

# Configure nvim
printf "\n ####### Setup NeoVIM "

git clone https://github.com/matejkostros/neovim_config.git ~/.config/nvim &&
pip3 install --user neovim &&
echo alias vim='nvim' >> ~/.bashrc && echo -e "Successfully\n DO NOT FORGET TO INSTALL PLUGS DURING FIRST RUN: \':PlugInstall\'" || echo " Already OK"


# Install vivid
install_vivid 

# Setup fzf
echo -e "\n ####### Setup Fuzzy Search fzf"
git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf
~/.fzf/install --all

# Setup PS1 prompt
if grep -q color_my_prompt ${myhome}/.bashrc; then 
  echo -e "\n ####### PS1 set already set"
else
  printf "\n ####### PS1 not set. Installing: "  
  cat ./ps1_bashrc >> ${myhome}/.bashrc && echo -e "Successfully"
fi

# Setup vimrc
cp ./vimrc ~/.vimrc && echo -e "\n ####### vimrc set Successfully"

