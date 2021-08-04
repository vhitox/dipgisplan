<!doctype html>
<!--[if lt IE 7 ]> <html lang="en" class="no-js ie6"> <![endif]-->
<!--[if IE 7 ]>    <html lang="en" class="no-js ie7"> <![endif]-->
<!--[if IE 8 ]>    <html lang="en" class="no-js ie8"> <![endif]-->
<!--[if IE 9 ]>    <html lang="en" class="no-js ie9"> <![endif]-->
<!--[if (gt IE 9)|!(IE)]><!--> <html lang="en" class="no-js"><!--<![endif]-->
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
		<title><g:layoutTitle default="Grails"/></title>
		<meta name="viewport" content="width=device-width, initial-scale=1.0">
		<link rel="shortcut icon" href="${resource(dir: 'images', file: 'favicon.ico')}" type="image/x-icon">
		<link rel="apple-touch-icon" href="${resource(dir: 'images', file: 'apple-touch-icon.png')}">
		<link rel="apple-touch-icon" sizes="114x114" href="${resource(dir: 'images', file: 'apple-touch-icon-retina.png')}">
		<link rel="stylesheet" href="${resource(dir: 'css', file: 'xmain.css')}" type="text/css">
		<link rel="stylesheet" href="${resource(dir: 'css', file: 'styles.css')}" type="text/css">
		<link rel="stylesheet" href="${resource(dir: 'css', file: 'mobile.css')}" type="text/css">

		<link href="https://cdn.datatables.net/1.10.20/css/dataTables.bootstrap4.min.css" rel="stylesheet" crossorigin="anonymous" />
		<script src="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.1/js/all.min.js" crossorigin="anonymous"></script>
		<g:layoutHead/>
        <r:layoutResources />
	<style>
		.skip{
			display: none;
		}
		.nav ul{
			margin-top: 20px;
			list-style: none;
		}
		.nav ul li{
			display: inline;
		}
	</style>
	</head>
	<body class="sb-nav-fixed">
	<nav class="sb-topnav navbar navbar-expand navbar-dark bg-dark">
		<a class="navbar-brand" href="index.html">DIPGIS Planificador</a>
		<button class="btn btn-link btn-sm order-1 order-lg-0" id="sidebarToggle" href="#"><i class="fas fa-bars"></i></button>
		<!-- Navbar Search-->
		<sec:ifAnyGranted roles="ROLE_FUNCIONARIO">
			<div class="text-center col-md-8">
				<button class="btn btn-secondary">Fecha de hoy: ${(new Date()).format("dd/MM/yyyy")}</button>
				<g:set var="username" value="${sec.username()}"/>
				<g:set var="usuario" value="${dipgisplan?.Usuario?.findByUsername(username)}"/>

                <g:if test="${!usuario.marcados.empty}">
                    <g:set var="hoy" value="${dipgisplan.Marcado.findAllByUsuario(usuario).last()}"/>
                    <g:if test="${hoy?.entrada?.format("dd/MM/yyyy") == (new Date()).format("dd/MM/yyyy")}">
                        <button class="btn btn-dark">Hora de Entrada: ${hoy?.entrada?.format("HH:mm")}</button>
                        <g:if test="${!hoy?.salida}">
                            <g:link class="btn btn-success" controller="marcado" action="marcarSalida" id="${hoy?.id}">Marcar Salida</g:link>
                        </g:if><g:else>
                        <button class="btn btn-dark">Hora de Salida: ${hoy?.salida?.format("HH:mm")}</button>
                    </g:else>

                    </g:if><g:else>
					<g:form controller="marcado" action="marcarEntrada" style="display: inline-block;" useToken="true" name="uno">
						<g:hiddenField name="user" value="${usuario.username}"/>
						<g:submitButton class="btn btn-success" name="enviar" value="Marcar Inicio"/>
					</g:form>
                </g:else>
                </g:if>
                <g:else>
					<g:form controller="marcado" action="marcarEntrada" style="display: inline-block;" useToken="true" name="dos">
						<g:hiddenField name="user" value="${usuario.username}"/>
						<g:submitButton class="btn btn-success" name="enviar" value="Marcar Inicio"/>
					</g:form>
                </g:else>

			</div>
		</sec:ifAnyGranted>
		<form class="d-none d-md-inline-block form-inline ml-auto mr-0 mr-md-3 my-2 my-md-0">
			<div class="input-group">
				<input class="form-control" type="text" placeholder="Search for..." aria-label="Search" aria-describedby="basic-addon2" />
				<div class="input-group-append">
					<button class="btn btn-primary" type="button"><i class="fas fa-search"></i></button>
				</div>
			</div>
		</form>
		<!-- Navbar-->
		<ul class="navbar-nav ml-auto ml-md-0">
			<li class="nav-item dropdown">
				<a class="nav-link dropdown-toggle" id="userDropdown" href="#" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false"><i class="fas fa-user fa-fw"></i></a>
				<div class="dropdown-menu dropdown-menu-right" aria-labelledby="userDropdown">
					%{--<a class="dropdown-item" href="#">Settings</a>
					<a class="dropdown-item" href="#">Activity Log</a>
					<div class="dropdown-divider"></div>--}%
					<g:link class="dropdown-item" controller="logout" action="index">Logout</g:link>
				</div>
			</li>
		</ul>
	</nav>
	<div id="layoutSidenav">
		<div id="layoutSidenav_nav">
			<nav class="sb-sidenav accordion sb-sidenav-dark" id="sidenavAccordion">
				<div class="sb-sidenav-menu">
					<div class="nav">
						<div class="sb-sidenav-menu-heading">Noticias</div>
						<g:link class="nav-link" controller="usuario" action="home">
							<div class="sb-nav-link-icon"><i class="fas fa-tachometer-alt"></i></div>
							Dashboard
						</g:link>
						<sec:ifAnyGranted roles="ROLE_ADMIN">
							<div class="sb-sidenav-menu-heading">Administración</div>
							<a class="nav-link collapsed" href="#" data-toggle="collapse" data-target="#collapseLayoutsUser" aria-expanded="false" aria-controls="collapseLayouts">
								<div class="sb-nav-link-icon"><i class="fas fa-columns"></i></div>
								Usuarios
								<div class="sb-sidenav-collapse-arrow"><i class="fas fa-angle-down"></i></div>
							</a>
							<div class="collapse" id="collapseLayoutsUser" aria-labelledby="headingOne" data-parent="#sidenavAccordion">
								<nav class="sb-sidenav-menu-nested nav">
									<g:link class="nav-link" controller="usuario" action="create">Crear Usuario</g:link>
									<g:link class="nav-link" controller="usuario" action="list">Listar Usuarios</g:link>
								</nav>
							</div>
							<a class="nav-link" href="tables.html">
								<div class="sb-nav-link-icon"><i class="fas fa-table"></i></div>
								Areas
							</a>
						</sec:ifAnyGranted>
						<sec:ifAnyGranted roles="ROLE_ADMIN, ROLE_JEFE">
							<div class="sb-sidenav-menu-heading">Areas</div>
							<g:each in="${dipgisplan.Area.list()}" var="area">
								<a class="nav-link collapsed" href="#" data-toggle="collapse" data-target="#collapseLayouts${area.id}" aria-expanded="false" aria-controls="collapseLayouts">
									<div class="sb-nav-link-icon"><i class="fas fa-columns"></i></div>
									${area.nombre}
									<div class="sb-sidenav-collapse-arrow"><i class="fas fa-angle-down"></i></div>
								</a>
								<div class="collapse" id="collapseLayouts${area.id}" aria-labelledby="headingOne" data-parent="#sidenavAccordion">
									<nav class="sb-sidenav-menu-nested nav">
										<g:each in="${area.usuarios}" var="personal">
											<g:link class="nav-link" controller="actividad" action="suActividad" id="${personal.id}">${personal.nombreCompleto}</g:link>
										</g:each>
									</nav>
								</div>
							</g:each>
                            <div class="sb-sidenav-menu-heading">Reportes</div>
                            <g:link class="nav-link" controller="marcado" action="historialMarcado">
                                <div class="sb-nav-link-icon"><i class="fas fa-tachometer-alt"></i></div>
                                Marcados
                            </g:link>
						</sec:ifAnyGranted>
						<sec:ifAnyGranted roles="ROLE_FUNCIONARIO">
							%{--<g:set var="usernameis" value="${sec.username()}"/>
							<g:set var="user" value="${dipgisplan.Usuario.findByUsername(usernameis)}"/>
							<div class="sb-sidenav-menu-heading">Areas</div>
							<a class="nav-link collapsed" href="#" data-toggle="collapse" data-target="#collapseLayoutsAreaU" aria-expanded="false" aria-controls="collapseLayouts">
								<div class="sb-nav-link-icon"><i class="fas fa-columns"></i></div>
								${user.area.nombre}
								<div class="sb-sidenav-collapse-arrow"><i class="fas fa-angle-down"></i></div>
							</a>--}%
							<div class="sb-sidenav-menu-heading">Actividades</div>
							<g:link class="nav-link" controller="actividad" action="misActividades">Mis actividades</g:link>
							<g:link class="nav-link" controller="actividad" action="historial">Historial</g:link>
						</sec:ifAnyGranted>

						%{--<div class="sb-sidenav-menu-heading">Addons</div>
						<a class="nav-link" href="charts.html">
							<div class="sb-nav-link-icon"><i class="fas fa-chart-area"></i></div>
							Charts
						</a>
						<a class="nav-link" href="tables.html">
							<div class="sb-nav-link-icon"><i class="fas fa-table"></i></div>
							Tables
						</a>--}%
					</div>
				</div>
				<div class="sb-sidenav-footer">
					<div class="small">Logged in as:</div>
					<sec:username/>
				</div>
			</nav>
		</div>
		<div id="layoutSidenav_content">
			<main>
				<div class="container-fluid">
					<g:layoutBody/>
				</div>
			</main>
			<footer class="py-4 bg-light mt-auto">
				<div class="container-fluid">
					<div class="d-flex align-items-center justify-content-between small">
						<div class="text-muted">Copyright &copy; Dipgis - Teletrabajo ${new Date().format("yyyy")}</div>
						<div>
							<a href="#">Privacy Policy</a>
							&middot;
							<a href="#">Terms &amp; Conditions</a>
						</div>
					</div>
				</div>
			</footer>
		</div>
	</div>
	<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js" crossorigin="anonymous"></script>
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/js/bootstrap.bundle.min.js" crossorigin="anonymous"></script>
	<script src="${resource(dir: 'js', file: 'scripts.js')}"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.8.0/Chart.min.js" crossorigin="anonymous"></script>
	<script src="assets/demo/chart-area-demo.js"></script>
	<script src="assets/demo/chart-bar-demo.js"></script>
	<script src="https://cdn.datatables.net/1.10.20/js/jquery.dataTables.min.js" crossorigin="anonymous"></script>
	<script src="https://cdn.datatables.net/1.10.20/js/dataTables.bootstrap4.min.js" crossorigin="anonymous"></script>
	<script src="assets/demo/datatables-demo.js"></script>
	</body>
</html>