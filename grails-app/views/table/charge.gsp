<!doctype html>
<html lang="en">
<head>
	<meta charset="UTF-8">
	<meta name="layout" content="distraction-free-mode">
	<title>${activity}</title>
	<r:require modules="bootstrap, charge"/>
	<style>
		details, summary {display: block;}
		details:not([open]) > :not(summary) {display: none;}
	</style>
</head>
<body>
	<h3><g:link action="create" params="[number:params?.number]">Meza ${params.number}</g:link></h3>

	<g:hasErrors bean="${table}">
		<g:renderErrors bean="${table}"/>
	</g:hasErrors>

	<details>
		<summary>Actividad de la meza</summary>
		<g:render template="activities"/>
	</details>

	<g:form action="charge">
		<g:hiddenField name="number" value="${params?.number}"/>

		<div class="form-group">
			<label for="payment">Pago</label>
			<g:textField name="payment" value="${bar.total(table:table)}" class="form-control input-lg"/>
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
