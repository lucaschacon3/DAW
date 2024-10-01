#!/bin/bash
if [ -e dir1 ]
then
cd dir1
    for (( i = 0; i <= 40; i++ ))
        do

            nombreDif="fich_${i}"

            touch $nombreDif

        done

else
    mkdir dir1
    cd dir1
        for (( i = 0; i <= 40; i++ ))
            do

                nombreDif="fich_${i}"

                touch $nombreDif

            done
fi
