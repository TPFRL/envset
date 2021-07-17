# https://cloud.google.com/compute/docs/disks/local-ssd
cd /sbin
export SSD_DIR=/mnt/disks/ssd
sudo mkfs.ext4 -F /dev/sdb
sudo mkdir -p $SSD_DIR
sudo mount /dev/sdb $SSD_DIR
sudo chmod a+w $SSD_DIR

# make swap
sudo fallocate -l 200GB $SSD_DIR/swapfile
sudo chmod 600 $SSD_DIR/swapfile
sudo mkswap $SSD_DIR/swapfile
sudo swapon $SSD_DIR/swapfile

# use tmp folder
sudo mv /tmp $SSD_DIR/tmp
sudo ln -s $SSD_DIR/tmp /tmp

sudo update-alternatives --install /usr/bin/python python /usr/bin/python3.7 1
sudo update-alternatives  --set python /usr/bin/python3.7

# install conda
wget https://repo.anaconda.com/miniconda/Miniconda3-py39_4.9.2-Linux-x86_64.sh
chmod +x Miniconda3-py39_4.9.2-Linux-x86_64.sh
./Miniconda3-py39_4.9.2-Linux-x86_64.sh

# install torch_xla
export ENV_NAME=torch
conda create -n $ENV_NAME python=3.7 pip
conda activate $ENV_NAME

pip install requests
pip install mkl
export version="1.9"
curl https://raw.githubusercontent.com/pytorch/xla/master/contrib/scripts/env-setup.py -o pytorch-xla-env-setup.py
python pytorch-xla-env-setup.py --version $version --tpu dummy
echo "conda activate $ENV_NAME" >> ~/.zshrc
echo "export LD_LIBRARY_PATH=$LD_LIBRARY_PATH:$CONDA_PREFIX/lib" >> ~/.zshrc

# git config
git config --global credential.helper cache
git config --global credential.helper 'cache --timeout=360000'
