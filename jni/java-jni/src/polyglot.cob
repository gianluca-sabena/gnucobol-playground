      *> ***************************************************************
      *>****J* SWIG/polyglot
      *> AUTHOR
      *>   Brian Tiffin
      *> DATE
      *>   20150924
      *>   Modified: 2015-10-02/20:11-0400
      *> LICENSE
      *>   Copyright 2015 Brian Tiffin
      *>   GNU General Public License, GPL, 3.0 (or greater)
      *> PURPOSE
      *>   polyglot programming with SWIG.
      *> TECTONICS
      *>   requires polyglot-swig.i and the Makefile
      *>   make [java | perl | python | tcl]
      *> ***************************************************************
       identification division.
       program-id. polyglot.
       author. Brian Tiffin.

       environment division.
       configuration section.
       repository.
           function all intrinsic.

       data division.
       working-storage section.
       01 datetime             pic XXXX/XX/XXBXX/XX/XX.

      *> ***************************************************************
       procedure division.

       move function current-date to datetime
       inspect datetime replacing all "/" by ":" after initial space

       display "Hello from GnuCOBOL" end-display
       display "It is now " datetime end-display

       move 42 to return-code
       goback.
      *>****
