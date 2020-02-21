#!/bin/bash

echo "--------------------------------------------------------------------------------------------"
printf "Region dengan Profit terkecil adalah : "
awk -F '	' ' NR > 1 { a[$13]+=$21 } END { for ( b in a ) { print a[b], "->", b }}' Sample-Superstore.tsv | sort -rn > 1A.txt
one=`awk -F '->' '{print $2}' 1A.txt | sort -g | head -1`
echo $one
echo "--------------------------------------------------------------------------------------------"
printf " \n"

echo "--------------------------------------------------------------------------------------------"
awk -F '	' ' NR > 1 { if($13 == "Central") x[$11]+=$21 } END { for ( y in x ) { print x[y], "->", y }}' Sample-Superstore.tsv | sort -rn > 1B.txt
two=`awk -F '->' '{print $1, $2}' 1B.txt | sort -g | head -2 > 1BB.txt`
three=`awk -F ' ' '{print $2}' 1BB.txt`
printf "Dua State dengan Profit terkecil berdasarkan hasil poin A adalah : "
echo $three
echo "--------------------------------------------------------------------------------------------"
printf "\n"

echo "--------------------------------------------------------------------------------------------"
awk -F '	' ' NR > 1 { if($11 == "Illinois" || $11 == "Texas") c[$17]+=$21 } END { for ( d in c ) { print c[d], "->", d }}' Sample-Superstore.tsv | sort -rn > 1C.txt
four=`awk -F '->' '{print $1, $2}' 1C.txt | sort -g | head -10 > 1CC.txt`
printf "Sepuluh Produk dengan Profit terkecil berdasarkan hasil poin A ada di 1CC.txt\n"
echo "--------------------------------------------------------------------------------------------"
