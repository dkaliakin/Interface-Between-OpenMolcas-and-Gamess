#!/bin/sh

rm $InpDir/ROOTS_E.txt

grep "SSR state 0" $InpDir/$Project.G.tmp.out > $InpDir/S0E.txt
grep "SSR state 1" $InpDir/$Project.G.tmp.out > $InpDir/S1E.txt

sed -i -r 's/(\s+)?\S+//7' $InpDir/S0E.txt
sed -i -r 's/(\s+)?\S+//7' $InpDir/S1E.txt
sed -i -r 's/(\s+)?\S+//6' $InpDir/S0E.txt
sed -i -r 's/(\s+)?\S+//6' $InpDir/S1E.txt
sed -i -r 's/(\s+)?\S+//5' $InpDir/S0E.txt
sed -i -r 's/(\s+)?\S+//5' $InpDir/S1E.txt
sed -i -r 's/(\s+)?\S+//3' $InpDir/S0E.txt
sed -i -r 's/(\s+)?\S+//3' $InpDir/S1E.txt
sed -i -r 's/(\s+)?\S+//2' $InpDir/S0E.txt
sed -i -r 's/(\s+)?\S+//2' $InpDir/S1E.txt
sed -i -r 's/(\s+)?\S+//1' $InpDir/S0E.txt
sed -i -r 's/(\s+)?\S+//1' $InpDir/S1E.txt

cat $InpDir/S1E.txt >> $InpDir/S0E.txt
mv $InpDir/S0E.txt $InpDir/ROOTS_E.txt
rm $InpDir/S1E.txt
