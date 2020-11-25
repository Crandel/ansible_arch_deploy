FROM archlinux:latest

RUN pacman -Suy --noconfirm && pacman -S --noconfirm python python-pip

CMD ["while" "true" "do" "done"]
