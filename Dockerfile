FROM fedora:rawhide

LABEL Name=lazarus-ci Version=0.0.1
LABEL maintainer=nikolai.in@tuta.io

ENV FPC_VERSION="3.2.2" \
    LAZARUS_VERSION="2.2.2"

RUN dnf install  --setopt=install_weak_deps=False --best -y rpm-build glibc-devel gtk2-devel libX11.so.6 libatk-1.0.so.0 libcairo.so.2 libgdk-x11-2.0.so.0 libgdk_pixbuf-2.0.so.0 libgtk-x11-2.0.so.0 libpango-1.0.so.0 libpango-1.0.so.0

RUN cd /tmp && \
    curl ftp://freepascal.dfmk.hu/pub/lazarus/releases/Lazarus%20Linux%20x86_64%20RPM/Lazarus%20${LAZARUS_VERSION}/fpc-${FPC_VERSION}-1.x86_64.rpm -O \
    ftp://freepascal.dfmk.hu/pub/lazarus/releases/Lazarus%20Linux%20x86_64%20RPM/Lazarus%20${LAZARUS_VERSION}/fpc-src-${FPC_VERSION}-1.x86_64.rpm -O \
    ftp://freepascal.dfmk.hu/pub/lazarus/releases/Lazarus%20Linux%20x86_64%20RPM/Lazarus%20${LAZARUS_VERSION}/lazarus-${LAZARUS_VERSION}-0.x86_64.rpm -O && \
    rpm -i *.rpm && \ 
    rm *.rpm

RUN dnf upgrade -y