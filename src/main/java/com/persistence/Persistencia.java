package com.persistence;

import com.controller.Controller;
import com.models.Informe;
import com.models.Planeta;

import java.io.*;
import java.time.LocalDate;
import java.time.format.DateTimeFormatter;
import java.util.ArrayList;
import java.util.Objects;

public class Persistencia {

    public boolean leeInformes(Controller controller) {
        String PATH = "C:\\Users\\manue\\IdeaProjects\\WebStarWars\\src\\main\\java\\com\\data";
        File file = new File(PATH);
        boolean algunNuevoInforme = false;
        try {
            FileReader fr;
            BufferedReader br;
            String datosAgregar;

            for (File f : Objects.requireNonNull(file.listFiles())) {
                fr = new FileReader(file.getPath() + "/" + f.getName());
                System.out.println(file.getPath() + "/" + f.getName());
                br = new BufferedReader(fr);
                int soldados = 0, navesAereas = 0, navesTerrestres = 0;
                DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd");
                int id = 0, idInforme = 0;
                String nombrePlaneta = "";
                double cords1 = 0, cords2 = 0, cords3 = 0;
                String linea = br.readLine();
                LocalDate fecha = null;

                while (linea != null) {
                    linea = linea.trim();
                    if (linea.startsWith("Planeta:")) {
                        nombrePlaneta = linea.split(": ")[1];
                    } else if (linea.startsWith("Report:")) {
                        idInforme = Integer.parseInt(linea.split(": ")[1]);
                    } else if (linea.startsWith("ID:")) {
                        id = Integer.parseInt(linea.split(": ")[1]);
                    } else if (linea.startsWith("-") && !linea.contains(":")) {
                        if (cords1 == 0) cords1 = Double.parseDouble(linea.substring(2).trim());
                        else if (cords2 == 0) cords2 = Double.parseDouble(linea.substring(2).trim());
                        else cords3 = Double.parseDouble(linea.substring(2).trim());
                    } else if (linea.startsWith("Fecha del informe:")) {
                        fecha = LocalDate.parse(linea.split(": ")[1], formatter);
                    } else if (linea.startsWith("-")) {
                        String[] partes = linea.split(": ");
                        if (partes[0].contains("Soldados")) {
                            soldados = Integer.parseInt(partes[1]);
                        } else if (partes[0].contains("Naves aereas")) {
                            navesAereas = Integer.parseInt(partes[1]);
                        } else if (partes[0].contains("Naves terrestres")) {
                            navesTerrestres = Integer.parseInt(partes[1]);
                        }
                    }
                    linea = br.readLine();
                }


                Planeta p = new Planeta(id,nombrePlaneta,cords1,cords2,cords3);

                Informe informe = new Informe(idInforme,soldados,navesTerrestres,navesAereas,p,fecha);

                controller.addNewPlaneta(p);

                if (controller.addNewInforme(informe,true)) {
                    algunNuevoInforme = true;
                }
            }
        } catch (FileNotFoundException e) {
            System.out.println("File not found");
        } catch (IOException e) {
            System.out.print("Error reading file");
        }
        return algunNuevoInforme;
    }
}
