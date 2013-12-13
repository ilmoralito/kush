<!doctype html>
<html lang="en">
<head>
	<meta charset="UTF-8">
	<meta name="layout" content="main">
	<title></title>
	<r:require modules="bootstrap, app"/>
</head>
<body>
	<g:hasErrors bean="${drink ?: food}">
		<g:renderErrors bean="${drink ?: food}"/>
	</g:hasErrors>

	<g:form action="update">
		<g:hiddenField name="id" value="${params?.id}"/>
		<g:render template="form"/>
		<g:submitButton name="send" value="Actualizar" class="btn btn-primary"/>
	</g:form>
</body>
</html>