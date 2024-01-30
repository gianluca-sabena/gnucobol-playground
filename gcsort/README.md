# GCSORT

A docker image to build
- GCSORT (work in progress)

# Release
 - Checkout code with svn `svn checkout --config-option config:miscellany:use-commit-times=yes https://svn.code.sf.net/p/gnucobol/contrib/trunk/tools/GCSORT`
 - Use  svn log and search for tags with a new version in comment, I guess this means the commit create a new version for GCSORT
 - GCSORT Revision SVN r1066 compiled with GNUCOBOL 3.2 downloaded from <https://ftpmirror.gnu.org/gnucobol/gnucobol-3.2.tar.xz> and compiled in container

# Build
- Open linux terminal (On Windows you may use wsl2 `wsl --install Ubuntu` and `wsl -d Ubuntu`)
- Git clone this repo `git clone https://github.com/gianluca-sabena/gnucobol-playground.git`
- `cd gcsort`
- use `./devel.sh cb` -> checkout GNUCOBOL and GCSORT, build and run tests
- use `./devel.sh cs` -> open a terminal to a container built before, `cd /gnucobol/GCSORT` and run `./gcsort`

# Links
- GNU COBOL - Requirements <https://sourceforge.net/p/gnucobol/code/HEAD/tree/tags/gnucobol-3.2/HACKING>
- GCSORT <https://sourceforge.net/p/gnucobol/contrib/HEAD/tree/trunk/tools/GCSORT/README>
- Discussion on test <https://sourceforge.net/p/gnucobol/discussion/contrib/thread/c244c2e156/>
