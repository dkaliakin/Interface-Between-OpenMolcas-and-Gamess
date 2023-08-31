#!/bin/bash

cp /users/PCON0010/danilk/restart/$Project.G.tmp.dat $InpDir/$Project.G.tmp.dat

sed '0,/VEC/d' $InpDir/$Project.G.tmp.dat > $InpDir/GAMESS_INP_Part-VEC.txt
sed -i '/POPULATION ANALYSIS/,$d' $InpDir/GAMESS_INP_Part-VEC.txt
sed -i '1s/^/\n/' $InpDir/GAMESS_INP_Part-VEC.txt
sed -i '1s/^/ $VEC /' $InpDir/GAMESS_INP_Part-VEC.txt
