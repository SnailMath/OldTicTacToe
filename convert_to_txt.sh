#!/bin/bash

#just a short bash script to extract the text from the old and the new TTTGuide and diff it. I just wanted to know what was new in the version 07 compared to 04

#Change newline characters to \n
tr "\r" "\n" < TTTGuide-\(Program\).xcp     > TTTGuide-\(Program\).xcp.temp
tr "\r" "\n" < TTTGuide-\(Program\)_new.xcp > TTTGuide-\(Program\)_new.xcp.temp

#Remove non-printable characters
tr -c '\11\12\15\40-\176' '#' < TTTGuide-\(Program\).xcp.temp     > TTTGuide-\(Program\).xcp.txt
tr -c '\11\12\15\40-\176' '#' < TTTGuide-\(Program\)_new.xcp.temp > TTTGuide-\(Program\)_new.xcp.txt

#diff the files
diff -y TTTGuide-\(Program\).xcp.txt TTTGuide-\(Program\)_new.xcp.txt > TTTGuide_diff.txt
