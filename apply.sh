#!/bin/bash -xe

declare preparation_folder=fortune_prepared
declare target_folder=/usr/share/games/fortune 
rm -rf "$preparation_folder"
mkdir "$preparation_folder"
find data -name "*.txt" | while read file
do
	declare textfile=$(echo $file | sed "s/\.txt$//" | sed "s/^data\///" )
	cp $file "$preparation_folder/$textfile"
	strfile "$preparation_folder/$textfile" "$preparation_folder/${textfile}.dat"
done

echo "preparation done... Next step will probably fail when you are not root"
cp $preparation_folder $target_folder
