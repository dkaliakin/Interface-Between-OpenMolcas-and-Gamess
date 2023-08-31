#!/bin/bash

paste $InpDir/GEOMETRY.txt $InpDir/GAMESS_INP_Part-C.txt > $InpDir/GAMESS_INP_Part-C.tmp.txt 
paste $InpDir/GAMESS_INP_Part-B1.txt $InpDir/GAMESS_INP_Part-C.tmp.txt > $InpDir/GAMESS_GEOMETRY.txt
sed -i '1s/^/\n/' $InpDir/GAMESS_GEOMETRY.txt
sed -i "1s/^/$NTOTAL /" $InpDir/GAMESS_GEOMETRY.txt

rm $InpDir/GAMESS_INP_Part-C.tmp.txt

awk '{$1=$1;print}' $InpDir/GAMESS_GEOMETRY.txt > $InpDir/GAMESS_GEOMETRY.tmp.txt
mv $InpDir/GAMESS_GEOMETRY.tmp.txt $InpDir/GAMESS_GEOMETRY.txt

cp $InpDir/GAMESS_INP_Part-A.txt $InpDir/GAMESS_INP_Part-A.tmp.txt
cat $InpDir/GAMESS_GEOMETRY.txt >> $InpDir/GAMESS_INP_Part-A.tmp.txt
cat $InpDir/GAMESS_INP_Part-B2.txt >> $InpDir/GAMESS_INP_Part-A.tmp.txt

cat $InpDir/GAMESS_INP_Part-VEC.txt >> $InpDir/GAMESS_INP_Part-A.tmp.txt
mv $InpDir/GAMESS_INP_Part-A.tmp.txt $InpDir/$Project.G.tmp.inp
