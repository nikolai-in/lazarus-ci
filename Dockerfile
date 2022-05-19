FROM fedora:rawhide

LABEL Name=lazarus-ci Version=0.0.1
LABEL maintainer=nikolai.in@tuta.io

RUN dnf install -y rpm-build

RUN cd /tmp && \
    curl ftp://freepascal.dfmk.hu/pub/lazarus/releases/Lazarus%20Linux%20x86_64%20RPM/Lazarus%202.2.2/{fpc-3.2.2-1.x86_64.rpm,fpc-src-3.2.2-1.x86_64.rpm,lazarus-2.2.2-0.x86_64.rpm} -O && \
    dnf localinstall -y *.rpm && \ 
    rm *.rpm

RUN dnf upgrade -y