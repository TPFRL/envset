########
export CONDA_NAME=torch140
conda update conda
conda create -n ${CONDA_NAME} pip python=3.6
conda activate ${CONDA_NAME}
pip install torch==1.4.0+cu100 torchvision==0.5.0+cu100 -f https://download.pytorch.org/whl/torch_stable.html

# Installing Apex. uninstall Apex if present, twice to make absolutely sure :)
pip uninstall -y apex || :
pip uninstall -y apex || :
cd /tmp/unique_for_apex/apex && pip install -v --no-cache-dir --global-option="--cpp_ext" --global-option="--cuda_ext" .

########
ARG CONDA_NAME=torch101
conda create -n ${CONDA_NAME} pip python=3.6 && conda activate ${CONDA_NAME}
conda install pytorch==1.0.1 torchvision==0.2.2 cudatoolkit=10.0

# Installing Apex. uninstall Apex if present, twice to make absolutely sure :)
pip uninstall -y apex || :
pip uninstall -y apex || :
cd /tmp/unique_for_apex/apex && pip install -v --no-cache-dir --global-option="--cpp_ext" --global-option="--cuda_ext" .

########
ARG CONDA_NAME=py2tf113
conda create -n ${CONDA_NAME} pip python=2.7 && conda activate ${CONDA_NAME}
pip install tensorflow-gpu==1.13.2

ARG CONDA_NAME=tf113
conda create -n ${CONDA_NAME} pip python=3.6 && conda activate ${CONDA_NAME}
pip install tensorflow-gpu==1.13.2
