<!doctype html>
<html lang="en">
<head>
	<meta charset="UTF-8">
	<title><g:layoutTitle default="Stats"/></title>
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<r:layoutResources/>
</head>
<body>
	<g:render template="/layouts/navbar"/>

	<div class="container">
		<div class="row">
			<div class="col-md-2">
				<ul class="nav">
					<li><g:link action="index" class="active">Resultados</g:link></li>
				</ul>
			</div>
			<div class="col-md-7">
				<g:layoutBody/>
			</div>
			<div class="col-md-3">
				<div class="row">
					<div class="col-md-12">
						<g:link action="list" params="[number:params?.number]" class="pull-right">
							<span class="glyphicon glyphicon-calendar"></span>
						</g:link>
					</div>
				</div>
				<div class="panel panel-default" style="margin-top:35px;">
					<div class="panel-heading">Totales</div>
					<div class="panel-body">
						<p>
							<div class="row">
								<div class="col-md-6">Total bebidas</div>
								<div class="col-md-6">${drinksTotal}</div>
							</div>
						</p>
						<p>
							<div class="row">
								<div class="col-md-6">Total Comidas</div>
								<div class="col-md-6">${foodsTotal}</div>
							</div>
						</p>
						<p>
							<div class="row">
								<div class="col-md-6">Total cigarros</div>
								<div class="col-md-6">${cigarsTotal}</div>
							</div>
						</p>
						<hr>
						<p>
							<div class="row">
								<div class="col-md-6">TOTAL</div>
								<div class="col-md-6">${total}</div>
							</div>
						</p>
					</div>
				</div>
			</div>
		</div>
	</div>
	<r:layoutResources/>
</body>
</html>
