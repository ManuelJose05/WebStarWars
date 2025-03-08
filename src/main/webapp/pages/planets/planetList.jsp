<%@ page import="com.controller.Controller" %>
<%@ page import="com.models.Planeta" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
    <link href="https://getbootstrap.com/docs/5.3/assets/css/docs.css" rel="stylesheet">
    <title>Planetas de Star Wars</title>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
    <style>
        a {
            text-decoration: none;
            color: black;
            font-family: 'Star Jedi', sans-serif;
            transition: all 0.3s ease-in-out;
        }
        a:hover {
            background-color: black;
            color: #ffe81f; /* Amarillo Star Wars */
            text-shadow: 0 0 10px #ffe81f, 0 0 20px #ffcc00; /* Efecto de brillo */
            padding: 5px 10px;
            border-radius: 5px;
            transform: scale(1.1); /* Pequeño zoom al pasar el mouse */
        }
    </style>
</head>
<body>
<jsp:include page="/pages/navBar.html"/>
<div class="container d-flex justify-content-center" style="margin-top: 50px; max-width: 80%;">
    <div class="table-responsive-md">
        <table class="table table-bordered text-center">
            <h2 style="text-align: center">Lista de Planetas de Star Wars</h2>
            <thead class="table-dark">
            <tr>
                <th scope="col">Id Planeta</th>
                <th scope="col">Nombre</th>
                <th scope="col">Coordenada 1</th>
                <th scope="col">Coordenada 2</th>
                <th scope="col">Coordenada 3</th>
            </tr>
            </thead>
            <tbody>
            <%
                Controller controller = new Controller();
                for (Planeta p : controller.getAllPlanets()) {
            %>
            <tr>
                <td><%= p.getId() %></td>
                <td><a href="./planetCard.jsp?id=<%= p.getId() %>">
                    <%= p.getNombre() %>
                </a></td>
                <td><%= p.getCoordenadas1() %></td>
                <td><%= p.getCoordenadas2() %></td>
                <td><%= p.getCoordenadas3() %></td>
            </tr>
            <%
                }
            %>
            </tbody>
        </table>
    </div>
</div>
</body>
</html>
