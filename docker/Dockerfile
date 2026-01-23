# docker/Dockerfile
FROM archlinux:latest

# Prevent pacman from prompting
ENV PACMAN_NOCONFIRM=1

# Update base system and install deps
RUN pacman -Syu --noconfirm --needed \
    base-devel \
    git        \
    sudo       \
    fzf        \
    bash       \
    && pacman -Scc --noconfirm

# Create non-root user (yay refuses to run as root)
RUN useradd -m -G wheel -s /bin/bash dev \
    && echo '%wheel ALL=(ALL) NOPASSWD: ALL' >> /etc/sudoers

USER dev
WORKDIR /home/dev

# Install yay (AUR helper)
RUN git clone https://aur.archlinux.org/yay.git \
    && cd yay \
    && makepkg -si --noconfirm \
    && cd .. \
    && rm -rf yay

# Add local bin directory to PATH
ENV PATH="/workspace/bin:${PATH}"

# Workspace where repo will be mounted
WORKDIR /workspace

# Optional entrypoint (see below)
COPY --chmod=755 docker/entrypoint.sh /entrypoint.sh
ENTRYPOINT ["/entrypoint.sh"]

CMD ["bash"]
