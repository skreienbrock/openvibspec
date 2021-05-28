# the provided base image:
FROM 		nvidia/cuda:11.0-base
# Maintainer
MAINTAINER	sven.kreienbrock@ruhr-uni-bochum.de
MAINTAINER	arne.raulf@ruhr-uni-bochum.de
# default system update & upgrade
RUN	apt-get -qq -y update && apt-get -qq -y upgrade
# install some necessary base packages
RUN	apt-get -y -qq install vim wget curl apt-transport-https git
# install anaconda individual edition in silent mode:
ENV	ANACONDA_VER=Anaconda3-2021.04-Linux-x86_64.sh
RUN	wget https://repo.anaconda.com/archive/$ANACONDA_VER
RUN	/bin/bash $ANACONDA_VER -b -u -p /opt/anaconda3
# delete Anaconda-Installer
RUN	rm -v $ANACONDA_VER
# set environments and install prerequisites
ENV	PATH=/opt/anaconda3/bin:$PATH
#RUN	conda init bash && conda create -n py38 python=3.8
# install required packages
WORKDIR	/opt
RUN	git clone http://github.com/arnrau/OpenVibSpec
WORKDIR /opt/OpenVibSpec 
RUN	/bin/bash install_packages.sh
# clean up the system installation
RUN	apt-get -y autoremove && apt-get clean
# add the necessary user & group (security)
# default uid/gid 1000: ubuntu default user
# feel free to change this to your own username and uid/gid!
RUN	groupadd -g 1000 biox
RUN	useradd -m -u 1000 -g biox localuser
RUN	mkdir /opt/notebooks && chown localuser.biox /opt/notebooks
# set the user that later runs the software:
USER	localuser
RUN	conda init && echo "conda activate py38" >>/home/localuser/.bashrc
WORKDIR	/home/localuser
# command to run:
CMD	/bin/bash
