<%@ page import="com.models.Planeta" %>
<%@ page import="com.controller.Controller" %>
<%@ page import="com.models.Informe" %><%--
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
    Informe informe = controller.getInformeById(id);

    if (planeta != null && informe != null) {
%>
<br>
<h3 style="text-align: center; margin-bottom: 25px">Información base de <%=planeta.getNombre()%></h3>
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
        <li class="list-group-item"><b>Naves terrestres: </b><%=informe.getNavesTerrestres()%></li>
        <li class="list-group-item"><b>Naves aereas: </b><%=informe.getNavesAereas()%></li>
        <li class="list-group-item"><b>Soldados: </b><%=informe.getSoldados()%></li>
        <li class="list-group-item"><b>Fecha del informe: </b><%=informe.getFecha()%></li>
        <div class="card-body">
            <a class="btn btn-dark" href="../informes/informePlaneta.jsp?id=<%=planeta.getId()%>">Ver informes de planeta</a>
        </div>
    </ul>
</div>
<div/>
    <%
} else {
%>
    <div class="d-flex justify-content-center align-items-center" style="height: 90vh;">
    <div class="alert alert-warning" role="alert">
        <h4 class="alert-heading">Ha ocurrido un error</h4>
        <p><%=planeta == null ? "No se ha encontrado ningún planeta con ese ID. Vuelva a intentarlo" :
"No se han encontrado informes de dicho planeta. Vuelva a intentarlo"%></p
        <hr>
        <a class="mb-0" href="../homePage.jsp">Volver al inicio</a>
    </div>
    </div>
<%
    }
%>
</body>
</html>