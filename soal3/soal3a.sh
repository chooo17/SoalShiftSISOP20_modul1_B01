#!/bin/bash

for i in {1..28}
do
    wget -o /home/sin/sisop/Modul1/SoalShift/cat/"wget1.log" "https://loremflickr.com/320/240/cat" -O /home/sin/sisop/Modul1/SoalShift/cat/pdkt_kusuma_"$i".jpeg
    awk  '{print $0}' /home/sin/sisop/Modul1/SoalShift/cat/wget1.log >> /home/sin/sisop/Modul1/SoalShift/cat/wget.log
    grep "Location"  /home/sin/sisop/Modul1/SoalShift/cat/wget1.log >> /home/sin/sisop/Modul1/SoalShift/cat/Location.log
done
