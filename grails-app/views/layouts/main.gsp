<!doctype html>
<html lang="en">
<head>
	<meta charset="UTF-8">
	<title><g:layoutTitle default="Welcome"/></title>
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<r:layoutResources/>
</head>
<body>
	<nav class="navbar navbar-default navbar-fixed-top" role="navigation">
	  	<div class="container">
	  		<div class="navbar-header">
		    	<button type="button" class="navbar-toggle" data-toggle="collapse">
		      		<span class="sr-only">Toggle navigation</span>
		      		<span class="icon-bar"></span>
		      		<span class="icon-bar"></span>
		      		<span class="icon-bar"></span>
		    	</button>
		    	<a class="navbar-brand" href="#">KUSH BAR</a>
	  		</div>
  			    <ul class="nav navbar-nav navbar-right">
 			    	<sec:ifAllGranted roles="ROLE_ADMIN">
  			    		<li class="${(controllerName == 'service') ? 'active' : ''}"><g:link controller="service">Servicios</g:link></li>
			    	</sec:ifAllGranted>
			    	<li><g:link controller="logout">Salir</g:link></li>
			    </ul>
	  		</div>
	  	</div>
	</nav>

	<div class="container">
		<div class="row">
			<div class="col-md-12">
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
