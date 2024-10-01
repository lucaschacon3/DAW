from Vehiculo import *
#clase coche que hereda todo de Vehiculo (metodos, atributos...)
class Coche(Vehiculo):
    def __init__(self, marca, modelo, motor, color, nruedas, npasajero): #constructor con atributos de vehiculo + los nuevos
        super().__init__(marca, modelo, motor, color, nruedas) #constructor de la herencia, pones los que quieres heredar (no poner self) 
        #se pone super porque solo hay una, si hay varias, se pone el nombre de la superclase
        #tambien se puede crear una clase que herede de varias superclases-> class Coche (Vehiculo,Conductor)
        self.npasajero=npasajero
    
    def mostrar(self):
        super().mostrar() # Asi se accede al metodo padre
        print("La nº de pasajeros de vehículo es: ", self.npasajero)

