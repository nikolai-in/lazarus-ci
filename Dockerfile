FROM fedora:rawhide

LABEL org.opencontainers.image.source="https://github.com/nikolai-in/lazarus-ci"
LABEL org.opencontainers.image.authors="nikolai.in@tuta.io"

ENV FPC_VERSION="3.2.2" \
    LAZARUS_VERSION="2.2.2"

RUN dnf upgrade -y && dnf install  --setopt=install_weak_deps=False --best -y rpm-build gcc binutils gtk2-devel gtk2 psmisc gdb

RUN cd /tmp && \
    curl -LZ --remote-name-all https://sourceforge.net/projects/lazarus/files/Lazarus%20Linux%20x86_64%20RPM/Lazarus%20${LAZARUS_VERSION}/{fpc-${FPC_VERSION}-1.x86_64.rpm,fpc-src-${FPC_VERSION}-1.x86_64.rpm,lazarus-${LAZARUS_VERSION}-0.x86_64.rpm} && \
    dnf localinstall --setopt=install_weak_deps=False --best -y *.rpm && \ 
    rm *.rpm

RUN dnf clean all