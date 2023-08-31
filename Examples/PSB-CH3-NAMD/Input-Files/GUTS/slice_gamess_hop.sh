#!/bin/bash

sed '/DATA/q' $InpDir/$Project.G.inp > $InpDir/GAMESS_INP_Part-A.txt
REKST=`cat $InpDir/RLXROOT.txt`
sed -i "s/XXX/$REKST/g" $InpDir/GAMESS_INP_Part-A.txt
