def copiar(archivo, archivo2):

    original=open(archivo,"r+")
    backup=open(archivo2,"w+")

    linea=original.readline()
    while linea != "":
        backup.write(linea)
        linea=original.readline()

    original.close()
    backup.close()

def main():
    archivo= "original.txt"
    archivo2="backup.txt"

    copiar(archivo, archivo2)

main()

