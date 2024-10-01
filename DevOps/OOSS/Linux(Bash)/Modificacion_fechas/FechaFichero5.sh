#!/bin/bash

echo "Introduce el nombre del fichero: "
read fichero

while IFS= read -r line
do
echo "$line"
find $line -mtime +7 -type f -print;
find $line -mtime +7 -type f -delete;
done < $fichero
