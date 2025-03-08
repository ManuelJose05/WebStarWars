package com.models;

import jakarta.persistence.*;

import java.time.LocalDate;

@Entity
@Table(name = "informes")
public class Informe {
    @Id
    @Column(name = "id", nullable = false)
    private Integer id;

    @Column(name = "fecha")
    private LocalDate fecha;

    @Column(name = "soldados")
    private Integer soldados;

    @Column(name = "navesTerrestres")
    private Integer navesTerrestres;

    @Column(name = "navesAereas")
    private Integer navesAereas;

    @ManyToOne(fetch = FetchType.LAZY, optional = false)
    @JoinColumn(name = "idPlaneta", nullable = false)
    private Planeta idPlaneta;

    public Informe() {}

    public Informe(int id,int soldados, int navesTerrestres, int navesAereas,Planeta idPlaneta, LocalDate fecha) {
        this.id = id;
        this.soldados = soldados;
        this.navesTerrestres = navesTerrestres;
        this.navesAereas = navesAereas;
        this.fecha = fecha;
        this.idPlaneta = idPlaneta;
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public LocalDate getFecha() {
        return fecha;
    }

    public void setFecha(LocalDate fecha) {
        this.fecha = fecha;
    }

    public Integer getSoldados() {
        return soldados;
    }

    public void setSoldados(Integer soldados) {
        this.soldados = soldados;
    }

    public Integer getNavesTerrestres() {
        return navesTerrestres;
    }

    public void setNavesTerrestres(Integer navesTerrestres) {
        this.navesTerrestres = navesTerrestres;
    }

    public Integer getNavesAereas() {
        return navesAereas;
    }

    public void setNavesAereas(Integer navesAereas) {
        this.navesAereas = navesAereas;
    }

    public Planeta getIdPlaneta() {
        return idPlaneta;
    }

    public void setIdPlaneta(Planeta idPlaneta) {
        this.idPlaneta = idPlaneta;
    }

    @Override
    public String toString() {
        return "Informe{" +
                "id=" + id +
                ", fecha=" + fecha +
                ", soldados=" + soldados +
                ", navesTerrestres=" + navesTerrestres +
                ", navesAereas=" + navesAereas +
                ", idPlaneta=" + idPlaneta +
                '}';
    }
}