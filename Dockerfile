FROM debian:12

ENV DEBIAN_FRONTEND=noninteractive

RUN dpkg --add-architecture i386 && \
    apt-get update && \
    apt-get install -y --no-install-recommends \
        acpica-tools autoconf autogen automake binutils bison bzip2 dos2unix flex g++ gcc \
        gcc-multilib gettext gnu-efi grub-common libc6:i386 libc6-dev libc6-dev-i386 \
        libbrlapi-dev libdevmapper-dev libfreetype6-dev libfuse-dev libmpfr-dev libmpfr6:i386 \
        libpciaccess-dev libsdl2-dev libtool libusb-1.0-0-dev libvte-2.91-dev libxpm-dev lz4 \
        nasm net-tools network-manager open-iscsi pesign qemu-kvm qemu-system-x86 qemu-utils \
        rsync samba shim-signed squashfs-tools virtinst libvirt-daemon-system libvirt-clients \
        vim wget xorriso xz-utils zip zlib1g-dev zlib1g:i386 fonts-dejavu-core fonts-freefont-ttf && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

WORKDIR /ventoy/INSTALL
CMD ls -la && sh docker_ci_build.sh
