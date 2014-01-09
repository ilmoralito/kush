<!doctype html>
<html lang="en">
<head>
	<meta charset="UTF-8">
	<meta name="layout" content="main">
	<title>Actividad</title>
	<r:require modules="bootstrap, app"/>
</head>
<body>
	<g:render template="activities"/>
	<g:link action="list" params="[number:table.number]" class="btn btn-primary">Regresar</g:link>
</body>
</html>
