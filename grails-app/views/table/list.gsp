<!doctype html>
<html lang="en">
<head>
	<meta charset="UTF-8">
	<meta name="layout" content="main">
	<g:set var="number" value="${params?.number}"/>
	<title>Actividad en meza ${number} hoy</title>
	<r:require modules="bootstrap, app"/>
</head>
<body>
	<g:if test="${tables}">
		<h3>Actividad en meza ${number} hoy</h3>
		<table class="table table-hover">
			<thead>
				<tr>
					<th width="1">#</th>
					<th width="1">Desde</th>
					<th width="1">Hasta</th>
					<th width="140">Consumo y Total</th>
					<th>Vuelto</th>
				</tr>
			</thead>
			<tbody>
				<g:each in="${tables}" var="table" status="i">
					<tr>
						<td><g:link action="activity" params="[id:table.id]">${i + 1}</g:link></td>
						<td>${table.dateCreated.format('h:mm')}</td>
						<td>${table.lastUpdated.format('h:mm')}</td>
						<td>${table.payment}</td>
						<td>${table.change}</td>
					</tr>
				</g:each>
				<tr>
					<td></td>
					<td></td>
					<td></td>
					<td><bar:totalByTable number="${number}"/></td>
					<td></td>
				</tr>
			</tbody>
		</table>
	</g:if>
	<g:else>
		<h3>Sin actividad que mostrar hoy en meza ${number}</h3>
	</g:else>
</body>
</html>
