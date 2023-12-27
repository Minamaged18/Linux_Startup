#!/bin/bash
# This script is licensed under the MIT License.
# See LICENSE.txt for full details.


# Colorful ASCII Art banner for Cyber World
echo -e "\e[91m  ██████╗ ██████╗  ██████╗ ██████╗ ██╗     ███████╗"
echo -e "\e[92m ██╔════╝██╔═══██╗██╔════╝██╔═══██╗██║     ██╔════╝"
echo -e "\e[93m ██║     ██║   ██║██║     ██║   ██║██║     █████╗  "
echo -e "\e[94m ██║     ██║   ██║██║     ██║   ██║██║     ██╔══╝  "
echo -e "\e[95m ╚██████╗╚██████╔╝╚██████╗╚██████╔╝███████╗███████╗"
echo -e "\e[96m  ╚═════╝ ╚═════╝  ╚═════╝ ╚═════╝ ╚══════╝╚══════╝"
echo -e "\e[97m  Welcome to the Cyber World!"



# Display the main menu
echo "Welcome dude"
echo "(1) Linux Basics"
echo "(2) Blue Team"
echo "(3) Red Team"
echo "(4) All of Them"

read -p "Choose what you want: " mm

# Function to setup basic Linux tools and configurations
setup_linux_basics() {
    echo "Setting up Linux basics..."
    echo "Setup............."
date

# Update repositories and upgrade existing packages
sudo apt update && sudo apt upgrade -y


# Install essential packages
sudo apt-get install -y git python pip nmap

# Setup Wine repository and install Wine
sudo dpkg --add-architecture i386 
sudo mkdir -pm755 /etc/apt/keyrings
sudo wget -O /etc/apt/keyrings/winehq-archive.key https://dl.winehq.org/wine-builds/winehq.key
sudo apt install --install-recommends winehq-stable 
sudo dnf install java-latest-openjdk
sudo apt install default-jre


# Install additional tools
sudo apt-get install gdebi htop tor vlc -y

# Install VS Code
cd ~/Downloads/
git clone https://github.com/Minamaged18/VS-code.git  # iam who create it !! 
cd VS-code
sudo dpkg -i code_1.85.1-1702462158_amd64.deb  

# Fix any broken installations
sudo apt --fix-broken install -y
# Remove downloaded .deb files
sudo rm -rf /var/cache/apt/archives/*.deb
  # Cleanup
sudo apt autoremove -y
sudo rm -rf /var/lib/apt/lists/*
sudo rm -rf ~/Downloads/VS-code

echo "Setup completed!!"
date 
}

# Function to setup Blue Team tools
blue_team_setup() {
    echo "Setting up Blue Team tools..."
    echo "this might take a 5 ~ 15 min .... "
sudo apt install -y nmap

# Nuclei
sudo apt install -y golang
GO111MODULE=on go get -v github.com/projectdiscovery/nuclei/v2/cmd/nuclei

# Masscan
sudo apt install -y git gcc make libpcap-dev
git clone https://github.com/robertdavidgraham/masscan.git
cd masscan
make
sudo cp bin/masscan /usr/local/bin/

# Angry IP Scanner
sudo apt install -y ipscan

# ZMap
sudo apt install -y cmake libgmp3-dev libpcap-dev
git clone https://github.com/zmap/zmap.git
cd zmap
cmake .
make
sudo make install

# Shodan CLI
sudo apt install -y python3-pip
pip3 install shodan

# OpenVAS (Greenbone Vulnerability Management)
sudo apt install -y openvas

# Nessus Essentials (Tenable Vulnerability Scanner)
# Download the Nessus Debian package
wget https://www.tenable.com/downloads/api/v1/public/pages/nessus/downloads/12912/download?i_agree_to_tenable_license_agreement=true -O nessus.deb
sudo dpkg -i nessus.deb
sudo apt --fix-broken install -y

sudo apt install -y openjdk-11-jdk
# Install Elasticsearch
sudo apt install -y elasticsearch
# Install Logstash
sudo apt install -y logstash
# Install Kibana
sudo apt install -y kibana

git clone https://github.com/Neo23x0/yarGen.git
cd yarGen
pip install -r requirements.txt

git clone https://github.com/gchq/CyberChef.git
cd CyberChef
npm install
npm start

sudo apt install sleuthkit
sudo apt install -y openjdk-11-jre

# Download Ghidra from the official repository
git clone https://github.com/NationalSecurityAgency/ghidra.git

# Navigate to the Ghidra directory and run it
cd ghidra
./ghidraRun




# Clone the pafish repository
git clone https://github.com/a0rtega/pafish.git

# Navigate to the directory and follow the instructions provided in the README for usage
cd pafish


sudo apt install yara

# Clone the Cuckoo Sandbox repository
git clone https://github.com/cuckoosandbox/cuckoo.git

# Navigate to the directory and follow the instructions provided in the README for setup and usage
cd cuckoo

sudo apt install radare2
sudo apt install wine64

# Remove downloaded .deb files
sudo rm -rf /var/cache/apt/archives/*.deb

# Cleanup
sudo rm -rf ~/zmap
sudo rm -rf ~/masscan

date 
echo "Setup completed!"
}

# Function to setup Red Team tools
Red_team_setup() {
    echo "Setting up Red Team tools..."
    echo "this might take a 5 ~ 15 min .... "
sudo apt install -y git golang rustc cargo chromium-browser python3 python3-pip
# Install EyeWitness
git clone https://github.com/FortyNorthSecurity/EyeWitness.git
cd EyeWitness/setup && ./setup.sh

# Install jsendpoints
pip3 install jsendpoints

# Install nuclei
GO111MODULE=on go get -v github.com/projectdiscovery/nuclei/v2/cmd/nuclei

# Install gobuster
GO111MODULE=on go get -v github.com/OJ/gobuster/v3@latest

# Install feroxbuster
GO111MODULE=on go get -v github.com/epi052/feroxbuster@latest


# Install dnsrecon
git clone https://github.com/darkoperator/dnsrecon.git
cd dnsrecon && pip3 install -r requirements.txt


# Install spoofcheck
git clone https://github.com/BishopFox/spoofcheck.git
cd spoofcheck && pip3 install -r requirements.txt

# Install AWSBucketDump
git clone https://github.com/jordanpotti/AWSBucketDump.git


# Install truffleHog
pip3 install truffleHog


# Install enum4linux
sudo apt install -y enum4linux

# Install Metabigor
wget https://github.com/j3ssie/metabigor/releases/download/v0.2.8/metabigor-linux-amd64 -O metabigor
chmod +x metabigor

# Install Gitrob
GO111MODULE=on go get -v github.com/michenriksen/gitrob@latest

# Install gowitness
GO111MODULE=on go get -v github.com/sensepost/gowitness@latest


sudo apt install -y metasploit-framework
sudo apt install -y wine64

# Install Go (if not already installed)
sudo apt install -y golang

# Clone EvilGoPhish repository
git clone https://github.com/chrismaddalena/EvilGophish.git

# Navigate to the EvilGoPhish directory
cd EvilGophish

# Build and run EvilGoPhish
go run main.go

# Clone SET repository
git clone https://github.com/trustedsec/social-engineer-toolkit.git

# Navigate to the SET directory
cd social-engineer-toolkit

# Run the installer
sudo ./setup.py install

# Install Hydra
sudo apt install -y hydra


# Install dependencies
pip3 install -r requirements.txt

# Install King Phisher
sudo apt install -y king-phisher

git clone https://github.com/lgandx/Responder.git
cd Responder
gem install evil-winrm
git clone https://github.com/TheWover/donut.git
cd donut

sudo apt update
sudo apt install -y git wget unzip

# Directory to store the tools
TOOLS_DIR="$HOME/tools"
mkdir -p "$TOOLS_DIR"
cd "$TOOLS_DIR" || exit

# Responder
git clone https://github.com/lgandx/Responder.git
cd Responder
sudo apt install -y python3-pip
pip3 install -r requirements.txt
cd "$TOOLS_DIR" || exit

# Impacket
git clone https://github.com/SecureAuthCorp/impacket.git
cd impacket
sudo python3 setup.py install
cd "$TOOLS_DIR" || exit

# evil-winrm
gem install evil-winrm

# Donut
git clone https://github.com/TheWover/donut.git
cd donut
make
cd "$TOOLS_DIR" || exit

# Macro_pack
git clone https://github.com/sevagas/macro_pack.git
cd macro_pack
sudo apt install -y python3-venv
python3 -m venv venv
source venv/bin/activate
pip install -r requirements.txt
deactivate
cd "$TOOLS_DIR" || exit

# PowerSploit
git clone https://github.com/PowerShellMafia/PowerSploit.git

# Rubeus
git clone https://github.com/GhostPack/Rubeus.git
cd Rubeus
make
cd "$TOOLS_DIR" || exit

# SharpUp
git clone https://github.com/GhostPack/SharpUp.git

# UltimateAppLockerByPassList
git clone https://github.com/api0cradle/UltimateAppLockerByPassList.git

# StarFighters
git clone https://github.com/Cn33liz/StarFighters.git

# demiguise
git clone https://github.com/nccgroup/demiguise.git

# PowerZure
git clone https://github.com/hausec/PowerZure.git
cd PowerZure
sudo ./install.sh
cd "$TOOLS_DIR" || exit



# Cleanup
sudo rm -rf ~/tools

echo "setup complete " 
date
}

# Main logic based on user choice
if [ "$mm" -eq 1 ]; then
    setup_linux_basics
elif [ "$mm" -eq 2 ]; then
    blue_team_setup
elif [ "$mm" -eq 3 ]; then
    Red_team_setup
elif [ "$mm" -eq 4 ]; then
    setup_linux_basics
    Red_team_setup
    blue_team_setup
else
    echo "Wrong choice"
    exit 1  # Exit with an error code
fi

echo "Setup completed!"
echo "thank you for using my repository "
exit 0  # Exit with a success code
