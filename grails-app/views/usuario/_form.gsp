<%@ page import="dipgisplan.Usuario" %>



<div class="form-group fieldcontain ${hasErrors(bean: usuarioInstance, field: 'username', 'error')} required">
	<label for="username" class="form-label">
		<g:message code="usuario.username.label" default="Username" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField class="form-control" name="username" required="" value="${usuarioInstance?.username}"/>
</div>

<div class="form-group fieldcontain ${hasErrors(bean: usuarioInstance, field: 'password', 'error')} required">
	<label for="password" class="form-label">
		<g:message code="usuario.password.label" default="Password" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField class="form-control" name="password" required="" value="${usuarioInstance?.password}"/>
</div>

<div class="form-group fieldcontain ${hasErrors(bean: usuarioInstance, field: 'nombreCompleto', 'error')} ">
	<label for="nombreCompleto">
		<g:message code="usuario.nombreCompleto.label" default="Nombre Completo" />
		
	</label>
	<g:textArea class="form-control" name="nombreCompleto" cols="40" rows="5" maxlength="500" value="${usuarioInstance?.nombreCompleto}"/>
</div>

<div class="form-group fieldcontain ${hasErrors(bean: usuarioInstance, field: 'area', 'error')} ">
	<label for="area">
		<g:message code="usuario.area.label" default="Area" />
		
	</label>
	<g:select id="area" name="area.id" from="${dipgisplan.Area.list()}" optionKey="id" optionValue="nombre" value="${usuarioInstance?.area?.id}" class="many-to-one form-select" noSelection="['null': '']" required="required"/>
</div>

<div class="form-group fieldcontain ${hasErrors(bean: usuarioInstance, field: 'foto', 'error')} ">
	<label for="foto">
		<g:message code="usuario.foto.label" default="Foto" />
		
	</label>
	<input type="file" id="foto" name="foto" />
</div>

<div class="form-group fieldcontain ${hasErrors(bean: usuarioInstance, field: 'accountExpired', 'error')} ">
	<label for="accountExpired">
		<g:message code="usuario.accountExpired.label" default="Account Expired" />
		
	</label>
	<g:checkBox name="accountExpired" value="${usuarioInstance?.accountExpired}" />
</div>

<div class="form-group fieldcontain ${hasErrors(bean: usuarioInstance, field: 'accountLocked', 'error')} ">
	<label for="accountLocked">
		<g:message code="usuario.accountLocked.label" default="Account Locked" />
		
	</label>
	<g:checkBox name="accountLocked" value="${usuarioInstance?.accountLocked}" />
</div>

%{--<div class="fieldcontain ${hasErrors(bean: usuarioInstance, field: 'actividades', 'error')} ">
	<label for="actividades">
		<g:message code="usuario.actividades.label" default="Actividades" />
		
	</label>
	
<ul class="one-to-many">
<g:each in="${usuarioInstance?.actividades?}" var="a">
    <li><g:link controller="actividad" action="show" id="${a.id}">${a?.encodeAsHTML()}</g:link></li>
</g:each>
<li class="add">
<g:link controller="actividad" action="create" params="['usuario.id': usuarioInstance?.id]">${message(code: 'default.add.label', args: [message(code: 'actividad.label', default: 'Actividad')])}</g:link>
</li>
</ul>--}%

</div>

<div class="form-group fieldcontain ${hasErrors(bean: usuarioInstance, field: 'enabled', 'error')} ">
	<label for="enabled">
		<g:message code="usuario.enabled.label" default="Enabled" />
		
	</label>
	<g:checkBox name="enabled" value="${usuarioInstance?.enabled}" />
</div>

<div class="form-group fieldcontain ${hasErrors(bean: usuarioInstance, field: 'passwordExpired', 'error')} ">
	<label for="passwordExpired">
		<g:message code="usuario.passwordExpired.label" default="Password Expired" />
		
	</label>
	<g:checkBox name="passwordExpired" value="${usuarioInstance?.passwordExpired}" />
</div>

<div class="form-group fieldcontain ${hasErrors(bean: usuarioInstance, field: 'area', 'error')} ">
	<label for="area">
		<g:message code="usuario.rol.label" default="Rol de Usuario" />

	</label>
	<g:select id="rol" name="rol" from="${dipgisplan.Rol.list()}" optionKey="id" optionValue="authority" value=""/>
</div>

