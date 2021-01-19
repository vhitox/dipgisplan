
<%@ page import="dipgisplan.Actividad" %>
<!doctype html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'actividad.label', default: 'Actividad')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#show-actividad" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="list" action="list"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="show-actividad" class="content scaffold-show" role="main">
			<h1><g:message code="default.show.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<ol class="property-list actividad">
			
				<g:if test="${actividadInstance?.horaInicio}">
				<li class="fieldcontain">
					<span id="horaInicio-label" class="property-label"><g:message code="actividad.horaInicio.label" default="Hora Inicio" /></span>
					
						<span class="property-value" aria-labelledby="horaInicio-label"><g:formatDate date="${actividadInstance?.horaInicio}" /></span>
					
				</li>
				</g:if>
			
				<g:if test="${actividadInstance?.horaFin}">
				<li class="fieldcontain">
					<span id="horaFin-label" class="property-label"><g:message code="actividad.horaFin.label" default="Hora Fin" /></span>
					
						<span class="property-value" aria-labelledby="horaFin-label"><g:formatDate date="${actividadInstance?.horaFin}" /></span>
					
				</li>
				</g:if>
			
				<g:if test="${actividadInstance?.descripcion}">
				<li class="fieldcontain">
					<span id="descripcion-label" class="property-label"><g:message code="actividad.descripcion.label" default="Descripcion" /></span>
					
						<span class="property-value" aria-labelledby="descripcion-label"><g:fieldValue bean="${actividadInstance}" field="descripcion"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${actividadInstance?.coordinacion}">
				<li class="fieldcontain">
					<span id="coordinacion-label" class="property-label"><g:message code="actividad.coordinacion.label" default="Coordinacion" /></span>
					
						<span class="property-value" aria-labelledby="coordinacion-label"><g:fieldValue bean="${actividadInstance}" field="coordinacion"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${actividadInstance?.observaciones}">
				<li class="fieldcontain">
					<span id="observaciones-label" class="property-label"><g:message code="actividad.observaciones.label" default="Observaciones" /></span>
					
						<span class="property-value" aria-labelledby="observaciones-label"><g:fieldValue bean="${actividadInstance}" field="observaciones"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${actividadInstance?.tipo}">
				<li class="fieldcontain">
					<span id="tipo-label" class="property-label"><g:message code="actividad.tipo.label" default="Tipo" /></span>
					
						<span class="property-value" aria-labelledby="tipo-label"><g:fieldValue bean="${actividadInstance}" field="tipo"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${actividadInstance?.usuario}">
				<li class="fieldcontain">
					<span id="usuario-label" class="property-label"><g:message code="actividad.usuario.label" default="Usuario" /></span>
					
						<span class="property-value" aria-labelledby="usuario-label"><g:link controller="usuario" action="show" id="${actividadInstance?.usuario?.id}">${actividadInstance?.usuario?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
			</ol>
			<g:form>
				<fieldset class="buttons">
					<g:hiddenField name="id" value="${actividadInstance?.id}" />
					<g:link class="edit" action="edit" id="${actividadInstance?.id}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
					<g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				</fieldset>
			</g:form>
		</div>
	</body>
</html>
