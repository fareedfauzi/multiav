#!/bin/sh

# Not final bash script, feel fre to edit

echo ""
echo "[+] 1. Run apt update..."
sudo apt update -y

echo "[+] 2. Installing docker..."
sudo snap install docker
sudo apt install docker.io -y

echo "[+] 3. Installing git, python3 and pip for python3..."
sudo apt install git python3 python3-pip -y

echo "[+] 4. Cloning Cyseca MultiAV repository..."
git clone https://github.com/danieljampen/multiav.git

echo "[+] 5. Install requirement..."
cd multiav
pip3 install -e . 


echo "MultiAV is configured via one config file called config.cfg. Refer https://github.com/jampe/MultiAV-Extended/wiki/Configuration for documentation."
echo ""
echo "To start the web interface, run below command: "
echo "$ cd multiav && sudo python3 scripts/runserver.py"
echo ""
echo "If you get an error about “RuntimeError: generator raised StopIteration” when running the runserver.py... run command below to replace utils.py with the new one: "
echo "$ cd $HOME/.local/lib/python3.8/site-packages/web"
echo "$ mv utils.py utils.bak"
echo "$ wget https://raw.githubusercontent.com/webpy/webpy/master/web/utils.py"
