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
