<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page import="com.emergentes.modelo.Tarea"%>
<%@page import="com.emergentes.modelo.GestorTareas"%>

<%
    if(session.getAttribute("agenda") == null){
        GestorTareas objeto1 = new GestorTareas();
        
        objeto1.InsertarTarea(new Tarea(1, "Reunion con estudiantes de la carrera.", "Alta"));
        objeto1.InsertarTarea(new Tarea(2, "Estudiar para el examen de estadistica", "Alta"));
        objeto1.InsertarTarea(new Tarea(3, "Partido de futsal", "Baja"));
        
        session.setAttribute("agenda", objeto1);
    }
%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSTL - TAREAS</title>
    </head>
    <body style="text-align: center">
        <h1>LISTA DE TAREAS</h1>
        <fieldset style="width:50%; margin: 20px auto 0px auto;" >
            <div style="text-align: left; margin: 10px auto">
                <a href="Controller?op=nuevo">NUEVO</a>
            </div>
            <table border="1" style="margin: 10px auto;">
                <tr>
                    <th>ID</th>
                    <th>TAREA</th>
                    <th>PRIORIDAD</th>
                </tr>
                <c:forEach var="item" items="${sessionScope.agenda.getLista()}">
                    <tr>
                        <td>${item.id}</td>
                        <td style="text-align: left">${item.tarea}</td>
                        <td>${item.prioridad}</td>
                        <td><a href="Controller?op=modificar&id=${item.id}">MODIFICAR</a></td>
                        <td><a href="Controller?op=eliminar&id=${item.id}" onclick='return confirm("¿Estas seguro de eliminar la tarea \"${item.id}\"?")'>ELIMINAR</a></td>
                    </tr>
                </c:forEach>
            </table>
        </fieldset>
    </body>
</html>
