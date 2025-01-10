package com.example.quiz_bbdd;


public enum CategoriaLuchador {
    JON_JONES("¡Eres el mejor luchador! Jon Jones."),
    KHABIB("¡Excelente desempeño! Como Khabib Nurmagomedov."),
    GSP("¡Gran trabajo! Eres como Georges St-Pierre."),
    NATE_DIAZ("¡Vas mejorando! Al estilo de Nate Diaz."),
    CM_PUNK("¡Necesitas entrenar más! Eres como CM Punk."),
    LUCHADOR_DESCONOCIDO("¡Ups! Eres un luchador amateur.");

    private final String mensaje;

    CategoriaLuchador(String mensaje) {
        this.mensaje = mensaje;
    }

    public String getMensaje() {
        return mensaje;
    }

    public static CategoriaLuchador getCategoria(int score) {
        if (score == 8) {
            return JON_JONES;
        } else if (score >= 6) {
            return KHABIB;
        } else if (score >= 4) {
            return GSP;
        } else if (score >= 2) {
            return NATE_DIAZ;
        } else if (score >= 1) {
            return CM_PUNK;
        } else {
            return LUCHADOR_DESCONOCIDO;
        }
    }
}
