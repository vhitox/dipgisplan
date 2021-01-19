<%--
  Created by IntelliJ IDEA.
  User: Vic
  Date: 1/19/2021
  Time: 10:06 AM
--%>

<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
    <meta name="layout" content="mainaccess">
    <title></title>
</head>

<body>
<h1 style="margin-top: 20px;">Historial de Actividades: ${usuario.nombreCompleto}</h1>
<div id="accordion">
    <g:set var="c" value="${1}"/>
    <g:each in="${fechas}" var="fecha">
        <div class="card">
            <div class="card-header" id="headingOne${c}">
                <h5 class="mb-0">
                    <button class="btn btn-link" data-toggle="collapse" data-target="#collapse${c}" aria-expanded="true" aria-controls="collapse${fecha.key}">
                        ${fecha.key}
                    </button>
                </h5>
            </div>

            <div id="collapse${c}" class="collapse" aria-labelledby="headingOne" data-parent="#accordion">
                <div class="card-body">
                    <g:if test="${!fecha.value.empty}">
                        <table class="table">
                            <thead>
                            <tr>
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
                            <g:each in="${fecha.value}" status="i" var="actividadInstance">
                                <tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
                                    <td>${actividadInstance.horaInicio.format("HH:mm")}</td>
                                    <td>${actividadInstance.horaFin.format("HH:mm")}</td>
                                    <td>${fieldValue(bean: actividadInstance, field: "descripcion")}</td>
                                    <td>${fieldValue(bean: actividadInstance, field: "coordinacion")}</td>
                                    <td>${actividadInstance.resultado}</td>
                                    <td>${actividadInstance.resultadoLogrado}</td>
                                    <td>${fieldValue(bean: actividadInstance, field: "observaciones")}</td>
                                    <td>${fieldValue(bean: actividadInstance, field: "tipo")}</td>
                                </tr>
                            </g:each>
                            </tbody>
                        </table>
                    </g:if>
                </div>
            </div>
        </div>
        <g:set var="c" value="${c+1}"/>
    </g:each>
</div>
<script>
    $('.collapse').collapse()
</script>
</body>
</html>