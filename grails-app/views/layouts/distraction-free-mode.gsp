<!doctype html>
<html lang="en">
<head>
	<meta charset="UTF-8">
	<title><g:layoutTitle default="..."/></title>
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<r:layoutResources/>
</head>
<body>
	<g:render template="/layouts/navbar"/>

	<div class="container">
		<div class="row">
			<div class="col-md-4 col-md-offset-4">
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
