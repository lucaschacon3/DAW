class Ordenador():
    def __init__ (self, marca, modelo, almacenamiento, ram, precio):
        self.__marca=marca
        self.__modelo=modelo
        self.__almacenamiento=almacenamiento
        self.__ram=ram
        self.__precio=precio

    def getOrdenador(self):
        print("Marca: ", self.__marca)
        print("Modelo: ", self.__modelo)
        print("Almacenamiento: ", self.__almacenamiento,"GB")
        print("ram: ", self.__ram,"GB")
        print("precio: ", self.__precio,"$")

    def getMarca(self):
        return self.__marca
        
    
    def setOrdenador(self, marca, modelo, almacenamiento, ram, precio):
        self.__marca=marca
        self.__modelo=modelo
        self.__almacenamiento=almacenamiento
        self.__ram=ram
        self.__precio=precio

    def __str__(self):
        return 'La marca es '+self.__marca+' y el modelo es '+self.__modelo
    
    def queSoy(self):
        print("Soy un ordenador")

class Portatil(Ordenador):
    def __init__(self, marca, modelo, almacenamiento, ram, precio, bateria):
        super().__init__(marca, modelo, almacenamiento, ram, precio)

        self.__bateria=bateria

    def getPotatil(self):
        super().getOrdenador()
        print("Bateria: ", self.__bateria,"mA")

    def setPortatil(self, bateria):
   
        self.__bateria=bateria

    def queSoy(self):
        print("Soy un portatil")


ordenador1=Ordenador("Dell","T430", 256,8,300)
ordenador1.getOrdenador()
ordenador1.setOrdenador("Lenovo","T430", 256,8,300)
print("MODIFICACION CORRECTA")
ordenador1.getOrdenador()
print(ordenador1.__str__())

#herencia
ordenador2=Portatil("Dell","W2", 1024,8,500,10000)
ordenador2.getPotatil()
print("Marca=", ordenador1.getMarca())

ordenador2.setPortatil(20000)
ordenador2.getPotatil()

#polimorfismo
ordenador1.queSoy()
ordenador2.queSoy()

