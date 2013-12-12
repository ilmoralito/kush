<!doctype html>
<html lang="en">
<head>
	<meta charset="UTF-8">
	<title></title>
	<r:require modules="bootstrap, app"/>
</head>
<body>
	<form action='${postUrl}' method='POST' autocomplete='off'>
		<div class="form-group">
			<label for='username' class="sr-only"><g:message code="springSecurity.login.username.label"/>:</label>
			<input type='text' class='form-control' name='j_username' id='username' placeholder="Nombre de usuario" autofocus="true"/>
		</div>
			
		<div class="form-group">
			<label for='password' class="sr-only"><g:message code="springSecurity.login.password.label"/>:</label>
			<input type='password' class='form-control' name='j_password' id='password' placeholder="Clave"/>
		</div>

		<input type='submit' id="submit" value='${message(code: "springSecurity.login.button")}' class="btn btn-primary"/>
	</form>
</body>
</html>