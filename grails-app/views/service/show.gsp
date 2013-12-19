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

	<g:form action="update" autocomplete="off">
		<g:hiddenField name="id" value="${params?.id}"/>
		<g:render template="form"/>
		<g:submitButton name="send" value="Actualizar" class="btn btn-primary"/>
		<g:link class="btn btn-link" params="[service:(params?.service) ?: '']">Regresar</g:link>
	</g:form>
</body>
</html>
