<!doctype html>
<html lang="en">
<head>
	<meta charset="UTF-8">
	<title><g:layoutTitle default="Cobro"/></title>
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<r:layoutResources/>
</head>
<body>
	<g:render template="/layouts/navbar"/>

	<div class="container">
		<div class="row">
			<div class="col-md-8 col-md-offset-2"><h4><g:link action="create" params="[number:params?.number]" class="pull-right">Ir a meza ${params.number}</g:link></h4></div>
		</div>
		<div class="row">
			<div class="col-md-4 col-md-offset-2">
				<g:render template="activities"/>
			</div>
			<div class="col-md-4">
				<g:layoutBody/>
				<g:if test="${flash.message}">
					<h4>${flash.message}</h4>
				</g:if>
			</div>
		</div>
	</div>
	<r:layoutResources/>
</body>
</html>
