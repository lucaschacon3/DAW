## en java una clase abstracta tiene min un metodo abstracto, 
##tiene que ser definidq en la subclase que extiende a la clase abstracta
## los metodos abstractos sirven para implentar 
##polimorfismo (es utilizar un mismo id de un metodo que va a tener una definicion distinta del objeto que este utilizando)
class Rectangulo:
    #constructor
    def __init__(self, base, altura):
        self.__base = base
        ##las __ significan que son atributos privados excepto en el init.
        self.__altura = altura


    #métodos set (modificar fuera de la clase)(si fuese publico seria innecesario)
    def set_base(self, base):
         self.__base = base


    def set_altura(self, altura):
            self.__altura = altura

    #métodos get (para conocer el contenido fuera de la clase)(si fuese publico seria innecesario)
    def get_base(self):
        return self.__base


    def get_altura(self):
        return self.__altura


    def mostrar_datos(self):
            print("base:", self.__base)
            print("altura:", self.__altura)
    
    def area(self):
         ## el pass en phyton no vale para nada
         pass


    def area(self):
        return self.__base * self.__altura


    def perimetro(self):
        return 2 * (self.__base + self.__altura)


    def clonar(self, rectang):
       return Rectangulo(rectang.__base, rectang.__altura)
    
class Rectangulo2 (Rectangulo):
        ##la primera linea del constructor de la subclase es para invocar al constructor de la superclase
    def __init__(self, base, altura):
        super().__init__(base, altura)
    ##Rectangulo.__init__(self, base, altura) //otra forma
class Rectangulo3 (Rectangulo):
    def __init__(self, base, altura):
        super().__init__(base, altura)
             



def main():
    #instanciamos un objeto de tipo Rectangulo
    rect1 = Rectangulo(4,2)
    rect1.mostrar_datos()
    print("área = ", rect1.area())
    print("perímetro = ", rect1.perimetro())
    #modificamos aributos
    rect1.set_base(7)
    rect1.set_altura(2)
    print("área = ", rect1.area())
    print("perímetro = ", rect1.perimetro())
    #print("base = ",rect1.base)(No se puede)
    print("base = ", rect1.get_base())
    #clonamos un objeto y hacemos un paso de parámetros por referencia
    rect2 = rect1.clonar(rect1)
    rect2.mostrar_datos()
    #imprimir las referenias
    print("Referencias de los objetos")
    print(rect1)
    print(rect2)

main()
