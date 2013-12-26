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
		<g:hiddenField name="payment" value="${total}"/>
		<g:hiddenField name="change"/>

		<div class="form-group">
			<label for="payment">Pago</label>
			<g:textField name="payment" value="${total}" class="form-control input-lg" disabled="true"/>
		</div>
		<div class="form-group">
			<label for="money">Dinero</label>
			<g:textField name="money" value="${cmd?.money}" class="form-control input-lg" autofocus="true"/>
		</div>
		<div class="form-group">
			<label for="no_change">Resto o Cambio</label>
			<g:textField name="no_change" value="${cmd?.change}" class="form-control input-lg" disabled="true"/>
		</div>
		<button type="submit" class="btn btn-warning btn-lg btn-block">Confirmar</button>
	</g:form>
</body>
</html>
