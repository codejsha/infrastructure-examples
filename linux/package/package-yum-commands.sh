######################################################################

sudo yum update -y

sudo yum --showduplicate list ${PACKAGE}

sudo yum clean all
sudo yum erase -y
sudo yum deplist
sudo yum history
sudo yum history info
sudo yum info
sudo yum install -y
sudo yum list --showduplicate
sudo yum list installed
sudo yum provides
sudo yum repolist
sudo yum search

sudo yum-config-manager \
    --add-repo \
    https://download.docker.com/linux/centos/docker-ce.repo
sudo yum-config-manager --disable docker-ce-stable
