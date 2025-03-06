<%@ page import="com.controller.Controller" %>
<%@ page import="com.models.Informe" %><%--
  Created by IntelliJ IDEA.
  User: Manuel José
  Date: 04/03/2025
  Time: 18:39
  To change this template use File | Settings | File Templates.
--%>
<%
    Controller controller = new Controller();
    int idInforme = controller.ultimoInformeId + 1;
    int idPlaneta = Integer.parseInt(request.getParameter("idPlaneta"));
    int soldados = Integer.parseInt(request.getParameter("soldados"));
    int navesAereas = Integer.parseInt(request.getParameter("navesAereas"));
    int navesTerrestres = Integer.parseInt(request.getParameter("navesTerrestres"));

    Informe i = new Informe(idInforme,soldados,navesTerrestres,navesAereas,controller.getPlanetaById(idPlaneta));
    controller.addNewInforme(i,false);
    response.sendRedirect("informePlaneta.jsp?id=" + idPlaneta);
%>