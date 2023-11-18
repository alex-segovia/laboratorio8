package com.example.laboratorio8.Beans;

public class Jugador {
    private int idJugador;
    private String nombreJugador;
    private int edad;
    private String correo;
    private String usuario;
    private String contrasena;
    private int horasDia = 0;
    private int diasDesdeCreacion = 0;
    private String estado = "En paz";
    private float alimentoTotal;

    public int getIdJugador() {
        return idJugador;
    }

    public void setIdJugador(int idJugador) {
        this.idJugador = idJugador;
    }

    public String getNombreJugador() {
        return nombreJugador;
    }

    public void setNombreJugador(String nombreJugador) {
        this.nombreJugador = nombreJugador;
    }

    public int getEdad() {
        return edad;
    }

    public void setEdad(int edad) {
        this.edad = edad;
    }

    public String getCorreo() {
        return correo;
    }

    public void setCorreo(String correo) {
        this.correo = correo;
    }

    public String getUsuario() {
        return usuario;
    }

    public void setUsuario(String usuario) {
        this.usuario = usuario;
    }

    public String getContrasena() {
        return contrasena;
    }

    public void setContrasena(String contrasena) {
        this.contrasena = contrasena;
    }

    public int getHorasDia() {
        return horasDia;
    }

    public void setHorasDia(int horasDia) {
        this.horasDia = horasDia;
    }

    public int getDiasDesdeCreacion() {
        return diasDesdeCreacion;
    }

    public void setDiasDesdeCreacion(int diasDesdeCreacion) {
        this.diasDesdeCreacion = diasDesdeCreacion;
    }

    public String getEstado() {
        return estado;
    }

    public void setEstado(String estado) {
        this.estado = estado;
    }

    public float getAlimentoTotal() {
        return alimentoTotal;
    }

    public void setAlimentoTotal(float alimentoTotal) {
        this.alimentoTotal = alimentoTotal;
    }
}
