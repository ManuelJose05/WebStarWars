<%@ page import="com.controller.Controller" %>
<%@ page import="com.controller.Usuario" %><%--
  Created by IntelliJ IDEA.
  User: manue
  Date: 29/01/2025
  Time: 20:01
  To change this template use File | Settings | File Templates.
--%>
<%
    Controller controller = new Controller();

    String name = request.getParameter("name");
    String email = request.getParameter("email");
    String password = request.getParameter("password");

    controller.registerUser(new Usuario(name,email,password));
    session.setAttribute("email", email);
    session.setAttribute("password", password);
    response.sendRedirect("../homePage.jsp");
%>