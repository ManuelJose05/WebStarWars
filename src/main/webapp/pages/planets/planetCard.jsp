<%@ page import="com.models.Planeta" %>
<%@ page import="com.controller.Controller" %>
<%@ page import="com.models.Informe" %>
<%@ page import="java.util.ArrayList" %><%--
  Created by IntelliJ IDEA.
  User: manue
  Date: 30/01/2025
  Time: 18:36
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
    <link href="https://getbootstrap.com/docs/5.3/assets/css/docs.css" rel="stylesheet">
    <title>Información de Planeta</title>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
    <style>
        a {
            text-decoration: none;
            color: inherit;
            font-weight: normal;
            font-style: normal;
            background: none;
            border: none;
            padding: 0;
            margin: 0;
        }
        a:hover {
            background-color: black;
            color: white;
        }
    </style>
</head>
<body>
<jsp:include page="/shared/navBar.jsp"/>
<%
    String idParam = request.getParameter("id");
    int id = (idParam != null) ? Integer.parseInt(idParam) : -1;

    Controller controller = new Controller();
    Planeta planeta = controller.getPlanetaById(id);
    ArrayList<Informe> informes = controller.getInformesByPlaneta(id);
    int soldados = 0, navesAereas = 0,navesTerrestres = 0;
    String fecha = "Desconocida";
    if (!informes.isEmpty()) {
         soldados = informes.stream().mapToInt(Informe::getSoldados).sum();
         navesAereas = informes.stream().mapToInt(Informe::getNavesAereas).sum();
         navesTerrestres = informes.stream().mapToInt(Informe::getNavesTerrestres).sum();
         fecha = informes.getLast().getFecha().toString();
    }
%>
<br>
<h3 style="text-align: center;">Información base de <%=planeta.getNombre()%></h3>
<div class="d-flex justify-content-center align-items-center" style="height: 100vh;">
<div class="card mb-3" style="width: 25rem; text-align: center">
    <img class="card-img-top" src="<%= planeta.getImagenUrl()%>" alt="Card image cap" width="200" height="280">
    <div class="card-body">
        <h5 class="card-title"><%=planeta.getNombre()%></h5>
        <p class="card-text"><%= planeta.getDescripcion().isEmpty() ? "Planeta desconocido" : planeta.getDescripcion()%></p>
    </div>
    <ul class="list-group list-group-flush">
        <li class="list-group-item"><b>Coordenada 1: </b><%=planeta.getCoordenadas1()%> <br>
            <b>Coordenada 2: </b><%=planeta.getCoordenadas2()%>
            <br>
            <b>Coordenada 2: </b><%=planeta.getCoordenadas2()%>
        </li>
        <%
            if (!informes.isEmpty()){
        %>
        <li class="list-group-item"><b>Naves terrestres: </b><%=navesTerrestres%></li>
        <li class="list-group-item"><b>Naves aereas: </b><%=navesAereas%></li>
        <li class="list-group-item"><b>Soldados: </b><%=soldados%></li>
        <li class="list-group-item"><b>Fecha del último informe: </b><%=fecha%></li>
        <div class="card-body">
            <a class="btn btn-dark" href="../informes/informePlaneta.jsp?id=<%=planeta.getId()%>">Ver informes de planeta</a>
        </div>
        <%} else {%>
        <div class="card-body">
            <div class="d-flex justify-content-center align-items-center">
                <div class="alert alert-warning" role="alert">
                    <h4 class="alert-heading">No hay informes de este Planeta</h4>
                    <p><%=planeta == null ? "No se ha encontrado ningún planeta con ese ID. Vuelva a intentarlo" :
                            "No se han encontrado informes de dicho planeta. Añade un nuevo informe"%></p
                    <hr>
                </div>
            </div>
            <a class="btn btn-dark" href="../informes/newInforme.jsp?id=<%=planeta.getId()%>">Añadir Informe</a>
        </div>
        <%}%>
    </ul>
</div>
<div/>
</div>
</body>
</html>