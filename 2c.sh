#!/bin/bash
name=$1
enkrip=${name%%.*}
shift=$(ls -l $name | cut -d ' ' -f '8' | head -c 2)
upperAlphabet=ABCDEFGHIJKLMNOPQRSTUVWXYZABCDEFGHIJKLMNOPQRSTUVWXYZ
lowAlphabet=abcdefghijklmnopqrstuvwxyzabcdefghijklmnopqrstuvwxyz
enkname=$(echo $enkrip | tr "${upperAlphabet:0:26}" "${upperAlphabet:${shift}:26}" | tr "${lowAlphabet:0:26}" "${lowA>
mv $name $enkname.txt