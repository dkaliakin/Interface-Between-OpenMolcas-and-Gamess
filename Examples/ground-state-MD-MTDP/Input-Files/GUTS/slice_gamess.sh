#!/bin/bash

rm $InpDir/GAMESS_INP_Part-A.txt
rm $InpDir/GAMESS_INP_Part-B*.txt
rm $InpDir/GAMESS_INP_Part-C.txt
rm $InpDir/GAMESS_INP_Part-VEC.txt

sed '/TINXYZ/q' $InpDir/$Project.G.inp > $InpDir/GAMESS_INP_Part-A.txt
REKST=`cat $InpDir/RLXROOT.txt`

sed '0,/TINXYZ/d' $InpDir/$Project.G.inp > $InpDir/GAMESS_INP_Part-B.txt
sed '0,/VEC/d' $InpDir/$Project.G.inp > $InpDir/GAMESS_INP_Part-VEC.txt
sed -i -re '1d' $InpDir/GAMESS_INP_Part-B.txt
sed -i '/END/q' $InpDir/GAMESS_INP_Part-B.txt

sed -i '1s/^/\n/' $InpDir/GAMESS_INP_Part-VEC.txt
sed -i '1s/^/$VEC /' $InpDir/GAMESS_INP_Part-VEC.txt

NATOMS_B=$((NATOMS+1))
NTOTAL=$((NTOTAL+1))

sed "${NATOMS_B},${NTOTAL}d" $InpDir/GAMESS_INP_Part-B.txt > $InpDir/GAMESS_INP_Part-B1.txt
sed "1,${NATOMS}d" $InpDir/GAMESS_INP_Part-B.txt > $InpDir/GAMESS_INP_Part-B2.txt

awk '{$1=$1;print}' $InpDir/GAMESS_INP_Part-B2.txt > $InpDir/GAMESS_INP_Part-B2.tmp.txt
mv $InpDir/GAMESS_INP_Part-B2.tmp.txt $InpDir/GAMESS_INP_Part-B2.txt

cp $InpDir/GAMESS_INP_Part-B1.txt $InpDir/GAMESS_INP_Part-C.txt 
sed -i -r 's/(\s+)?\S+//5' $InpDir/GAMESS_INP_Part-C.txt
sed -i -r 's/(\s+)?\S+//4' $InpDir/GAMESS_INP_Part-C.txt
sed -i -r 's/(\s+)?\S+//3' $InpDir/GAMESS_INP_Part-C.txt
sed -i -r 's/(\s+)?\S+//2' $InpDir/GAMESS_INP_Part-C.txt
sed -i -r 's/(\s+)?\S+//1' $InpDir/GAMESS_INP_Part-C.txt

sed -r 's/(\s+)?\S+//2' $InpDir/GAMESS_INP_Part-B1.txt > $InpDir/GEOMETRY.txt
sed -i -r 's/(\s+)?\S+//1' $InpDir/GEOMETRY.txt
sed -i -r 's/(\s+)?\S+//8' $InpDir/GEOMETRY.txt
sed -i -r 's/(\s+)?\S+//7' $InpDir/GEOMETRY.txt
sed -i -r 's/(\s+)?\S+//6' $InpDir/GEOMETRY.txt
sed -i -r 's/(\s+)?\S+//5' $InpDir/GEOMETRY.txt
sed -i -r 's/(\s+)?\S+//4' $InpDir/GEOMETRY.txt

sed -i -r 's/(\s+)?\S+//10' $InpDir/GAMESS_INP_Part-B1.txt
sed -i -r 's/(\s+)?\S+//9'  $InpDir/GAMESS_INP_Part-B1.txt
sed -i -r 's/(\s+)?\S+//8'  $InpDir/GAMESS_INP_Part-B1.txt
sed -i -r 's/(\s+)?\S+//7'  $InpDir/GAMESS_INP_Part-B1.txt
sed -i -r 's/(\s+)?\S+//6'  $InpDir/GAMESS_INP_Part-B1.txt
sed -i -r 's/(\s+)?\S+//5' $InpDir/GAMESS_INP_Part-B1.txt
sed -i -r 's/(\s+)?\S+//4' $InpDir/GAMESS_INP_Part-B1.txt
sed -i -r 's/(\s+)?\S+//3' $InpDir/GAMESS_INP_Part-B1.txt

NTOTAL=$((NTOTAL-1))

awk '{$1=$1;print}' $InpDir/GAMESS_INP_Part-B1.txt > $InpDir/GAMESS_INP_Part-B1.tmp.txt
awk '{$1=$1;print}' $InpDir/GAMESS_INP_Part-C.txt > $InpDir/GAMESS_INP_Part-C.tmp.txt
mv $InpDir/GAMESS_INP_Part-B1.tmp.txt $InpDir/GAMESS_INP_Part-B1.txt
mv $InpDir/GAMESS_INP_Part-C.tmp.txt $InpDir/GAMESS_INP_Part-C.txt
