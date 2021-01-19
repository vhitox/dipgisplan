<%@ page import="dipgisplan.Actividad" %>



<div class="form-group fieldcontain ${hasErrors(bean: actividadInstance, field: 'horaInicio', 'error')} required">
	<label for="horaInicio">
		<g:message code="actividad.horaInicio.label" default="Hora de Inicio de la Actividad" />
		<span class="required-indicator">*</span>
	</label>
	<g:datePicker name="horaInicio" precision="minute"  value="${actividadInstance?.horaInicio}" relativeYears="[0..0]"  />
</div>

<div class="form-group fieldcontain ${hasErrors(bean: actividadInstance, field: 'horaFin', 'error')} required">
	<label for="horaFin">
		<g:message code="actividad.horaFin.label" default="Hora de Fin de la Actividad" />
		<span class="required-indicator">*</span>
	</label>
	<g:datePicker name="horaFin" precision="minute"  value="${actividadInstance?.horaFin}" relativeYears="[0..0]"/>
</div>

<div class="form-group fieldcontain ${hasErrors(bean: actividadInstance, field: 'descripcion', 'error')} ">
	<label for="descripcion">
		<g:message code="actividad.descripcion.label" default="Descripción de la Actividad" />
		
	</label>
	<g:textArea class="form-control" name="descripcion" cols="40" rows="5" maxlength="5000" value="${actividadInstance?.descripcion}"/>
</div>

<div class="form-group fieldcontain ${hasErrors(bean: actividadInstance, field: 'coordinacion', 'error')} ">
	<label for="coordinacion">
		<g:message code="actividad.coordinacion.label" default="Coordinacion" />
		
	</label>
	<g:textArea class="form-control" name="coordinacion" cols="40" rows="5" maxlength="5000" value="${actividadInstance?.coordinacion}"/>
</div>

<div class="form-group fieldcontain ${hasErrors(bean: actividadInstance, field: 'coordinacion', 'error')} ">
	<label for="resultado">
		<g:message code="actividad.resultado.label" default="Resultado Esperado" />

	</label>
	<g:textArea class="form-control" name="resultado" cols="40" rows="5" maxlength="5000" value="${actividadInstance?.resultado}"/>
</div>

<div class="form-group fieldcontain ${hasErrors(bean: actividadInstance, field: 'coordinacion', 'error')} ">
	<label for="resultadoLogrado">
		<g:message code="actividad.resultadoLogrado.label" default="Resultado Logrado" />

	</label>
	<g:textArea class="form-control" name="resultadoLogrado" cols="40" rows="5" maxlength="5000" value="${actividadInstance?.resultadoLogrado}"/>
</div>

<div class="form-group fieldcontain ${hasErrors(bean: actividadInstance, field: 'observaciones', 'error')} ">
	<label for="observaciones">
		<g:message code="actividad.observaciones.label" default="Observaciones" />
		
	</label>
	<g:textArea class="form-control" name="observaciones" cols="40" rows="5" maxlength="5000" value="${actividadInstance?.observaciones}"/>
</div>

<div class="form-group fieldcontain ${hasErrors(bean: actividadInstance, field: 'tipo', 'error')} ">
	<label for="tipo">
		<g:message code="actividad.tipo.label" default="Tipo" />
		
	</label>
	<g:select name="tipo" from="${actividadInstance.constraints.tipo.inList}" value="${actividadInstance?.tipo}" valueMessagePrefix="actividad.tipo"/>
</div>

<div class="form-group fieldcontain ${hasErrors(bean: actividadInstance, field: 'usuario', 'error')} required">
	%{--<label for="usuario">
		<g:message code="actividad.usuario.label" default="Usuario" />
		<span class="required-indicator">*</span>
	</label>--}%
	<sec:ifAnyGranted roles="ROLE_FUNCIONARIO">
		<g:hiddenField name="usuario.id" id="usuario" value="${usuario?.id}"/>
		%{--<g:select id="usuario" name="usuario.id" from="${dipgisplan.Usuario.list()}" optionKey="id" optionValue="nombreCompleto" required="" value="${usuario?.id}" class="many-to-one" readonly="readonly"/>--}%
	</sec:ifAnyGranted>
	%{--<g:select id="usuario" name="usuario.id" from="${dipgisplan.Usuario.list()}" optionKey="id" required="" value="${actividadInstance?.usuario?.id}" class="many-to-one"/>--}%
</div>

