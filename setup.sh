#!/usr/bin/env bash

set -e

# Add your moniker here
MONIKER="YOUR_MONIKER_HERE"

# Checks to see if you've already installed Canto
[ -e /$HOME/Canto ] && rm -rf /$HOME/Canto
[ -e /$HOME/.cantod/config/genesis.json ] && rm -rf /$HOME/.cantod/config/genesis.json

# Updates system and installs dependencies
sudo apt-get -y update && sudo apt-get -y upgrade
sudo snap install go --classic && sudo apt-get install git && sudo apt-get install gcc && sudo apt-get -y install make
cd /$HOME/
git clone https://github.com/Canto-Network/Canto.git
cd Canto
git checkout v5.0.0

# Installs and builds Canto daemon program
cd $HOME/Canto/cmd/cantod
go install -tags ledger ./...
sudo mv $HOME/go/bin/cantod /usr/bin/

cd $HOME/Canto
sudo make install

# Initializes node
cantod init $MONIKER --chain-id canto_7700-1

# Sets seed node
sed -i 's/seeds = ""/seeds = "ade4d8bc8cbe014af6ebdf3cb7b1e9ad36f412c0@seeds.polkachu.com:15556"/' ~/.cantod/config/config.toml

# Sets service file
sudo cp $HOME/canto-node-primer/canto.service /etc/systemd/system/

# Syncs node
cd $HOME/canto-node-primer
chmod 700 state_sync.sh
./state_sync.sh
sudo service canto stop
cantod unsafe-reset-all
sudo service canto start
