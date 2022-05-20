FROM fedora:rawhide

LABEL Name=lazarus-ci Version=0.0.1
LABEL maintainer=nikolai.in@tuta.io

ENV FPC_VERSION="3.2.2" \
    LAZARUS_VERSION="2.2.2"

RUN dnf install  --setopt=install_weak_deps=False --best -y rpm-build

RUN cd /tmp && \
    curl https://sourceforge.net/projects/lazarus/files/Lazarus%20Linux%20x86_64%20RPM/Lazarus%20${LAZARUS_VERSION}/fpc-${FPC_VERSION}-1.x86_64.rpm -O \
    https://sourceforge.net/projects/lazarus/files/Lazarus%20Linux%20x86_64%20RPM/Lazarus%20${LAZARUS_VERSION}/fpc-src-${FPC_VERSION}-1.x86_64.rpm -O \
    https://sourceforge.net/projects/lazarus/files/Lazarus%20Linux%20x86_64%20RPM/Lazarus%20${LAZARUS_VERSION}/lazarus-${LAZARUS_VERSION}-0.x86_64.rpm -O && \
    dnf localinstall --setopt=install_weak_deps=False --best -y *.rpm && \ 
    rm *.rpm

RUN dnf upgrade -y && dnf clean all