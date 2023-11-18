package com.example.laboratorio8.Beans;

public class Habitante {
    private int idHabitante;
    private Jugador jugador;
    private String nombre;
    private String genero;
    private int horasDia=0;
    private int diasVivo=0;
    private boolean estaExiliado=false;
    private boolean estaMuerto=false;
    private float alimentacionDiaria;
    private float moral;
    private String motivoMuerte;
    private int diaMuerte;



    public int getIdHabitante() {
        return idHabitante;
    }

    public void setIdHabitante(int idHabitante) {
        this.idHabitante = idHabitante;
    }

    public Jugador getJugador() {
        return jugador;
    }

    public void setJugador(Jugador jugador) {
        this.jugador = jugador;
    }

    public String getNombre() {
        return nombre;
    }

    public void setNombre(String nombre) {
        this.nombre = nombre;
    }

    public String getGenero() {
        return genero;
    }

    public void setGenero(String genero) {
        this.genero = genero;
    }

    public int getHorasDia() {
        return horasDia;
    }

    public void setHorasDia(int horasDia) {
        this.horasDia = horasDia;
    }

    public int getDiasVivo() {
        return diasVivo;
    }

    public void setDiasVivo(int diasVivo) {
        this.diasVivo = diasVivo;
    }

    public boolean isEstaExiliado() {
        return estaExiliado;
    }

    public void setEstaExiliado(boolean estaExiliado) {
        this.estaExiliado = estaExiliado;
    }

    public boolean isEstaMuerto() {
        return estaMuerto;
    }

    public void setEstaMuerto(boolean estaMuerto) {
        this.estaMuerto = estaMuerto;
    }

    public float getAlimentacionDiaria() {
        return alimentacionDiaria;
    }

    public void setAlimentacionDiaria(float alimentacionDiaria) {
        this.alimentacionDiaria = alimentacionDiaria;
    }

    public float getMoral() {
        return moral;
    }

    public void setMoral(float moral) {
        this.moral = moral;
    }

    public String getMotivoMuerte() {
        return motivoMuerte;
    }

    public void setMotivoMuerte(String motivoMuerte) {
        this.motivoMuerte = motivoMuerte;
    }

    public int getDiaMuerte() {
        return diaMuerte;
    }

    public void setDiaMuerte(int diaMuerte) {
        this.diaMuerte = diaMuerte;
    }
}
