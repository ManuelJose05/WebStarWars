<%--
  Created by IntelliJ IDEA.
  User: manue
  Date: 30/01/2025
  Time: 18:07
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <style>
        form {
            display: flex;
            padding-right: 25px;
            padding-top: 5px;
        }
    </style>
</head>
<body>
<nav class="navbar navbar-expand-lg navbar-dark bg-dark">
    <a href="../homePage.jsp" class="navbar-brand" style="color: yellow; font-weight: bold; font-style: italic">Star Wars Web</a>
    <ul class="navbar-nav me-auto">
        <li class="nav-item">
            <a class="nav-link" href="../pages/planets/planetList.jsp">Home</a>
        </li>
        <li class="nav-item">
            <a class="nav-link" href="../pages/planets/planetList.jsp">Planetas</a>
        </li>
    </ul>
    <form class="d-flex">
        <input class="form-control me-2" type="search" placeholder="Search" aria-label="Search">
        <button class="btn btn-outline-warning" type="submit">Search Planet</button>
    </form>
</nav>
</body>
</html>
