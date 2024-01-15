# GCSORT

A docker image to build
- GCSORT (work in progress)

# Release
 - Checkout code with svn `svn checkout --config-option config:miscellany:use-commit-times=yes https://svn.code.sf.net/p/gnucobol/contrib/trunk/tools/GCSORT`
 - Use  svn log and search for tags with a new version in comment, I guess this means the commit create a new version for GCSORT
 - Revision r1023 -> GCSORT version  1.03.04
 - Use svn to checkout `cd GCSORT` and `svn up -r1023` 

# Build

- use `./devel.sh db` -> checkout GCSORT, build and run tests
- use `./devel.sh ds` -> open a terminal to docker, `cd /gnucobol/GCSORT` and run `./gcsort`

# Links

- GNU COBOL - Requirements <https://sourceforge.net/p/gnucobol/code/HEAD/tree/tags/gnucobol-3.2/HACKING>
- GCSORT <https://sourceforge.net/p/gnucobol/contrib/HEAD/tree/trunk/tools/GCSORT/README>
