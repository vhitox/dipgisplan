<%--
  Created by IntelliJ IDEA.
  User: Vic
  Date: 1/13/2021
  Time: 3:38 PM
--%>

<%@ page import="dipgisplan.Actividad" %>
<!doctype html>
<html>
<head>
    <meta name="layout" content="mainaccess">
    <g:set var="entityName" value="${message(code: 'actividad.label', default: 'Actividad')}" />
    <title><g:message code="default.list.label" args="[entityName]" /></title>
</head>
<body>
<a href="#list-actividad" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>

<div id="list-actividad" class="content scaffold-list" role="main" style="margin-top: 20px;">
    <h1>Actividades de ${usuario.nombreCompleto}</h1>
    <g:if test="${flash.message}">
        <div class="message" role="status">${flash.message}</div>
    </g:if>
    <table class="table table-striped">
        <thead>
        <tr>
            <th>Fecha</th>
            <th>Inicio de la Actividad</th>
            <th>Fin de la Actividad</th>
            <th>Descripción de la Actividad</th>
            <th>Coordinación</th>
            <th>Resultado Esperado</th>
            <th>Resultado Logrado</th>
            <th>Observaciones</th>
            <th>Tipo de Actividad</th>
        </tr>
        </thead>
        <tbody>
        <g:each in="${actividadInstanceList.sort {it.horaInicio}}" status="i" var="actividadInstance">
            <tr class="${(i % 2) == 0 ? 'even' : 'odd'}">

                <td>${actividadInstance?.horaInicio?.format("dd/MM/yyyy")}</td>

                <td>${actividadInstance?.horaInicio?.format("HH:mm")}</td>

                <td>${actividadInstance?.horaFin?.format("HH:mm")}</td>

                <td>${fieldValue(bean: actividadInstance, field: "descripcion")}</td>

                <td>${fieldValue(bean: actividadInstance, field: "coordinacion")}</td>

                <td>${actividadInstance?.resultado}</td>

                <td>${actividadInstance?.resultadoLogrado}</td>

                <td>${fieldValue(bean: actividadInstance, field: "observaciones")}</td>

                <td>${fieldValue(bean: actividadInstance, field: "tipo")}</td>

            </tr>
        </g:each>
        </tbody>
    </table>
    %{--<div class="pagination">
        <g:paginate total="${actividadInstanceTotal}" />
    </div>--}%
</div>
</body>
</html>