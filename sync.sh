#!/bin/bash

#Print added file

for file2 in `diff -r /home/andrij/Bash/syncd /home/andrij/Bash/syncd_copy | grep "$folder1:" | awk '{print $4}'` 
do
    ls -l /home/andrij/Bash/syncd | grep $file2 | awk '{print $6, $7, $8, "added file", $9}' 
done

echo "------------------------------"

#Print deleted file
for file in `diff -r home/andrij/Bash/syncd_copy home/andrij/Bash/syncd | grep "syncd_copy:" | awk '{print $4}'`
do
    ls -l /home/andrij/Bash/syncd_copy | grep $file | awk '{print $6, $7, $8, "deleted file", $9}'
done

