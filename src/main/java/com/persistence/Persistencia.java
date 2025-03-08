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
            ArrayList<String> datos = new ArrayList<>();

            for (File f : Objects.requireNonNull(file.listFiles())) {
                fr = new FileReader(file.getPath() + "/" + f.getName());
                System.out.println(file.getPath() + "/" + f.getName());
                br = new BufferedReader(fr);
                String linea = br.readLine();

                while (linea != null) {
                    if (linea.contains(":")) datosAgregar = linea.substring(linea.indexOf(":") + 1);
                    else datosAgregar = linea.substring(linea.indexOf("-") + 1);
                    if (!datosAgregar.isBlank()) datos.add(datosAgregar.trim());
                    linea = br.readLine();
                }

                String fechaStr = datos.getLast().replaceAll("/", "-");
                DateTimeFormatter inputFormatter = DateTimeFormatter.ofPattern("dd-MM-yyyy");
                LocalDate fecha = LocalDate.parse(fechaStr, inputFormatter);

                Planeta p = new Planeta(Integer.parseInt(datos.get(2)), datos.get(0),Double.parseDouble(datos.get(3)),
                        Double.parseDouble(datos.get(4)),Double.parseDouble(datos.get(5)));

                Informe informe = new Informe(Integer.parseInt(datos.get(1)),Integer.parseInt(datos.get(6)),
                        Integer.parseInt(datos.get(7)),
                        Integer.parseInt(datos.get(8)),p,fecha);

                controller.addNewPlaneta(p);

                if (controller.addNewInforme(informe,true)) {
                    algunNuevoInforme = true;
                }
                datos.clear();
            }
        } catch (FileNotFoundException e) {
            System.out.println("File not found");
        } catch (IOException e) {
            System.out.print("Error reading file");
        }
        return algunNuevoInforme;
    }
}
