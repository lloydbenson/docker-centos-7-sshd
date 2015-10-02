# docker-centos-7-sshd

Base SSHD image via base systemd image.

```sh
docker pull lloydbenson/docker-centos-7-sshd
```
Your custom base image should have:

```sh
RUN /install_sshd.sh
CMD ["/usr/sbin/init" ]
```
At the bottom.  By default this will generate a root password and you can see the password generated.  You can pass ENVIRONMENT variables of:

```sh
AUTHORIZED_KEYS
```
which puts this into /root/.ssh/authorized_keys

or if you prefer
```
ROOT_PASS
```
which will generate a custom password for root

Note: If you use AUTHORIZED_KEYS ROOT_PASS is ignored.

```sh
docker run -dt --priviledged=true --name=sshd lloydbenson/docker-centos-7-sshd
```

```sh
docker logs sshd
```
to get the default password if you didnt pass in a KEY
