#!/bin/bash

rm $InpDir/GAMESS_INP_Part-A.txt
rm $InpDir/GAMESS_INP_Part-B.txt

NATOMS_B=$((NATOMS+1))

sed '/DATA/q' $InpDir/$Project.G.tmp.inp > $InpDir/GAMESS_INP_Part-A.txt
REKST=`cat $InpDir/RLXROOT.txt`
sed -i "s/XXX/$REKST/g" $InpDir/GAMESS_INP_Part-A.txt

sed '0,/VEC/d' $InpDir/$Project.G.inp > $InpDir/GAMESS_INP_Part-VEC.txt
sed -i '1s/^/\n/' $InpDir/GAMESS_INP_Part-VEC.txt
sed -i '1s/^/$VEC /' $InpDir/GAMESS_INP_Part-VEC.txt

sed '0,/DATA/d' $InpDir/$Project.G.tmp.inp > $InpDir/GAMESS_INP_Part-B.txt
sed -i -re '1,2d' $InpDir/GAMESS_INP_Part-B.txt
sed -i "${NATOMS_B},\$d" $InpDir/GAMESS_INP_Part-B.txt

sed -r 's/(\s+)?\S+//2' $InpDir/GAMESS_INP_Part-B.txt > $InpDir/GEOMETRY.txt
sed -i -r 's/(\s+)?\S+//1' $InpDir/GEOMETRY.txt

sed -i -r 's/(\s+)?\S+//5' $InpDir/GAMESS_INP_Part-B.txt
sed -i -r 's/(\s+)?\S+//4' $InpDir/GAMESS_INP_Part-B.txt
sed -i -r 's/(\s+)?\S+//3' $InpDir/GAMESS_INP_Part-B.txt

awk '{$1=$1;print}' $InpDir/GAMESS_INP_Part-B.txt > $InpDir/GAMESS_INP_Part-B.tmp.txt
mv $InpDir/GAMESS_INP_Part-B.tmp.txt $InpDir/GAMESS_INP_Part-B.txt
