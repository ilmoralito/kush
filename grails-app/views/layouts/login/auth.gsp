<!doctype html>
<html lang="en">
<head>
	<meta charset="UTF-8">
	<title><g:layoutTitle default="Welcome"/></title>
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<r:layoutResources/>
</head>
<body>
	<div class="container">
		<div class="row">
			<div class="col-md-4 col-md-offset-2">
				<h1>KUSH</h1>
				Lorem ipsum dolor sit amet, consectetur adipisicing elit. Vero, quisquam, impedit voluptatem autem est quasi sunt repellat iure repudiandae nemo sapiente ipsam nihil officiis. Expedita, nisi modi impedit laborum. Qui.
			</div>
			<div class="col-md-4">
				<g:layoutBody/>
				<br>
				<g:if test="${flash.message}">${flash.message}</g:if>
			</div>
		</div>
	</div>
	<r:layoutResources/>
</body>
</html>