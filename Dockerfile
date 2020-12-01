FROM archlinux:latest

RUN pacman -Suy --noconfirm && \
    pacman -S --noconfirm python \
                          python-pip \
                          python-pyopenssl \
                          openssh

COPY configs/sshd_config /etc/ssh/sshd_config
CMD sleep 1000000000d
