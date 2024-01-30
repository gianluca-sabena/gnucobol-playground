FROM rockylinux:8.9
RUN dnf -y install dnf-plugins-core && \
     dnf -y install epel-release && \
     dnf -y config-manager --set-enabled powertools && \
     dnf -y update
WORKDIR /gnucobol
#  ===================================
#  Build gnu cobol from svn
#  ===================================
# RUN dnf install -y rpmdevtools rpmlint make git  tar subversion  autoconf automake libtool m4 gmp-devel libdb-devel help2man flex bison byacc gettext texinfo 
# RUN svn checkout https://svn.code.sf.net/p/gnucobol/code/trunk gnucobol-code
# RUN  ls -la && cd gnucobol-code && \
#     ./autogen.sh && \
#     ./configure && \
#     make && \
#     make install
#  ===================================
#  Build GCSORT from svn
#  ===================================
RUN dnf -y install dos2unix gnucobol make subversion 
RUN cd /gnucobol && \
    svn checkout --config-option config:miscellany:use-commit-times=yes https://svn.code.sf.net/p/gnucobol/contrib/trunk/tools/GCSORT && \
    cd /gnucobol/GCSORT && svn up -r1069
RUN cd /gnucobol/GCSORT && \
    make && \
    cd /gnucobol/GCSORT/tests/script && \
    dos2unix compile.sh  && \
    chmod u+x compile.sh && \
    ./compile.sh || true && \
    cd /gnucobol/GCSORT/tests/bin && \
    ./gctestset && \
    ./gctestrun > test-run.log
