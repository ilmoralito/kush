<!doctype html>
<html lang="en">
<head>
	<meta charset="UTF-8">
	<meta name="layout" content="main">
	<title></title>
	<r:require modules="bootstrap, app"/>
</head>
<body>

	<div class="row">
		<div class="col-md-12">
			<div class="btn-group pull-right">
				<g:link action="create" params="[type:'food']" class="btn btn-primary">Crear comida</g:link>
				<g:link action="create" params="[type:'drink']" class="btn btn-primary">Crear bebida</g:link>
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
				</tr>
			</thead>
			<tbody>
				<g:each in="${services}" var="service" status="i">
					<tr>
						<td><g:link action="show" id="${service.id}">${i + 1}</g:link></td>
						<td>
							${service}
							<g:if test="${service instanceof ni.com.bar.Drink}">
								<strong>${service.brand}</strong>
							</g:if>
						</td>
						<td>${service.price}</td>
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
