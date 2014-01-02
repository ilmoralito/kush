<!doctype html>
<html lang="en">
<head>
	<meta charset="UTF-8">
	<meta name="layout" content="stats">
	<title>Stats by tables</title>
	<r:require modules="bootstrap, bootstrap-dropdown, stats, jquery-ui"/>
</head>
<body>
	<g:if test="${results}">
		<table class="table table-hover">
			<thead>
				<tr>
					<th width="1">#</th>
					<th>Veces atendida</th>
					<th>Dinero obtenido</th>
				</tr>
			</thead>
			<tbody>
				<g:each in="${results}" var="result">
					<tr>
						<td>${result.number}</td>
						<td>${result.count}</td>
						<td>${result.payment}</td>
					</tr>
				</g:each>
			</tbody>
		</table>
	</g:if>
	<g:else>
		<h3>Sin datos que mostrar...</h3>
	</g:else>
</body>
</html>
