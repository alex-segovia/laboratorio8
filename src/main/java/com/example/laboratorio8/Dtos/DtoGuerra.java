package com.example.laboratorio8.Dtos;

public class DtoGuerra {
    Float fuerzaTotal;
    Float moralTotal;
    Float alimentoTotal;
    Float produccionAlimentoTotal;
    Float produccionMoralTotal;
    Integer cantidadSoldados;
    Integer cantidadConstructores;
    Integer cantidadHabitantes;

    public Float getFuerzaTotal() {
        return fuerzaTotal;
    }

    public void setFuerzaTotal(Float fuerzaTotal) {
        this.fuerzaTotal = fuerzaTotal;
    }

    public Float getMoralTotal() {
        return moralTotal;
    }

    public void setMoralTotal(Float moralTotal) {
        this.moralTotal = moralTotal;
    }

    public Float getAlimentoTotal() {
        return alimentoTotal;
    }

    public void setAlimentoTotal(Float alimentoTotal) {
        this.alimentoTotal = alimentoTotal;
    }

    public Float getProduccionAlimentoTotal() {
        return produccionAlimentoTotal;
    }

    public void setProduccionAlimentoTotal(Float produccionAlimentoTotal) {
        this.produccionAlimentoTotal = produccionAlimentoTotal;
    }

    public Float getProduccionMoralTotal() {
        return produccionMoralTotal;
    }

    public void setProduccionMoralTotal(Float produccionMoralTotal) {
        this.produccionMoralTotal = produccionMoralTotal;
    }

    public Integer getCantidadSoldados() {
        return cantidadSoldados;
    }

    public void setCantidadSoldados(Integer cantidadSoldados) {
        this.cantidadSoldados = cantidadSoldados;
    }

    public Integer getCantidadConstructores() {
        return cantidadConstructores;
    }

    public void setCantidadConstructores(Integer cantidadConstructores) {
        this.cantidadConstructores = cantidadConstructores;
    }

    public Integer getCantidadHabitantes() {
        return cantidadHabitantes;
    }

    public void setCantidadHabitantes(Integer cantidadHabitantes) {
        this.cantidadHabitantes = cantidadHabitantes;
    }

    public DtoGuerra(Float fuerzaTotal, Float moralTotal, Float alimentoTotal, Float produccionAlimentoTotal, Float produccionMoralTotal, Integer cantidadSoldados, Integer cantidadConstructores, Integer cantidadHabitantes) {
        this.fuerzaTotal = fuerzaTotal;
        this.moralTotal = moralTotal;
        this.alimentoTotal = alimentoTotal;
        this.produccionAlimentoTotal = produccionAlimentoTotal;
        this.produccionMoralTotal = produccionMoralTotal;
        this.cantidadSoldados = cantidadSoldados;
        this.cantidadConstructores = cantidadConstructores;
        this.cantidadHabitantes = cantidadHabitantes;
    }
}
