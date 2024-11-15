#!/bin/bash
echo "Archivos borrados"
while IFS=$'\n' read -r line
do
	find $line -mtime +7 -type f -print
	find $line -mtime +7 -type f -delete 
done < ficheroTexto.txt


