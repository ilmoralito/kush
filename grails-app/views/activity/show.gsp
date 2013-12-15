<!doctype html>
<html lang="en">
<head>
	<meta charset="UTF-8">
	<meta name="layout" content="distraction-free-mode">
	<title>${activity}</title>
	<r:require modules="bootstrap, app"/>
</head>
<body>
	<g:set var="number" value="${activity?.table?.number}"/>

	<div class="row">
		<div class="col-md-12">
			<g:link action="delete" params="[id:activity.id, number:number]" class="pull-right">
				<span class="glyphicon glyphicon-trash"></span>
			</g:link>
		</div>
	</div>

	<g:form action="update">
		<g:hiddenField name="id" value="${activity.id}"/>
		<g:hiddenField name="number" value="${number}"/>
		<div class="form-group">
			<label for="service">Servicio</label>
			<g:select from="${activity.service.class.list()}" name="name" value="${activity.service}" class="form-control"/>
		</div>
		<div class="form-group">
			<label for="amount">Servicio</label>
			<g:textField name="amount" value="${activity.amount}" class="form-control"/>
		</div>
		<button type="submit" class="btn btn-primary">Actualizar</button>
		<g:link controller="table" action="create" params="[number:number]" class="btn btn-default pull-right">Regresar</g:link>
	</g:form>

	<g:hasErrors bean="${activity}">
		<p><small><g:renderErrors bean="${activity}"/></small></p>
	</g:hasErrors>
</body>
</html>
