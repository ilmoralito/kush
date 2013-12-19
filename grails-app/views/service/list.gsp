<!doctype html>
<html lang="en">
<head>
	<meta charset="UTF-8">
	<meta name="layout" content="main">
	<title></title>
	<r:require modules="bootstrap, bootstrap-dropdown, app"/>
</head>
<body>
	<div class="row">
		<div class="col-md-12">
			<div class="pull-right">
				<div class="btn-group">
					<button type="button" data-toggle="dropdown" class="btn btn-primary dropdown-toggle">
						<span class="glyphicon glyphicon-filter"></span> <span class="caret"></span>
					</button>
					<ul class="dropdown-menu">
						<li role="presentation" class="dropdown-header">Filtrar por</li>
						<li><g:link>Todos</g:link></li>
						<li class="divider"></li>
					    <li><g:link params="[service:'drink']">Bebida</g:link></li>
					    <li><g:link params="[service:'food']">Comida</g:link></li>
					    <li><g:link params="[service:'cigar']">Cigaro</g:link></li>
					</ul>
				</div>
				<g:link action="create" params="[type:'drink']" class="btn btn-primary">Bebida</g:link>
				<g:link action="create" params="[type:'food']" class="btn btn-primary">Comida</g:link>
				<g:link action="create" params="[type:'cigar']" class="btn btn-primary">Cigaro</g:link>
			</div>
		</div>
	</div>
	<br>
	<g:if test="${services}">
		<table class="table table-hover">
			<thead>
				<tr>
					<th width="1">#</th>
					<th>Nombre del servicio</th>
					<th width="1">Precio</th>
					<th width="1">Estado</th>
				</tr>
			</thead>
			<tbody>
				<g:each in="${services}" var="service" status="i">
					<tr>
						<td>
							<g:link action="show" params="[id:service.id, type:service.class.toString().tokenize('.')[3].toLowerCase(), service:params?.service]">
								${i + 1}
							</g:link>
						</td>
						<td>${service}</td>
						<td>${service.price}</td>
						<td><g:link action="changeStatus" id="${service.id}"><bar:serviceStatus status="${service?.status}"/></g:link></td>
					</tr>
				</g:each>
			</tbody>
		</table>
	</g:if>
	<g:else>
		<strong>...</strong>
	</g:else>
</body>
</html>
