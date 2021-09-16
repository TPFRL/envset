sudo apt-get update
sudo update-alternatives --install /usr/bin/python python /usr/bin/python3.8 1

chmod +x envset_sudo.sh && ./envset_sudo.sh

pip install crcmod
