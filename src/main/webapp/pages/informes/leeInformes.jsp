<%@ page import="com.controller.Controller" %>
<%@ page import="com.persistence.Persistencia" %><%

    Controller controller = new Controller();
    Persistencia persistencia = new Persistencia();
    if (persistencia.leeInformes(controller)) response.sendRedirect("../homePage.jsp?newInformes=true");
    else response.sendRedirect("../homePage.jsp?newInformes=false");
%>