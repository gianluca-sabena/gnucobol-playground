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
#RUN svn checkout https://svn.code.sf.net/p/gnucobol/code/trunk gnucobol-code
# RUN  ls -la && cd gnucobol-code && \
#     ./autogen.sh && \
#     ./configure && \
#     make && \
#     make install
RUN dnf -y install gnucobol
RUN cd /gnucobol && \
    svn checkout --config-option config:miscellany:use-commit-times=yes https://svn.code.sf.net/p/gnucobol/contrib/trunk/tools/GCSORT && \
    cd /gnucobol/GCSORT && svn up -r1023 && \
    make
RUN dnf -y install dos2unix && \
    cd /gnucobol/GCSORT/tests/script && \
     dos2unix compile.sh  && \
     chmod u+x compile.sh && \
     ./compile.sh || true && \
     cd /gnucobol/GCSORT/tests/bin && \
     ./gctestset && \
     ./gctestrun > test-run.log

 #  ./configure --with-xml2 --with-file-format=gc didn't solve... 