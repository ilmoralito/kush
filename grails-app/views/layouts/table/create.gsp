<!doctype html>
<html lang="en">
<head>
	<meta charset="UTF-8">
	<title><g:layoutTitle default="Crear"/></title>
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<r:layoutResources/>
</head>
<body>
	<g:render template="/layouts/navbar"/>

	<div class="container">
		<div class="row">
			<div class="col-md-12">
				<div class="btn-group pull-right">
					<g:link action="list" params="[number:params?.number]"><span class="glyphicon glyphicon-th-list"></span></g:link>
				</div>
			</div>
		</div>
		<br>
		<div class="row">
			<div class="col-md-8">
				<g:layoutBody/>
				<g:if test="${flash?.message}">
					<h4>${flash?.message}</h4>
				</g:if>
			</div>
			<div class="col-md-4">
				<ul class="nav nav-tabs">
				  	<li class="${(params.type == 'drink' || !params.type) ? "active" : ''}">
				  		<g:link controller="table" action="create" params="[number:params?.number, type:'drink']">Bebida</g:link>
				  	</li>
					<li class="${(params.type == 'cigar') ? "active" : ''}">
						<g:link controller="table" action="create" params="[number:params?.number, type:'cigar']">Cigaro</g:link>
					</li>
					<li class="${(params.type == 'food') ? "active" : ''}">
						<g:link controller="table" action="create" params="[number:params?.number, type:'food']">Comida</g:link>
					</li>
					<li class="${(params.type == 'localDrink') ? "active" : ''}">
						<g:link controller="table" action="create" params="[number:params?.number, type:'localDrink']">Bebida local</g:link>
					</li>
				</ul>

				<br>

				<g:if test="${services}">
					<g:form action="create" autocomplete="off">
						<g:hiddenField name="type" value="${params?.type}"/>
						<g:hiddenField name="number" value="${params?.number}"/>

						<g:if test="${mergedTables}">
							<div class="form-group">
								<label for="flag">Mezas</label>
								<g:select from="${mergedTables}" name="flag" class="form-control" noSelection="['':'-Meza actual-']"/>
							</div>
						</g:if>

						<div class="form-group">
							<label for="service">Servicio</label>
							<g:select from="${services}" optionKey="id" name="service" class="form-control"/>
						</div>

						<div class="form-group">
							<label for="amount">Cantidad</label>
							<g:textField name="amount" class="form-control"/>
						</div>

						<button type="submit" class="btn btn-primary pull-right">Agregar</button>
					</g:form>
				</g:if>
				<g:else>
					<g:link controller="service" class="btn btn-primary">Habilitar o crear servicio</g:link>
				</g:else>

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
	</div>
	<r:layoutResources/>
</body>
</html>
