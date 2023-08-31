#!/bin/sh

rm $InpDir/ROOTS_C.txt

grep "SSR state 0" $InpDir/$Project.G.tmp.out > $InpDir/S0C.txt
grep "SSR state 1" $InpDir/$Project.G.tmp.out > $InpDir/S1C.txt

sed -i -r 's/(\s+)?\S+//4' $InpDir/S0C.txt
sed -i -r 's/(\s+)?\S+//4' $InpDir/S1C.txt
sed -i -r 's/(\s+)?\S+//3' $InpDir/S0C.txt
sed -i -r 's/(\s+)?\S+//3' $InpDir/S1C.txt
sed -i -r 's/(\s+)?\S+//2' $InpDir/S0C.txt
sed -i -r 's/(\s+)?\S+//2' $InpDir/S1C.txt
sed -i -r 's/(\s+)?\S+//1' $InpDir/S0C.txt
sed -i -r 's/(\s+)?\S+//1' $InpDir/S1C.txt

cat $InpDir/S1C.txt >> $InpDir/S0C.txt
mv $InpDir/S0C.txt $InpDir/ROOTS_C.txt
rm $InpDir/S1C.txt
