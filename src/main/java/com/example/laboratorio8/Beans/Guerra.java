package com.example.laboratorio8.Beans;

public class Guerra {
    private int idGuerra;
    private Jugador jugadorAtacante=new Jugador();
    private Jugador jugadorDefensor=new Jugador();
    private String resultado;
    private int diasRelativosJugadorAtacante;
    private int diasRelativosJugadorDefensor;

    public int getIdGuerra() {
        return idGuerra;
    }

    public void setIdGuerra(int idGuerra) {
        this.idGuerra = idGuerra;
    }

    public Jugador getJugadorAtacante() {
        return jugadorAtacante;
    }

    public void setJugadorAtacante(Jugador jugadorAtacante) {
        this.jugadorAtacante = jugadorAtacante;
    }

    public Jugador getJugadorDefensor() {
        return jugadorDefensor;
    }

    public void setJugadorDefensor(Jugador jugadorDefensor) {
        this.jugadorDefensor = jugadorDefensor;
    }

    public String getResultado() {
        return resultado;
    }

    public void setResultado(String resultado) {
        this.resultado = resultado;
    }

    public int getDiasRelativosJugadorAtacante() {
        return diasRelativosJugadorAtacante;
    }

    public void setDiasRelativosJugadorAtacante(int diasRelativosJugadorAtacante) {
        this.diasRelativosJugadorAtacante = diasRelativosJugadorAtacante;
    }

    public int getDiasRelativosJugadorDefensor() {
        return diasRelativosJugadorDefensor;
    }

    public void setDiasRelativosJugadorDefensor(int diasRelativosJugadorDefensor) {
        this.diasRelativosJugadorDefensor = diasRelativosJugadorDefensor;
    }
}
