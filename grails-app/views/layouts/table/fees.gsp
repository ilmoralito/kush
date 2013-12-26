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

		<g:render template="/layouts/table/sub-menu"/>

		<div class="row">
			<div class="col-md-8 col-md-offset-2">
				<g:layoutBody/>
			</div>
		</div>
	</div>
	<r:layoutResources/>
</body>
</html>
