FROM archlinux:latest

ENV container=docker

RUN ln -sf /usr/share/zoneinfo/Europe/Berlin /etc/localtime && \
    mkdir -p /var/run/sshd && \
    mkdir -p /root/.ssh

COPY configs/docker_test.pub  /root/.ssh/authorized_keys
COPY configs/.bashrc          /root/
COPY configs/sshd_config      /etc/ssh/sshd_config
COPY configs/container.target /etc/systemd/system/container.target
RUN  chmod 400                 /root/.ssh/authorized_keys && \
    ln -sf /etc/systemd/system/container.target /etc/systemd/system/default.target


RUN pacman -Suy --noconfirm && \
    pacman -S --noconfirm python \
                          python-pip \
                          python-pyopenssl \
                          openssh \
                          systemd

RUN ssh-keygen -A

RUN systemctl enable sshd.service

EXPOSE 22

ENTRYPOINT ["/sbin/init"]

CMD ["--log-level=info"]

STOPSIGNAL SIGRTMIN+3
