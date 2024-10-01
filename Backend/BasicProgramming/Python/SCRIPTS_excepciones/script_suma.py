#[luis@localhost excepciones]$ python argumentos.py 4 5
#los argumentos son ['argumentos.py', '4', '5']
#la suma de 4.0 y 5.0 = 9.0
#[luis@localhost excepciones]$ python3.6 argumentos.py 4 p
#los argumentos son ['argumentos.py', '4', 'p']
#los argumentos tienen que ser númericos
#[luis@localhost excepciones]$

import sys


print("Los argumentos recibidos son: ",sys.argv)


try:
    if len(sys.argv)==3:
        resultado = float(sys.argv[1]) + float(sys.argv[2])
        print(sys.argv[1],"+", sys.argv[2]," es igual ",resultado);
    else:
        print("Numero de argumentos incorrecto")
except ValueError:

    print("Los argumentos no son numeros")


