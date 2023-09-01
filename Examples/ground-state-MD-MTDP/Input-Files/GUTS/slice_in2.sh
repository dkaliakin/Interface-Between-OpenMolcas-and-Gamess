#!/bin/bash

cp  $InpDir/$Project.in2  $InpDir/NROOTS.txt
sed -i -re '3d' $InpDir/NROOTS.txt
sed -i -re '2d' $InpDir/NROOTS.txt
sed -i -r 's/(\s+)?\S+//1' $InpDir/NROOTS.txt

cp  $InpDir/$Project.in2  $InpDir/RLXROOT.txt
sed -i -re '3d' $InpDir/RLXROOT.txt
sed -i -re '1d' $InpDir/RLXROOT.txt
sed -i -r 's/(\s+)?\S+//1' $InpDir/RLXROOT.txt

cp  $InpDir/$Project.in2  $InpDir/NCI.txt
sed -i -re '2d' $InpDir/NCI.txt
sed -i -re '1d' $InpDir/NCI.txt
sed -i -r 's/(\s+)?\S+//1' $InpDir/NCI.txt
