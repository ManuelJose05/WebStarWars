<%@ page import="com.controller.Controller" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="com.models.Informe" %>
<%@ page import="java.time.format.DateTimeFormatter" %><%--
  Created by IntelliJ IDEA.
  User: manue
  Date: 01/02/2025
  Time: 11:30
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
    <link href="https://getbootstrap.com/docs/5.3/assets/css/docs.css" rel="stylesheet">
    <title>Informes del Planeta</title>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
</head>
<body>
<jsp:include page="/shared/navBar.jsp"/>
<h3 style="text-align: center; margin-top: 15px; margin-bottom: 10px">Lista de Informes</h3>
<div class="text-center">
<div class="accordion" id="accordionExample">
<%
    String idParam = request.getParameter("id");
    int id = (idParam != null) ? Integer.parseInt(idParam) : -1;

    Controller controller = new Controller();
    ArrayList<Informe> informes = controller.getInformesByPlaneta(id);

    if (informes.isEmpty()) {
        %>
    <div class="alert alert-warning" role="alert">
        No se ha encontrado ningún Informe.
    </div>
    <%  } else for (Informe f: informes) {%>
<div class="accordion-item">
    <h2 class="accordion-header" style="text-align: center">
        <button class="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#<%f.getId();%>" aria-expanded="true" aria-controls="<%f.getId();%>">
            Informe <%=f.getId()%> - <%=f.getFecha().format(DateTimeFormatter.ofPattern("dd/MM/yyyy"))%>
        </button>
    </h2>
    <div id="<%f.getId();%>" class="accordion-collapse collapse" data-bs-parent="#accordionExample">
        <div class="accordion-body">
            <b>Naves aereas: </b><%=f.getNavesAereas()%> <br>
            <b>Naves terrestres: </b><%=f.getNavesTerrestres()%><br>
            <b>Soldados disponibles: </b><%=f.getSoldados()%>
        </div>
    </div>
<% } %>
</div>
</div>
</div>
</body>
</html>