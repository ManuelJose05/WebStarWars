package com.controller;

import com.models.Informe;
import com.models.Planeta;
import com.persistence.Persistencia;
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
        entityManager.getTransaction().begin();
        Usuario temp = entityManager.find(Usuario.class, email);
        boolean login =  temp != null && temp.getPassword().equals(password);
        entityManager.getTransaction().commit();
        return login;
    }

    public void registerUser(Usuario usuario) {
        entityManager.getTransaction().begin();
        entityManager.persist(usuario);
        entityManager.getTransaction().commit();
    }

    public boolean addNewInforme(Informe informe, boolean reporte) {
        if (entityManager.find(Informe.class, informe.getId()) == null) {
            entityManager.getTransaction().begin();
            entityManager.persist(informe);
            entityManager.getTransaction().commit();
            return true;
        }
        if (!reporte) ultimoInformeId = informe.getId();
        return false;
    }

    public boolean addNewPlaneta(Planeta planeta) {
        if (entityManager.find(Planeta.class, planeta.getId()) == null)  {
            entityManager.getTransaction().begin();
            entityManager.persist(planeta);
            entityManager.getTransaction().commit();
            return true;
        }
        return false;
    }
}
