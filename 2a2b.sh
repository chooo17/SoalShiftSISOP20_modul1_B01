#!/bin/bash                                                                                                             
upperAlphabet=ABCDEFGHIJKLMNOPQRSTUVWXYZABCDEFGHIJKLMNOPQRSTUVWXYZ
lowAlphabet=abcdefghijklmnopqrstuvwxyzabcdefghijklmnopqrstuvwxyz
name=$1
enkrip=${name%%.*}
shift=$(ls -l $name | cut -d ' ' -f '8' | head -c 2)
enkname=$(echo $enkrip | tr "${upperAlphabet:${shift}:26}" "${upperAlphabet:0:26}" | tr "${lowAlphabet:${shift}:26}" >
mv $name $enkname.txt