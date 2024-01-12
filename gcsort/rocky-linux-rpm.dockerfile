FROM rockylinux:8.9
RUN dnf -y install dnf-plugins-core && \
     dnf -y install epel-release && \
     dnf -y config-manager --set-enabled powertools && \
     dnf -y update
RUN dnf install -y rpmdevtools rpmlint make git  tar subversion  autoconf automake libtool m4 gmp-devel libdb-devel help2man flex bison byacc gettext texinfo 
# RUN dnf install -y texlive
# RUN dnf install -y sudo
# RUN echo '%sudo ALL=(ALL) NOPASSWD:ALL' >> /etc/sudoers
# RUN echo 'ubuntu  ALL=(ALL) NOPASSWD:ALL' >> /etc/sudoers
WORKDIR /gnucobol
RUN svn checkout https://svn.code.sf.net/p/gnucobol/code/trunk gnucobol-code
RUN  ls -la && cd gnucobol-code && \
    ./autogen.sh && \
    ./configure && \
    make && \
    make install