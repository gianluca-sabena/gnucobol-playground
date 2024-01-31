#!/bin/sh
## -- ===================================== --
## --              TEST CASE
## -- ===================================== --
echo "** -- Inner Join OK" > tmp/tmp01.prm
echo "JOINKEYS FILES=F1,FIELDS=(1,6,A) JOINKEYS FILES=F2,FIELDS=(1,6,A)  REFORMAT FIELDS=(?,F1:1,26,F2:1,23) USE files/inpjoin01.txt ORG LS RECORD F,250 USE files/inpjoin02.txt ORG LS RECORD F,250  GIVE tmp/inpoutjoin.01.srt ORG LS  RECORD F,250 " > tmp/tmp01.prm
gcsort TAKE tmp/tmp01.prm
echo "** -- Unpaired F1 -- Unpaired records from F1 as well as paired records. This is known as a left outer join." > tmp/tmp02.prm
echo "JOINKEYS FILES=F1,FIELDS=(1,6,A) JOINKEYS FILES=F2,FIELDS=(1,6,A)  REFORMAT FIELDS=(?,F1:1,26,F2:1,23) USE files/inpjoin01.txt ORG LS RECORD F,250 USE files/inpjoin02.txt ORG LS RECORD F,250  GIVE tmp/inpoutjoin.02.srt ORG LS  RECORD F,250 " > tmp/tmp02.prm
gcsort TAKE tmp/tmp02.prm
echo "** -- Unpaired F1 -- Unpaired records from F1 as well as paired records. This is known as a left outer join." > tmp/tmp03.prm
echo "JOINKEYS FILES=F1,FIELDS=(1,6,A) JOINKEYS FILES=F2,FIELDS=(1,6,A)  REFORMAT FIELDS=(?,F1:1,26,F2:1,23) JOIN UNPAIRED,F1      USE  files/inpjoin01.txt ORG LS RECORD F,250  USE  files/inpjoin02.txt ORG LS RECORD F,250  GIVE tmp/inpoutjoin.03.srt ORG LS  RECORD F,250 " > tmp/tmp03.prm
gcsort TAKE tmp/tmp03.prm
echo "** -- Unpaired F2 -- Unpaired records from F2 as well as paired records. This is known as a right outer join." > tmp/tmp04.prm
echo "JOINKEYS FILES=F1,FIELDS=(1,6,A) JOINKEYS FILES=F2,FIELDS=(1,6,A)  REFORMAT FIELDS=(?,F1:1,26,F2:1,23) JOIN UNPAIRED,F2      USE  files/inpjoin01.txt ORG LS RECORD F,250  USE  files/inpjoin02.txt ORG LS RECORD F,250  GIVE tmp/inpoutjoin.04.srt ORG LS  RECORD F,250 " > tmp/tmp04.prm
gcsort TAKE tmp/tmp04.prm
echo "** -- Unpaired F1,F2 -- Unpaired records from F1 and F2 as well as paired records. This is known as a full outer join." > tmp/tmp05.prm
echo "JOINKEYS FILES=F1,FIELDS=(1,6,A) JOINKEYS FILES=F2,FIELDS=(1,6,A)  REFORMAT FIELDS=(?,F1:1,26,F2:1,23) JOIN UNPAIRED,F1,F2 USE  files/inpjoin01.txt ORG LS RECORD F,250  USE  files/inpjoin02.txt ORG LS RECORD F,250  GIVE tmp/inpoutjoin.05.srt ORG LS  RECORD F,250 " > tmp/tmp05.prm
gcsort TAKE tmp/tmp05.prm
echo "** -- Unpaired  -- Unpaired records from F1 and F2 as well as paired records. This is known as a full outer join." > tmp/tmp06.prm
echo "JOINKEYS FILES=F1,FIELDS=(1,6,A) JOINKEYS FILES=F2,FIELDS=(1,6,A)  REFORMAT FIELDS=(?,F1:1,26,F2:1,23) JOIN UNPAIRED  USE  files/inpjoin01.txt ORG LS RECORD F,250  USE  files/inpjoin02.txt ORG LS RECORD F,250  GIVE tmp/inpoutjoin.06.srt ORG LS  RECORD F,250 " > tmp/tmp06.prm
gcsort TAKE tmp/tmp06.prm
##  
echo "** -- Unpaired F1,ONLY -- Unpaired records from F1." > tmp/tmp07.prm
echo "JOINKEYS FILES=F1,FIELDS=(1,6,A) JOINKEYS FILES=F2,FIELDS=(1,6,A)  REFORMAT FIELDS=(F1:1,26) JOIN UNPAIRED,F1,ONLY USE  files/inpjoin01.txt ORG LS RECORD F,250  USE  files/inpjoin02.txt ORG LS RECORD F,250  GIVE tmp/inpoutjoin.07.srt ORG LS  RECORD F,250 " > tmp/tmp07.prm
gcsort TAKE tmp/tmp07.prm
echo "** -- Unpaired F2,ONLY -- Unpaired records from F2." > tmp/tmp08.prm
echo "JOINKEYS FILES=F1,FIELDS=(1,6,A) JOINKEYS FILES=F2,FIELDS=(1,6,A)  REFORMAT FIELDS=(F2:1,23) JOIN UNPAIRED,F2,ONLY USE  files/inpjoin01.txt ORG LS RECORD F,250  USE  files/inpjoin02.txt ORG LS RECORD F,250  GIVE tmp/inpoutjoin.08.srt ORG LS  RECORD F,250 " > tmp/tmp08.prm
gcsort TAKE tmp/tmp08.prm
echo "** -- Unpaired F1,F2,ONLY -- Unpaired records from F1 and F2." > tmp/tmp09.prm
echo "JOINKEYS FILES=F1,FIELDS=(1,6,A) JOINKEYS FILES=F2,FIELDS=(1,6,A)  REFORMAT FIELDS=(?,F1:1,26,F2:1,23) JOIN UNPAIRED,F1,F2,ONLY USE  files/inpjoin01.txt ORG LS RECORD F,250  USE  files/inpjoin02.txt ORG LS RECORD F,250  GIVE tmp/inpoutjoin.09.srt ORG LS  RECORD F,250 "  > tmp/tmp09.prm
gcsort TAKE tmp/tmp09.prm
echo "** -- Unpaired ONLY -- Unpaired records from F1 and F2." > tmp/tmp10.prm
echo "JOINKEYS FILES=F1,FIELDS=(1,6,A) JOINKEYS FILES=F2,FIELDS=(1,6,A)  REFORMAT FIELDS=(?,F1:1,26,F2:1,23) JOIN UNPAIRED,ONLY USE  files/inpjoin01.txt ORG LS RECORD F,250  USE  files/inpjoin02.txt ORG LS RECORD F,250  GIVE tmp/inpoutjoin.10.srt ORG LS  RECORD F,250 "  > tmp/tmp10.prm
gcsort TAKE tmp/tmp10.prm

