FROM archlinux:latest

RUN pacman -Suy --noconfirm && pacman -S --noconfirm python python-pip

CMD sleep 1000000000d
