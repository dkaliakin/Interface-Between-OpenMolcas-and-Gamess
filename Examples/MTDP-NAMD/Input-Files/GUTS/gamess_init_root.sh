#!/bin/bash

REKST=`cat $InpDir/RLXROOT.txt`
sed -i "s/XXX/$REKST/g" $InpDir/$Project.G.tmp.inp
