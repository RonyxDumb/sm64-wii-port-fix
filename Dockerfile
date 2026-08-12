FROM devkitpro/devkitppc:20260503

RUN apt-get update && \
    apt-get install -y \
    binutils-mips-linux-gnu \
    bsdmainutils \
    build-essential \
    libaudiofile-dev \
    pkg-config \
    python3 \
    wget \
    zlib1g-dev && \
    rm -rf /var/lib/apt/lists/*

RUN dkp-pacman -S --noconfirm gamecube-tools wii-dev

WORKDIR /sm64

ENV DEVKITPRO=/opt/devkitpro
ENV DEVKITPPC=/opt/devkitpro/devkitPPC
ENV PATH="/opt/devkitpro/devkitPPC/bin:/opt/devkitpro/tools/bin:/sm64/tools:${PATH}"

CMD ["make", "VERSION=us", "-j4"]