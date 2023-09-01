#!/bin/sh

grep "FINAL R-BHHLYP ENERGY IS" $InpDir/$Project.G.tmp.out > $InpDir/POT_ENERGY.txt

sed -i -r 's/(\s+)?\S+//8' $InpDir/POT_ENERGY.txt
sed -i -r 's/(\s+)?\S+//7' $InpDir/POT_ENERGY.txt
sed -i -r 's/(\s+)?\S+//6' $InpDir/POT_ENERGY.txt

sed -i -r 's/(\s+)?\S+//4' $InpDir/POT_ENERGY.txt
sed -i -r 's/(\s+)?\S+//3' $InpDir/POT_ENERGY.txt
sed -i -r 's/(\s+)?\S+//2' $InpDir/POT_ENERGY.txt
sed -i -r 's/(\s+)?\S+//1' $InpDir/POT_ENERGY.txt
