<!doctype html>
<html lang="en">
<head>
	<meta charset="UTF-8">
	<meta name="layout" content="main">
	<title></title>
	<r:require modules="bootstrap, service"/>
</head>
<body>
	<g:hasErrors bean="${service}">
		<g:renderErrors bean="${service}"/>
	</g:hasErrors>

	<g:form action="create" autocomplete="off">
		<g:render template="form"/>
		<g:submitButton name="send" value="Guardar" class="btn btn-primary"/>
	</g:form>
</body>
</html>
