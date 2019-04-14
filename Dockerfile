FROM ubuntu:bionic
LABEL maintainer="david@dvshkn.com"

ARG uid=1000
ARG gid=1000

SHELL ["/bin/bash", "-c"]

# updates and packages
RUN apt-get update
RUN apt-get upgrade -y
RUN apt-get install -y sudo vim

# setup regular user
RUN groupadd --gid $gid user
RUN groupadd wheel
RUN useradd -m -s /bin/bash --uid $uid --gid $gid -G wheel user
RUN echo 'user:docker' | chpasswd

# install anaconda
COPY --chown=user:user files/anaconda_installer.sh /home/user/anaconda_installer.sh
RUN su user -lc $'bash ~/anaconda_installer.sh -b -p $HOME/anaconda'
RUN su user -lc $'echo \'export PATH=$HOME/anaconda/bin:$PATH\' >> $HOME/.bashrc'

# data dir for mounting
RUN su user -lc $'mkdir $HOME/data'

# jupyter notebook config
RUN su user -lc $'mkdir $HOME/.jupyter'
COPY --chown=user:user files/jupyter_notebook_config.py /home/user/.jupyter/jupyter_notebook_config.py

# cleanup
RUN su user -lc $'rm $HOME/anaconda_installer.sh'
