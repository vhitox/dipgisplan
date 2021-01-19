
<%@ page import="dipgisplan.Usuario" %>
<!doctype html>
<html>
	<head>
		<meta name="layout" content="mainaccess">
		<g:set var="entityName" value="${message(code: 'usuario.label', default: 'Usuario')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#list-usuario" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="list-usuario" class="content scaffold-list" role="main">
			<h1><g:message code="default.list.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<table class="table">
				<thead>
					<tr>
					
						<g:sortableColumn property="username" title="${message(code: 'usuario.username.label', default: 'Username')}" />
					
						<g:sortableColumn property="nombreCompleto" title="${message(code: 'usuario.nombreCompleto.label', default: 'Nombre Completo')}" />
					
						<th><g:message code="usuario.area.label" default="Area" /></th>
					
						<g:sortableColumn property="foto" title="${message(code: 'usuario.foto.label', default: 'Foto')}" />
					
						<th>Rol(es)</th>

						%{--<th>Opciones</th>--}%
					
					</tr>
				</thead>
				<tbody>
				<g:each in="${usuarioInstanceList}" status="i" var="usuarioInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					
						<td><g:link action="show" id="${usuarioInstance.id}">${fieldValue(bean: usuarioInstance, field: "username")}</g:link></td>
					
						<td>${fieldValue(bean: usuarioInstance, field: "nombreCompleto")}</td>
					
						<td>${usuarioInstance?.area?.nombre}</td>
					
						<td>${fieldValue(bean: usuarioInstance, field: "foto")}</td>
					
						<td>
							<g:each in="${dipgisplan.UsuarioRol.findByUsuario(usuarioInstance)}" var="rol">
								${rol.rol.authority}
							</g:each>
						</td>

						%{--<td>
							<button class="btn btn-secondary" data-bs-toggle="modal" data-bs-target="#exampleModal">Add Rol</button>
							<div class="modal fade" id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
								<div class="modal-dialog">
									<div class="modal-content">
										<div class="modal-header">
											<h5 class="modal-title" id="exampleModalLabel">New message</h5>
											<button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
										</div>
										<div class="modal-body">
											<form>
												<div class="mb-3">
													<label for="recipient-name" class="col-form-label">Recipient:</label>
													<input type="text" class="form-control" id="recipient-name">
												</div>
												<div class="mb-3">
													<label for="message-text" class="col-form-label">Message:</label>
													<textarea class="form-control" id="message-text"></textarea>
												</div>
											</form>
										</div>
										<div class="modal-footer">
											<button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
											<button type="button" class="btn btn-primary">Send message</button>
										</div>
									</div>
								</div>
							</div>
						</td>--}%
					
					</tr>
				</g:each>
				</tbody>
			</table>
			<div class="pagination">
				<g:paginate total="${usuarioInstanceTotal}" />
			</div>
		</div>
	</body>
</html>
