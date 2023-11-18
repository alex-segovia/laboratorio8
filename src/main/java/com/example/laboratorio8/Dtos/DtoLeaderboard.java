package com.example.laboratorio8.Dtos;

import com.example.laboratorio8.Beans.Jugador;

public class DtoLeaderboard {
    private Jugador jugador;
    private int poblacionTotal;
    private int diasJugados;
    private float moralTotal;
    private int guerrasGanadas;
    private float porcentajeVictoriasGuerras;
    private float fuerzaTotal;
    private int maxDiasHabitante;
    private float produccionTotal;

    public Jugador getJugador() {
        return jugador;
    }

    public void setJugador(Jugador jugador) {
        this.jugador = jugador;
    }

    public int getPoblacionTotal() {
        return poblacionTotal;
    }

    public void setPoblacionTotal(int poblacionTotal) {
        this.poblacionTotal = poblacionTotal;
    }

    public int getDiasJugados() {
        return diasJugados;
    }

    public void setDiasJugados(int diasJugados) {
        this.diasJugados = diasJugados;
    }

    public float getMoralTotal() {
        return moralTotal;
    }

    public void setMoralTotal(float moralTotal) {
        this.moralTotal = moralTotal;
    }

    public int getGuerrasGanadas() {
        return guerrasGanadas;
    }

    public void setGuerrasGanadas(int guerrasGanadas) {
        this.guerrasGanadas = guerrasGanadas;
    }

    public float getPorcentajeVictoriasGuerras() {
        return porcentajeVictoriasGuerras;
    }

    public void setPorcentajeVictoriasGuerras(float porcentajeVictoriasGuerras) {
        this.porcentajeVictoriasGuerras = porcentajeVictoriasGuerras;
    }

    public float getFuerzaTotal() {
        return fuerzaTotal;
    }

    public void setFuerzaTotal(float fuerzaTotal) {
        this.fuerzaTotal = fuerzaTotal;
    }

    public int getMaxDiasHabitante() {
        return maxDiasHabitante;
    }

    public void setMaxDiasHabitante(int maxDiasHabitante) {
        this.maxDiasHabitante = maxDiasHabitante;
    }

    public float getProduccionTotal() {
        return produccionTotal;
    }

    public void setProduccionTotal(float produccionTotal) {
        this.produccionTotal = produccionTotal;
    }
}
