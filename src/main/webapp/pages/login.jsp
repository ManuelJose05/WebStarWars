<%@ page import="com.controller.Controller" %><%--
  Created by IntelliJ IDEA.
  User: manue
  Date: 29/01/2025
  Time: 20:01
  To change this template use File | Settings | File Templates.
--%>
<%
    Controller controller = new Controller();

    String email = request.getParameter("email");
    String password = request.getParameter("password");

    if (controller.login(email, password)) {
        session.setAttribute("email", email);
        session.setAttribute("password", password);
        response.sendRedirect("homePage.jsp");
    }
%>