package com;

import com.controller.Controller;
import com.persistence.Persistencia;

public class main {
    public static void main(String[] args) {
        Persistencia persistencia = new Persistencia();
        Controller controller = new Controller();
        persistencia.leeInformes(controller);
    }
}
