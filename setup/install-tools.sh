# Equinor Developer Conference 2019
# VM pool prep script
# - Download and install docker
# - clone repo with tools and examples
# 

set -x

cd /home/ubuntu

apt-get update
apt-get install -y \
    apt-transport-https \
    ca-certificates \
    curl \
    gnupg-agent \
    software-properties-common
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -
add-apt-repository \
   "deb [arch=amd64] https://download.docker.com/linux/ubuntu \
   $(lsb_release -cs) \
   stable"
apt-get update
apt-get install -y docker-ce docker-ce-cli containerd.io

apt-get install git

mkdir edc
cd edc
git clone https://github.com/equinor/edc2019-docker.git

docker login --username edc --password edcEDC3DC harbor.edc.stian.tech

