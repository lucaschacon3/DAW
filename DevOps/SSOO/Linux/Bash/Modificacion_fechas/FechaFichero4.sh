#!/bin/bash

while IFS=$'\n' read -r line
    do

    	find $line -mtime +7 -type f -print

    	find $line -mtime +7 -type f -delete

	done < ficheroTexto.txt

echo "Archivos borrados: "

cat archivosBorrados.txt

echo "Archivos no borrados: "

cat archivosNoBorrados.txt

