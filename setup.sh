#!/bin/bash

sudo apt-get -y update && sudo apt-get -y upgrade
sudo snap install go --classic && sudo apt-get install git && sudo apt-get install gcc && sudo apt-get -y install make
git clone https://github.com/Canto-Network/Canto.git
cd Canto
git checkout v5.0.0


cd $HOME/Canto/cmd/cantod
go install -tags ledger ./...
sudo mv $HOME/go/bin/cantod /usr/bin/

cd $HOME/Canto
sudo make install
wget https://raw.githubusercontent.com/Canto-Network/Canto/genesis/Networks/Mainnet/genesis.json -P $HOME/.cantod/config/

chmod 700 state_sync.sh
./state_sync.sh
sudo service canto stop
cantod unsafe-reset-all
sudo service canto start
