#!/bin/bash

readarray -t loc < /home/sin/sisop/Modul1/SoalShift/cat/Location.log
for p in {0..27}
do
	count=$(ls -1 /home/sin/sisop/Modul1/SoalShift/cat/duplicate | wc -l)
	count1=$(ls -1 /home/sin/sisop/Modul1/SoalShift/cat/kenangan | wc -l)
	count=$(($count+1))
	count1=$(($count1+1))
	flag=$((0))
	for ((j=0; j<$p; j=j+1))
		do
		if [ $p -eq 0 ]
			then mv /home/sin/sisop/Modul1/SoalShift/cat/pdkt_kusuma_1.jpeg /home/sin/sisop/Modul1/SoalShift/cat/kenangan/kenangan_"$count1".jpeg

		elif [ "${loc[$p]}" == "${loc[$j]}" ]
			then
			flag=$((1))
			break
		elif [ $j -eq 27 ]
			then
			flag=$((0))
		fi
	done

	if [ $flag -eq 0 ]
		then
			mv /home/sin/sisop/Modul1/SoalShift/cat/pdkt_kusuma_"$(($p+1))".jpeg /home/sin/sisop/Modul1/SoalShift/cat/kenangan/kenangan_"$count1".jpeg
	else
		mv /home/sin/sisop/Modul1/SoalShift/cat/pdkt_kusuma_"$(($p+1))".jpeg /home/sin/sisop/Modul1/SoalShift/cat/duplicate/duplicate_"$count".jpeg
	fi
done

awk  '{print $0}' /home/sin/sisop/Modul1/SoalShift/cat/wget.log >> /home/sin/sisop/Modul1/SoalShift/cat/wget.log.bak |
awk  '{print $0}' /home/sin/sisop/Modul1/SoalShift/cat/Location.log >> /home/sin/sisop/Modul1/SoalShift/cat/Location.log.bak
