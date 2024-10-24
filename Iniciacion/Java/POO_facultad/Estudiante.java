package POO_facultad;

public class Estudiante extends Persona{

    private int curso;
    
    public Estudiante(int curso, String nombre, String apellidos, String dni, String estado_civil){

        super(nombre, apellidos, dni, estado_civil);
        this.curso=curso;
    }

    public int getCurso() {
        return curso;
    }

    @Override
    public String toString() {
        return super.toString()+" Curso: "+getCurso();
    }
}
