package com.controller;

import com.models.Informe;
import com.models.Planeta;
import jakarta.persistence.*;


import java.util.ArrayList;

public class Controller {
    private EntityManagerFactory entityManagerFactory;
    private EntityManager entityManager;

    private ArrayList<Planeta> planetas = new ArrayList<>();
    private ArrayList<Informe> informes = new ArrayList<>();
    public int ultimoInformeId;

    public Controller() {
        entityManagerFactory = Persistence.createEntityManagerFactory("my-persistence-unit");
        entityManager = entityManagerFactory.createEntityManager();

        planetas = getAllPlanets();
        informes = getAllInformes();
    }


    public ArrayList<Planeta> getAllPlanets() {
        entityManager.getTransaction().begin();
        TypedQuery<Planeta> query = entityManager.createQuery("SELECT p FROM Planeta p", Planeta.class);
        ArrayList<Planeta> planetas = (ArrayList<Planeta>) query.getResultList();
        entityManager.getTransaction().commit();
        return planetas;
    }

    public ArrayList<Informe> getAllInformes() {
        entityManager.getTransaction().begin();
        TypedQuery<Informe> query = entityManager.createQuery("SELECT i FROM Informe i", Informe.class);
        ArrayList<Informe> informes = (ArrayList<Informe>) query.getResultList();
        ultimoInformeId = informes.getLast().getId();
        entityManager.getTransaction().commit();
        return informes;
    }

    public Planeta getPlanetaById(int id) {
        entityManager.getTransaction().begin();
        Planeta planeta = entityManager.find(Planeta.class, id);
        entityManager.getTransaction().commit();
        return planeta;
    }

    public Informe getInformeById(int id) {
        entityManager.getTransaction().begin();
        Informe informe = entityManager.find(Informe.class, id);
        entityManager.getTransaction().commit();
        return informe;
    }

    public ArrayList<Informe> getInformesByPlaneta(int idPlaneta) {
        ArrayList<Informe> temp = new ArrayList<>();
        informes.forEach(informe -> {
            if (informe.getIdPlaneta().getId() == idPlaneta) temp.add(informe);
        });
        return temp;
    }

    public boolean login(String email, String password) {
        return email.equals("admin@admin.com") && password.equals("admin");
    }
    public void addNewInforme(Informe informe, boolean reporte) {
        entityManager.getTransaction().begin();
        entityManager.persist(informe);
        if (!reporte) ultimoInformeId = informe.getId();
        entityManager.getTransaction().commit();
    }

    public void addNewPlaneta(Planeta planeta) {
        entityManager.getTransaction().begin();
        if (entityManager.find(Planeta.class, planeta.getId()) == null) entityManager.persist(planeta);
        entityManager.getTransaction().commit();
    }
}
