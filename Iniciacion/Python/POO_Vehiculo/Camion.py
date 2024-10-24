from Vehiculo import *
class Camion(Vehiculo):
    def __init__(self, marca, modelo, motor, color, nruedas, lcarga):
        super().__init__(marca, modelo, motor, color, nruedas)
        self.lcarga=lcarga
    
    def mostrar(self):
        super().mostrar()
        print("El limite de carga del vehículo es: ", self.lcarga)

