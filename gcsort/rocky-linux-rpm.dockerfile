FROM rockylinux:8.9
RUN dnf -y install dnf-plugins-core && \
     dnf -y install epel-release && \
     dnf -y config-manager --set-enabled powertools && \
     dnf -y update
WORKDIR /gnucobol
#  ===================================
#  Build gnu cobol from svn
#  ===================================
RUN dnf install -y dos2unix make git  tar xz subversion  autoconf automake libtool m4 gmp-devel libdb-devel help2man flex bison byacc gettext texinfo libxml2-devel cjson-devel
# RUN svn checkout https://svn.code.sf.net/p/gnucobol/code/trunk gnucobol-code
RUN curl -L https://ftpmirror.gnu.org/gnucobol/gnucobol-3.2.tar.xz --output gnucobol-3.2.tar.xz && \
tar -xvf gnucobol-3.2.tar.xz 
WORKDIR /gnucobol/gnucobol-3.2
RUN ./autogen.sh && \
    ./configure && \
    make && \
    make install
ENV LD_LIBRARY_PATH="${LD_LIBRARY_PATH}:/usr/local/lib"
#  ===================================
#  Build GCSORT from svn
#  ===================================
# RUN dnf -y install  gnucobol make subversion 
RUN cd /gnucobol && \
    svn checkout --config-option config:miscellany:use-commit-times=yes https://svn.code.sf.net/p/gnucobol/contrib/trunk/tools/GCSORT && \
    cd /gnucobol/GCSORT && \
    svn up -r1069
RUN cd /gnucobol/GCSORT && \
    make && \
    ln -s /gnucobol/GCSORT/gcsort /usr/local/bin/gcsort 
# RUN cd /gnucobol/GCSORT/tests/script && \
#     dos2unix compile.sh  && \
#     chmod u+x compile.sh && \
#     ./compile.sh || true && \
#     cd /gnucobol/GCSORT/tests/bin && \
#     ./gctestset && \
#     ./gctestrun > test-run.log
RUN mkdir -p /host/data
WORKDIR /host/data