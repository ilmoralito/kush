<!doctype html>
<html lang="en">
<head>
	<meta charset="UTF-8">
	<meta name="layout" content="stats">
	<title>Stats</title>
	<r:require modules="bootstrap, bootstrap-dropdown, stats, jquery-ui"/>
</head>
<body>
	<g:if test="${total}">
		<g:if test="${drinks}">
			<h4>Bebidas</h4>
			<table class="table table-hover">
				<g:each in="${drinks}" var="drink">
					<tr>
						<td width="1">${drink.count}</td>
						<td width="160">${drink.service}</td>
						<td>${drink.service.price * drink.count}</td>
					</tr>
				</g:each>
			</table>
		</g:if>

		<g:if test="${foods}">
			<h4>Comidas</h4>
			<table class="table table-hover">
				<g:each in="${foods}" var="food">
					<tr>
						<td width="1">${food.count}</td>
						<td width="160">${food.service}</td>
						<td>${food.service.price * food.count}</td>
					</tr>
				</g:each>
			</table>
		</g:if>

		<g:if test="${localDrinks}">
			<h4>Bebidas locales</h4>
			<table class="table table-hover">
				<g:each in="${localDrinks}" var="localDrink">
					<tr>
						<td width="1">${localDrink.count}</td>
						<td width="160">${localDrink.service}</td>
						<td>${localDrink.service.price * localDrink.count}</td>
					</tr>
				</g:each>
			</table>
		</g:if>

		<g:if test="${cigars}">
			<h4>Cigarros</h4>
			<table class="table table-hover">
				<g:each in="${cigars}" var="cigar">
					<tr>
						<td width="1">${cigar.count}</td>
						<td width="160">${cigar.service}</td>
						<td>${cigar.service.price * cigar.count}</td>
					</tr>
				</g:each>
			</table>
		</g:if>
	</g:if>
	<g:else>
		<h3>Sin datos que mostrar...</h3>
	</g:else>
</body>
</html>
