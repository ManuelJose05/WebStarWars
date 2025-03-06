package com.persistence;

import com.controller.Controller;
import com.models.Informe;
import com.models.Planeta;

import java.io.*;
import java.util.ArrayList;

public class Persistence {

    public static void leeInformes() {
        String PATH = "src/main/java/com/data";
        try {
            Controller controller = new Controller();
            File file = new File(PATH);
            FileReader fr = new FileReader(file + "/" +  file.listFiles()[0].getName());
            BufferedReader br = new BufferedReader(fr);

            String linea = br.readLine();
            String datosAñadir;
            ArrayList<String> datos = new ArrayList<>();
            while (linea != null) {
                if (linea.contains(":")) datosAñadir = linea.substring(linea.indexOf(":") + 1);
                else datosAñadir = linea.substring(linea.indexOf("-") + 1);
                if (!datosAñadir.isBlank() && !datosAñadir.isEmpty()) datos.add(datosAñadir.trim());
                linea = br.readLine();
            }
            Planeta p = new Planeta(Integer.parseInt(datos.get(2)), datos.get(0),Double.parseDouble(datos.get(3)),Double.parseDouble(datos.get(4)),Double.parseDouble(datos.get(5)));
            Informe informe = new Informe(Integer.parseInt(datos.get(2)),Integer.parseInt(datos.get(6)),Integer.parseInt(datos.get(7)),Integer.parseInt(datos.get(8)),p);
            controller.addNewPlaneta(p);
            controller.addNewInforme(informe,true);
        } catch (FileNotFoundException e) {
            System.out.println("File not found");
        } catch (IOException e) {
            System.out.print("Error reading file");
        }
    }
}
