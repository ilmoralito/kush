<!doctype html>
<html lang="en">
<head>
	<meta charset="UTF-8">
	<title>${activity}</title>
	<r:require modules="bootstrap, charge"/>
</head>
<body>
	<g:hasErrors bean="${cmd}">
		<p><small><g:renderErrors bean="${cmd}"/></small></p>
	</g:hasErrors>

	<g:form action="charge" autocomplete="off">
		<g:hiddenField name="number" value="${params?.number}"/>
		<g:hiddenField name="payment" value="${bar.total(table:table)}"/>
		<div class="form-group">
			<label for="payment">Pago</label>
			<g:textField name="payment" value="${bar.total(table:table)}" class="form-control input-lg" disabled="true"/>
		</div>
		<div class="form-group">
			<label for="money">Dinero</label>
			<g:textField name="money" value="${params?.money}" class="form-control input-lg" autofocus="true"/>
		</div>
		<div class="form-group">
			<label for="change">Vuelto</label>
			<g:textField name="change" value="${params?.change}" class="form-control input-lg"/>
		</div>
		<button type="submit" class="btn btn-warning btn-lg btn-block">Confirmar</button>
	</g:form>
</body>
</html>
