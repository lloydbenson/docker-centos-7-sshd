FROM lloydbenson/docker-centos-7-systemd:latest
MAINTAINER Lloyd Benson <lloyd.benson@gmail.com>
RUN yum -y install openssh-server openssh-clients epel-release sudo && \
    rm -f /etc/ssh/ssh_host_ecdsa_key /etc/ssh/ssh_host_ed25519_key /etc/ssh/ssh_host_dsa_key && \
    ssh-keygen -q -N "" -t rsa -f /etc/ssh/ssh_host_rsa_key
RUN yum -y install pwgen

COPY sshd_config /etc/ssh/sshd_config
COPY install_sshd.sh /install_sshd.sh

EXPOSE 22
RUN systemctl enable sshd

## use as a base and then add these 
#RUN /install_sshd.sh
#CMD ["/usr/bin/init"]
