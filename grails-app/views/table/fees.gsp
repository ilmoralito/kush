<!doctype html>
<html lang="en">
<head>
	<meta charset="UTF-8">
	<title>Abonos</title>
	<r:require modules="bootstrap, charge"/>
</head>
<body>
	<table class="table table-hover">
		<thead>
			<tr>
				<th width="1">Hora</th>
				<th>Pago</th>
			</tr>
		</thead>
		<tbody>
			<g:each in="${fees}" var="fee">
				<tr>
					<td>${fee.dateCreated.format("HH:mm")}</td>
					<td>${fee.fee}</td>
				</tr>
			</g:each>
			<tr>
				<td></td>
				<td><bar:totalFees table="${table}"/></td>
			</tr>
		</tbody>
	</table>
</body>
</html>
