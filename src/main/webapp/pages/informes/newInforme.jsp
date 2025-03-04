<%@ page import="com.controller.Controller" %>
<%@ page import="com.models.Planeta" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Nuevo Informe</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
    <style>
        .form-container {
            max-width: 600px;
            margin: auto;
            background: #f8f9fa;
            padding: 20px;
            border-radius: 8px;
            box-shadow: 0px 0px 10px rgba(0, 0, 0, 0.1);
        }
    </style>
</head>
<body>
<%
    Controller controller = new Controller();
    int id = Integer.parseInt(request.getParameter("id"));
    Planeta p = controller.getPlanetaById(id);
%>
<jsp:include page="/shared/navBar.jsp"/>

<div class="container mt-5">
    <div class="form-container">
        <h3 class="text-center">Añadir Nuevo Informe</h3>
        <h5 class="text-center">Planeta: <b><%=p.getNombre()%></b></h5>
            <div class="mb-3 row">
                <label for="soldados" class="col-sm-4 col-form-label">Número de Soldados Totales</label>
                <div class="col-sm-8">
                    <input type="number" class="form-control" id="soldados" name="soldados" required>
                </div>
            </div>

            <div class="mb-3 row">
                <label for="navesAereas" class="col-sm-4 col-form-label">Número de Naves Aéreas</label>
                <div class="col-sm-8">
                    <input type="number" class="form-control" id="navesAereas" name="navesAereas" required>
                </div>
            </div>

            <div class="mb-3 row">
                <label for="navesTerrestres" class="col-sm-4 col-form-label">Número de Naves Terrestres</label>
                <div class="col-sm-8">
                    <input type="number" class="form-control" id="navesTerrestres" name="navesTerrestres" required>
                </div>
            </div>

            <div class="text-center">
                <button type="submit" class="btn btn-primary">Guardar Informe</button>
            </div>
    </div>
</div>
</body>
</html>