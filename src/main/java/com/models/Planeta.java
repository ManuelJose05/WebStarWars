package com.models;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.Id;
import jakarta.persistence.Table;

import java.util.ArrayList;

@Entity
@Table(name = "planetas")
public class Planeta {
    @Id
    @Column(name = "id", nullable = false)
    private Integer id;

    @Column(name = "nombre", length = 50)
    private String nombre;

    @Column(name = "coordenadas1")
    private Double coordenadas1;

    @Column(name = "coordenadas2")
    private Double coordenadas2;

    @Column(name = "coordenadas3")
    private Double coordenadas3;

    @Column(name = "imagen_url")
    private String imagenUrl;

    @Column(name = "descripcion")
    private String descripcion;

    public Planeta() {}

    public Planeta(int id, String nombre, double coordenadas1, double coordenadas2, double coordenadas3) {
        this.id = id;
        this.nombre = nombre;
        this.coordenadas1 = coordenadas1;
        this.coordenadas2 = coordenadas2;
        this.coordenadas3 = coordenadas3;
        this.imagenUrl = "";
        this.descripcion = "";
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getNombre() {
        return nombre;
    }

    public void setNombre(String nombre) {
        this.nombre = nombre;
    }

    public Double getCoordenadas1() {
        return coordenadas1;
    }

    public void setCoordenadas1(Double coordenadas1) {
        this.coordenadas1 = coordenadas1;
    }

    public Double getCoordenadas2() {
        return coordenadas2;
    }

    public void setCoordenadas2(Double coordenadas2) {
        this.coordenadas2 = coordenadas2;
    }

    public Double getCoordenadas3() {
        return coordenadas3;
    }

    public void setCoordenadas3(Double coordenadas3) {
        this.coordenadas3 = coordenadas3;
    }

    public String getImagenUrl() {
        return imagenUrl;
    }

    public void setImagenUrl(String imagenUrl) {
        this.imagenUrl = imagenUrl;
    }

    public String getDescripcion() {
        return descripcion;
    }

    public void setDescripcion(String descripcion) {
        this.descripcion = descripcion;
    }

    @Override
    public String toString() {
        return "Planeta{" +
                "id=" + id +
                ", nombre='" + nombre + '\'' +
                ", coordenadas1=" + coordenadas1 +
                ", coordenadas2=" + coordenadas2 +
                ", coordenadas3=" + coordenadas3 +
                '}';
    }
}