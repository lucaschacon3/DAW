class Vehiculo:
    #constructor
    def __init__(self, marca, modelo, motor, color, nruedas):
        self.marca= marca
        self.modelo= modelo
        self.motor= motor
        self.color= color
        self.nruedas= nruedas

    ## metodo de la clase vehiculo
    def mostrar(self):
        print("La marca del vehículo es: ", self.marca)
        print("La modelo del vehículo es: ", self.modelo)
        print("La motor del vehículo es: ", self.motor)
        print("La color del vehículo es: ", self.color)
        print("La nº del ruedas de vehículo es: ", self.nruedas)

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



class Camion(Vehiculo):
    def __init__(self, marca, modelo, motor, color, nruedas, lcarga):
        super().__init__(marca, modelo, motor, color, nruedas)
        self.lcarga=lcarga
    
    def mostrar(self):
        super().mostrar()
        print("El limite de carga del vehículo es: ", self.lcarga)


vei=Coche("Mercedes", "Clase A", "v8", "Blanco", 4, 5)
vei.mostrar()
print(vei.color)
