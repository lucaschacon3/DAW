class Lista:
    def __init__(self):
        self.lista = []


    def menu(self):
        salir = False
        while not salir:
            print("--------------------------------")
            print("Menu listas")
            print("1-Cargar lista")
            print("2-Visualizar lista")
            print("3-Busqueda secuencial")
            print("4-Ordenar la lista")
            print("5-Busqueda binaria")
            print("6-Fusion de 2 listas")
            print("7-Salir")
            opcion = int(input("Elige una opcion: "))
            match opcion:
                case 1:
                    self.cargarLista()
                case 2:
                    self.verLista()
                case 3:
                    self.consultaSecuencial()
                case 4:
                    self.ordernar()
                case 5:
                    self.consultaBinaria()
                case 6:
                    self.fusion()
                case 7:
                    salir = True
                case other:
                    print("Error: opción no válida, tiene que estar entre 1 y 7")



    def cargarLista(self):
        salir = False
        while not salir:
            dato = input("Introduce los elementos de la lista, teclee fin para salir: ")
            salir = (dato == 'fin')
            if not salir:
                self.lista.append(dato)



    def verLista(self):

        for valor in self.lista:
            print(valor) 


    def consultaSecuencial(self):
        aux = input("Introduce la palabra a buscar: ")
        posicion = self.busquedaSecuencial(aux)
        existe = posicion != -1
        if existe:
            print("*************************")
            print("Encontrado ", aux, " en la posicion", posicion)
            print("*************************")
        else:
            print("*************************")
            print("No se ha encontrado el elemento en la lista")
            print("*************************")



    """def busquedaSecuencial(self,aux):
        pos = 0
        encontrado = False
        while pos < len(self.lista) and not encontrado:
            if self.lista[pos] == aux:
                encontrado = True
            else:
                pos = pos + 1
        if encontrado:
            return pos
        else:
            return -1
            """

    def busquedaSecuencial(self,aux):

        for i in range (len(self.lista)):
            if self.lista[i] == aux:
                return i
        return -1



    def ordernar(self):
        intercambio = True
        while intercambio:
            intercambio = False
            for i in range(len(self.lista)-1):
                if self.lista[i] > self.lista[i + 1]:
                    aux = self.lista[i]
                    self.lista[i] = self.lista[i + 1]
                    self.lista[i + 1] = aux
                    intercambio = True


    def consultaBinaria(self):
        buscado = input("Introduce la palabra a buscar: ")
        posicion = self.busquedaBinaria(buscado)
        existe = posicion != -1
        if existe:
            print(buscado, " esta en la posicion, ", posicion)
        else:
            print(buscado, " no existe")


    def busquedaBinaria(self,buscado):
        izq = 0
        derecha = len(self.lista)-1
        central = (izq + derecha) // 2
        while izq <= derecha and buscado != self.lista[central]:
            if buscado > self.lista[central]:
                izq = central + 1
            else:
                derecha = central - 1
            central = (izq + derecha) // 2
        if self.lista[central] == buscado:
            return central
        return -1


    def fusion(self):
        # creamos 2 listas
        lista1 = Lista()
        print("Lista1: ")
        lista1.cargarLista()
        print("Lista 2: ")
        lista2 = Lista()
        lista2.cargarLista()
        # ordeno las listas
        lista1.ordernar()
        lista2.ordernar()
        # creamos otra lista donde almacenamos la mezcla de las listas
        lista3 = lista1.mezcla(lista2)
        lista3.verLista()


    def mezcla(self,lista2):
        i = 0
        j = 0
        lista3 = Lista()
        while i < len(self.lista) and j < len(lista2.lista):
            if self.lista[i] < lista2.lista[j]:
                lista3.lista.append(self.lista[i])
                i += 1

            else:
                lista3.lista.append(lista2.lista[j])
                j += 1

        while i < len(self.lista):
            lista3.lista.append(self.lista[i])
            i += 1

        while j < len(lista2.lista):
            lista3.lista.append(lista2.lista[j])
            j += 1
        return lista3


lista = Lista()
lista.menu()
