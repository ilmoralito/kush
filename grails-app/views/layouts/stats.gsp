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
			<div class="col-md-9">
				<g:layoutBody/>
			</div>
			<div class="col-md-3">
				<g:form action="index">
					<div class="row">
						<div class="col-md-6">
							<div class="form-group">
								<g:textField name="from" value="${params?.from}" class="form-control" placeholder="Desde"/>
							</div>
						</div>
						<div class="col-md-6">
							<div class="form-group">
								<g:textField name="to" value="${params?.to}" class="form-control" placeholder="Hasta"/>
							</div>
						</div>
					</div>
					<button type="submit" class="btn btn-primary pull-right"><span class="glyphicon glyphicon-search"></span></button>
				</g:form>
				<br><br><br>
				<div class="well well-sml">
					<div class="row">
						<div class="col-md-6">Total bebidas</div>
						<div class="col-md-6">${drinksTotal}</div>
					</div>
					<br>
					<div class="row">
						<div class="col-md-6">Total Comidas</div>
						<div class="col-md-6">${foodsTotal}</div>
					</div>
					<br>
					<div class="row">
						<div class="col-md-6">Total cigarros</div>
						<div class="col-md-6">${cigarsTotal}</div>
					</div>
					<hr>
					<div class="row">
						<div class="col-md-6">TOTAL</div>
						<div class="col-md-6">${total}</div>
					</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<r:layoutResources/>
</body>
</html>
