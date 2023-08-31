#!/bin/bash

rm $InpDir/GRADIENT.*txt

grep -A $NATOMS "UNITS ARE HARTREE" $InpDir/$Project.G.tmp.out > $InpDir/GRADIENT.txt

sed -i -re '1d' $InpDir/GRADIENT.txt
sed -i -r 's/(\s+)?\S+//2' $InpDir/GRADIENT.txt
sed -i -r 's/(\s+)?\S+//1' $InpDir/GRADIENT.txt

