#!/bin/bash
clear
# Verifica si se proporcionaron al menos 2 parámetros
if [ "$#" -lt 2 ]; then
    echo "Error: Debes proporcionar al menos 2 parámetros (ASC/DESC y al menos un número)"
    exit 1
fi

# Guarda el primer parámetro (ASC o DESC) en la variable
orden="$1"
shift  # Elimina el primer parámetro

# Comprueba el tipo de orden y ordena
if [ "$orden" == "ASC" ]; then
    parametros_ordenados=$(echo "$@" | tr ' ' '\n' | sort)
elif [ "$orden" == "DESC" ]; then
    parametros_ordenados=$(echo "$@" | tr ' ' '\n' | sort -r)
else
    echo "Error: El primer parámetro debe ser ASC o DESC"
    exit 1
fi

# Imprime los parámetros ordenados
echo -n "$parametros_ordenados"

