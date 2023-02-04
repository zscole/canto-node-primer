# Canto Node Primer
## How To Set Up A Canto Node  
  
  

Hello, friend! Welcome to Cantofornia! This guide is intended for people who are new to Canto and want to run a personal node. It is not written for people who are already running a node. If you are already running a node, you probably don't need this guide. 

This is meant to be a friendly and informal how-to for network hobbyists, community members, and anyone else who wants to quickly set up a node for personal use.  

If you have any more advanced questions, feel free to ask them in the [Canto Cult Telegram group](https://t.me/cantocult). You can also [DM me on Twitter](https://twitter.com/0xzak). 

 Although I am a core contributor to the project, I do not speak for the community. 

## What is Canto?
Before we dive into the technical details, let's quickly go over the basics of the Canto community. 

Canto is a permissionless, general-purpose blockchain running the Ethereum Virtual Machine (EVM).

It was built using the [Cosmos SDK](https://github.com/cosmos/cosmos-sdk), which is a framework for building blockchains.

One of the primary goals of Canto, as an experimental project, is to provide an alternative financial system that is easy to use and understand. The reason I do what I do is to build systems that enable decentralized finance (DeFi) services for the world in a manner that ensures consent, privacy, and equitable access to anyone who would want to join and participate within the community. 

Now, let's dive into the technical details.

# Recommended System Requirements:
    
      * A computer or VM with a 64-bit operating system (Windows, Linux, Mac OS X, etc.)
      * At least 2GB of RAM
      * At least 10GB of free disk space
      * A broadband internet connection
      * A static IP address (optional, but recommended)
      * A Canto wallet (optional, but recommended)

I am setting up a node on a VM that I have deployed on [Google Cloud Platform](https://cloud.google.com/). 
I'm using Ubuntu 18.04 LTS. I have selected a general-purpose e2-standard-4 VM with 4 vCPUs, 16GB of RAM, and 300GB of disk space. 
If you require high perfomance, I would recommend running NVME SSDs, but for the purpose of this guide, I'm using standard persistent disks. 
The total monthly cost for a VM with this configuration is approximately $127.84, or about $0.18 hourly.

# Network Details
Network Type: Mainnet  
Chain ID: canto_7700-1  
Current Node Version: v5.0.0.  

# Run Bash Script
Included in this repository is a simple bash script that will install all of the necessary dependencies, set up your node, and configure everything needed to get going. 

Git clone this repository to your home directory and then navigate to the folder once it's successfully cloned.  

From the `$HOME/canto-node-primer` folder, run `chmod 700 setup.sh` to make the bash script an executable file. 

Before running the script, edit the `canto.service` file and replace `INSERT_YOUR_USERNAME_HERE` with your username on line 7. If you're on a VM, you can edit the file from your CLI by running `vim canto.service`. If you're not sure what your username is, just run the command `echo $USER`, which will return your username. 

Then run `./setup.sh` and let the script work its magic.




