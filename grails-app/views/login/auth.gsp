<html>
<head>
	<meta name='layout' content='main'/>
	<title><g:message code="springSecurity.login.title"/></title>
	<style type='text/css' media='screen'>
	#login {
		margin: 15px 0px;
		padding: 0px;
		xtext-align: center;
	}

	#login .inner {
		width: 340px;
		padding-bottom: 6px;
		margin: 60px auto;
		text-align: left;
		border: 1px solid #aab;
		background-color: #f0f0fa;
		-moz-box-shadow: 2px 2px 2px #eee;
		-webkit-box-shadow: 2px 2px 2px #eee;
		-khtml-box-shadow: 2px 2px 2px #eee;
		box-shadow: 2px 2px 2px #eee;
	}

	#login .inner .fheader {
		padding: 18px 26px 14px 26px;
		background-color: #f7f7ff;
		margin: 0px 0 14px 0;
		color: #2e3741;
		font-size: 18px;
		font-weight: bold;
	}

	#login .inner .cssform p {
		clear: left;
		margin: 0;
		padding: 4px 0 3px 0;
		padding-left: 105px;
		margin-bottom: 20px;
		height: 1%;
	}

	#login .inner .cssform input[type='text'] {
		width: 120px;
	}

	#login .inner .cssform label {
		font-weight: bold;
		float: left;
		text-align: right;
		margin-left: -105px;
		width: 110px;
		padding-top: 3px;
		padding-right: 10px;
	}

	#login #remember_me_holder {
		padding-left: 120px;
	}

	#login #submit {
		margin-left: 15px;
	}

	#login #remember_me_holder label {
		float: none;
		margin-left: 0;
		text-align: left;
		width: 200px
	}

	#login .inner .login_message {
		padding: 6px 25px 20px 25px;
		color: #c33;
	}

	#login .inner .text_ {
		width: 120px;
	}

	#login .inner .chk {
		height: 12px;
	}
	</style>
</head>

<body>
<div class="col-lg-5">
	<div class="card shadow-lg border-0 rounded-lg mt-5">
		<div class="card-header text-center"><img src="${createLinkTo(dir: 'images', file: 'logodipgis.png')}" style="width: 60px;"/><h3 class="text-center font-weight-light my-4">Login DIPGIS Control</h3></div>
		<div class="card-body">
			<form action='${postUrl}' method='POST' id='loginForm' class='cssform' autocomplete='off'>
				<div class="form-group">
					<label for='username' class="form-label"><g:message code="springSecurity.login.username.label"/>:</label>
					<input type='text' class='text_ form-control' name='j_username' id='username'/>
				</div>
				<div class="form-group">
					<label for='password' class="form-label"><g:message code="springSecurity.login.password.label"/>:</label>
					<input type='password' class='text_ form-control' name='j_password' id='password'/>
				</div>
				<div class="form-group">
					<div class="custom-control custom-checkbox">
						<input type='checkbox' class='chk' name='${rememberMeParameter}' id='remember_me' <g:if test='${hasCookie}'>checked='checked'</g:if>/>
						<label for='remember_me'><g:message code="springSecurity.login.remember.me.label"/></label>
					</div>
				</div>
				<div class="form-group d-flex align-items-center justify-content-between mt-4 mb-0">
					<a class="small" href="password.html">Forgot Password?</a>
					<input type='submit' id="submit" value='${message(code: "springSecurity.login.button")}'/>
				</div>
			</form>
		</div>
		<div class="card-footer text-center">
			%{--<div class="small"><a href="register.html">Need an account? Sign up!</a></div>--}%
		</div>
	</div>
</div>

%{--<div id='login'>
	<div class='container-xl'>
		<div class='fheader'><g:message code="springSecurity.login.header"/></div>

		<g:if test='${flash.message}'>
			<div class='login_message'>${flash.message}</div>
		</g:if>
		<div class="col-sm-12">
			<form action='${postUrl}' method='POST' id='loginForm' class='cssform' autocomplete='off'>
				<div class="mb-3">
					<label for='username' class="form-label"><g:message code="springSecurity.login.username.label"/>:</label>
					<input type='text' class='text_ form-control' name='j_username' id='username'/>
				</div>

				<div class="mb-3">
					<label for='password' class="form-label"><g:message code="springSecurity.login.password.label"/>:</label>
					<input type='password' class='text_ form-control' name='j_password' id='password'/>
				</div>

				<p id="remember_me_holder">
					<input type='checkbox' class='chk' name='${rememberMeParameter}' id='remember_me' <g:if test='${hasCookie}'>checked='checked'</g:if>/>
					<label for='remember_me'><g:message code="springSecurity.login.remember.me.label"/></label>
				</p>

				<p>
					<input type='submit' id="submit" value='${message(code: "springSecurity.login.button")}'/>
				</p>
			</form>
		</div>

	</div>
</div>--}%
<script type='text/javascript'>
	<!--
	(function() {
		document.forms['loginForm'].elements['j_username'].focus();
	})();
	// -->
</script>
</body>
</html>
