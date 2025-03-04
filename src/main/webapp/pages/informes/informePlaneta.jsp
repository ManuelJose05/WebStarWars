<%@ page import="com.controller.Controller" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="com.models.Informe" %>
<%@ page import="java.time.format.DateTimeFormatter" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
    <title>Informes del Planeta</title>
    <style>
        .container {
            max-width: 800px;
            margin: auto;
            margin-top: 20px;
        }
        .accordion-button {
            text-align: left;
        }
        .total-tropas {
            margin-top: 20px;
            padding: 10px;
            background: #f8f9fa;
            border-radius: 5px;
            font-weight: bold;
        }
    </style>
</head>
<body>
<jsp:include page="/shared/navBar.jsp"/>
<%
    String idParam = request.getParameter("id");
    int id = (idParam != null) ? Integer.parseInt(idParam) : -1;
%>
<div class="container text-center">
    <div class="row mb-3">
        <div class="col">
            <h3>Lista de Informes</h3>
        </div>
        <div class="col text-end">
            <a class="btn btn-primary" href="./newInforme.jsp?id=<%=id%>">Añadir informe</a>
        </div>
    </div>
    <div class="accordion" id="accordionExample">
        <%
            Controller controller = new Controller();
            ArrayList<Informe> informes = controller.getInformesByPlaneta(id);
            int totalNaveasAereas = 0;
            int totalNavesTerrestres = 0;
            int totalSoldados = 0;
            if (informes.isEmpty()) {
        %>
        <div class="alert alert-warning" role="alert">
            No se ha encontrado ningún Informe.
        </div>
        <%  } else {
            int index = 0;
            for (Informe f: informes) {
                totalSoldados += f.getSoldados();
                totalNaveasAereas += f.getNavesAereas();
                totalNavesTerrestres += f.getNavesTerrestres();
        %>
        <div class="accordion-item">
            <h2 class="accordion-header">
                <button class="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#collapse<%=index%>" aria-expanded="false" aria-controls="collapse<%=index%>">
                    Informe <%=f.getId()%> - <%=f.getFecha().format(DateTimeFormatter.ofPattern("dd/MM/yyyy"))%>
                </button>
            </h2>
            <div id="collapse<%=index%>" class="accordion-collapse collapse" data-bs-parent="#accordionExample">
                <div class="accordion-body">
                    <b>Naves aéreas: </b><%=f.getNavesAereas()%> <br>
                    <b>Naves terrestres: </b><%=f.getNavesTerrestres()%><br>
                    <b>Soldados disponibles: </b><%=f.getSoldados()%>
                </div>
            </div>
        </div>
        <% index++; } } %>
    </div>
    <div class="total-tropas text-center">
        Soldados totales: <%= totalSoldados %> <br>
        Naves aereas totales: <%= totalNaveasAereas %> <br>
        Naves terrestres totales: <%= totalNavesTerrestres %>
    </div>
</div>
</body>
</html>
