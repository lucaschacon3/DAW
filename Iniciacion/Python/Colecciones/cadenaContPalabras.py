def contar_rep(cadena, palabra):
    nombreLista=cadena.split()
    contador=0
    for i in range (0,len(nombreLista),1):
        if palabra == nombreLista[i]:
            contador=contador+1
    return contador

def main():
    cadena = "Amad a la dama pero no juguéis con la dama"
    print(cadena)
    palabra = "dama"
    print(palabra)
    cont = contar_rep(cadena,palabra)
    print(cadena, " contiene ", cont, " veces a ", palabra)
main()