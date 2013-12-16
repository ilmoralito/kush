<!doctype html>
<html lang="en">
<head>
	<meta charset="UTF-8">
	<meta name="layout" content="main">
	<title>Actividad</title>
	<r:require modules="bootstrap, app"/>
</head>
<body>
	<div class="row">
		<div class="col-md-12">
			<g:link action="list" params="[number:params?.number]" class="pull-right">
				<span class="glyphicon glyphicon-th-list"></span>
			</g:link>
		</div>
	</div>

	<div class="row">
		<div class="col-md-8">
			<g:render template="activities"/>
		</div>
		<div class="col-md-4">
			<ul class="nav nav-tabs">
			  	<li class="${(params.type == 'drink' || !params.type) ? "active" : ''}">
			  		<g:link controller="table" action="create" params="[number:params?.number, type:'drink']">Bebida</g:link>
			  	</li>
				<li class="${(params.type == 'food') ? "active" : ''}">
					<g:link controller="table" action="create" params="[number:params?.number, type:'food']">Comida</g:link>
				</li>
				<li class="${(params.type == 'cigar') ? "active" : ''}">
					<g:link controller="table" action="create" params="[number:params?.number, type:'cigar']">Cigaro</g:link>
				</li>
			</ul>

			<br>

			<g:form action="create">
				<g:hiddenField name="type" value="${params?.type}"/>
				<g:hiddenField name="number" value="${params?.number}"/>

				<div class="form-group">
					<label for="service">Servicio</label>
					<g:select from="${services}" optionKey="id" name="service" class="form-control" autofocus="true"/>
				</div>
				<div class="form-group">
					<label for="amount">Cantidad</label>
					<g:textField name="amount" class="form-control"/>
				</div>

				<button type="submit" class="btn btn-primary pull-right">Agregar</button>
			</g:form>

			<g:if test="${table?.activities}">
				<br><br>
				<g:link action="charge" params="[number:params?.number]" class="btn btn-warning btn-block btn-lg">Cobrar</g:link>
			</g:if>

			<div class="row">
				<div class="col-md-12">
					<br>
					<g:hasErrors bean="${activity}">
						<small><g:renderErrors bean="${activity}"/></small>
					</g:hasErrors>
				</div>
			</div>
		</div>
	</div>
</body>
</html>
