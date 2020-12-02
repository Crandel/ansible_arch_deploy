FROM archlinux:latest

RUN ln -sf /usr/share/zoneinfo/Europe/Berlin /etc/localtime && \
    mkdir -p /var/run/sshd && \
    mkdir -p /root/.ssh

COPY configs/docker_test.pub /root/.ssh/authorized_keys
COPY configs/.bashrc /root/
COPY configs/sshd_config     /etc/ssh/sshd_config
RUN chmod 400                /root/.ssh/authorized_keys

RUN pacman -Suy --noconfirm && \
    pacman -S --noconfirm python \
                          python-pip \
                          python-pyopenssl \
                          openssh

RUN ssh-keygen -A
EXPOSE 22

CMD ["/usr/sbin/sshd", "-D"]
