#!/bin/bash

paste $InpDir/GAMESS_INP_Part-B.txt $InpDir/GEOMETRY.txt > $InpDir/GAMESS_GEOMETRY.txt
sed -i '1s/^/\n/' $InpDir/GAMESS_GEOMETRY.txt
sed -i '1s/^/ C1 /' $InpDir/GAMESS_GEOMETRY.txt
sed -i '1s/^/\n/' $InpDir/GAMESS_GEOMETRY.txt

cp $InpDir/GAMESS_INP_Part-A.txt $InpDir/GAMESS_INP_Part-A.tmp.txt
cat $InpDir/GAMESS_GEOMETRY.txt >> $InpDir/GAMESS_INP_Part-A.tmp.txt
cat $InpDir/GAMESS_INP_Part-VEC.txt >> $InpDir/GAMESS_INP_Part-A.tmp.txt

mv $InpDir/GAMESS_INP_Part-A.tmp.txt $InpDir/$Project.G.tmp.inp
