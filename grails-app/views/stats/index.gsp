<!doctype html>
<html lang="en">
<head>
	<meta charset="UTF-8">
	<meta name="layout" content="stats">
	<title>Stats</title>
	<r:require modules="bootstrap, app"/>
</head>
<body>
	<g:if test="${total}">
		<g:if test="check something">
			<h3>Bebidas</h3>
			<table class="table">
				<g:each in="${drinks}" var="drink">
					<tr>
						<td width="150">${drink.service}</td>
						<td width="1">${drink.count}</td>
						<td>${drink.service.price * drink.count}</td>
					</tr>
				</g:each>
				<tr>
					<td>TOTAL</td>
					<td></td>
					<td>${drinksTotal}</td>
				</tr>
			</table>
		</g:if>

		<g:if test="${foods}">
			<h3>Comidas</h3>
			<table class="table">
				<g:each in="${foods}" var="food">
					<tr>
						<td width="150">${food.service}</td>
						<td width="1">${food.count}</td>
						<td>${food.service.price * food.count}</td>
					</tr>
				</g:each>
				<tr>
					<td>TOTAL</td>
					<td></td>
					<td>${foodsTotal}</td>
				</tr>
			</table>
		</g:if>

		<g:if test="${cigars}">
			<h3>Cigarros</h3>
			<table class="table">
				<g:each in="${cigars}" var="cigar">
					<tr>
						<td width="150">${cigar.service}</td>
						<td width="1">${cigar.count}</td>
						<td>${cigar.service.price * cigar.count}</td>
					</tr>
				</g:each>
				<tr>
					<td>TOTAL</td>
					<td></td>
					<td>${cigarsTotal}</td>
				</tr>
			</table>
		</g:if>
	</g:if>
	<g:else>
		...
	</g:else>
</body>
</html>
