
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
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="list-actividad" class="content scaffold-list" role="main">
			<h1><g:message code="default.list.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<table>
				<thead>
					<tr>
					
						<g:sortableColumn property="horaInicio" title="${message(code: 'actividad.horaInicio.label', default: 'Hora Inicio')}" />
					
						<g:sortableColumn property="horaFin" title="${message(code: 'actividad.horaFin.label', default: 'Hora Fin')}" />
					
						<g:sortableColumn property="descripcion" title="${message(code: 'actividad.descripcion.label', default: 'Descripcion')}" />
					
						<g:sortableColumn property="coordinacion" title="${message(code: 'actividad.coordinacion.label', default: 'Coordinacion')}" />
					
						<g:sortableColumn property="observaciones" title="${message(code: 'actividad.observaciones.label', default: 'Observaciones')}" />
					
						<g:sortableColumn property="tipo" title="${message(code: 'actividad.tipo.label', default: 'Tipo')}" />
					
					</tr>
				</thead>
				<tbody>
				<g:each in="${actividadInstanceList}" status="i" var="actividadInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					
						<td><g:link action="show" id="${actividadInstance.id}">${fieldValue(bean: actividadInstance, field: "horaInicio")}</g:link></td>
					
						<td><g:formatDate date="${actividadInstance.horaFin}" /></td>
					
						<td>${fieldValue(bean: actividadInstance, field: "descripcion")}</td>
					
						<td>${fieldValue(bean: actividadInstance, field: "coordinacion")}</td>
					
						<td>${fieldValue(bean: actividadInstance, field: "observaciones")}</td>
					
						<td>${fieldValue(bean: actividadInstance, field: "tipo")}</td>
					
					</tr>
				</g:each>
				</tbody>
			</table>
			<div class="pagination">
				<g:paginate total="${actividadInstanceTotal}" />
			</div>
		</div>
	</body>
</html>
