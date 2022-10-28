<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSTL - TAREAS</title>
    </head>
    <body style="text-align: center">
        <h1>
            <c:if test="${requestScope.op == 'nuevo'}" var="res" scope="request">
                REGISTRO DE
            </c:if>
            <c:if test="${requestScope.op == 'modificar'}" var="res" scope="request">
                MODIFICAR
            </c:if>
                TAREA
        </h1>
        <jsp:useBean id="miTarea" scope="request" class="com.emergentes.modelo.Tarea" />
        <fieldset style="width:50%; margin: 20px auto 0px auto;" >
            <form action="Controller" method="post">
                <table style="margin: 10px auto; text-align: left">
                    <tr>
                        <td>Id:</td>
                        <td><input type="text" name="id" value="<jsp:getProperty name="miTarea" property="id"/>" size="2"/></td>
                    </tr>
                    <tr>
                        <td>Tarea:</td>
                        <td><input type="text" name="tarea"
                                <c:if test="${ miTarea.tarea == null}" var="res" scope="request">
                                    <jsp:setProperty name="miTarea" property="tarea" value= "" />
                                </c:if>
                                value="<jsp:getProperty name="miTarea" property="tarea"/>" size="20"/></td>
                    </tr>
                    <tr>
                        <td>Prioridad:</td>
                        <td>
                            <select name="prioridad">
                                <option disabled selected>--- Seleccione prioridad ---</option>
                                <option value="Alta"
                                    <c:if test="${miTarea.prioridad == 'Alta'}" var="res" scope="request">
                                        selected
                                    </c:if>
                                        >Alta
                                </option>
                                <option value="Media"
                                    <c:if test="${miTarea.prioridad == 'Media'}" var="res" scope="request">
                                        selected
                                    </c:if>
                                        >Media
                                </option>
                                <option value="Baja"
                                    <c:if test="${miTarea.prioridad == 'Baja'}" var="res" scope="request">
                                        selected
                                    </c:if>
                                        >Baja
                                </option>
                            </select>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <input type="hidden" name="opg" value="${requestScope.op}"/>
                            <input type="hidden" name="op" value="grabar"/>
                        </td>
                        <td style="text-align: right; padding-top: 10px;"><input type="submit" value="ENVIAR" /></td>
                    </tr>
                    <tr>
                        <td>
                            <a href="index.jsp">VOLVER</a>
                    </tr>
                </table>
            </form>
        </fieldset>
    </body>
</html>
