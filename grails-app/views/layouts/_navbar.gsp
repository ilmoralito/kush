<nav class="navbar navbar-default navbar-fixed-top" role="navigation">
	<div class="container">
	  	<div class="navbar-header">
		   	<button type="button" class="navbar-toggle" data-toggle="collapse">
		   		<span class="sr-only">Toggle navigation</span>
		   		<span class="icon-bar"></span>
		   		<span class="icon-bar"></span>
		   		<span class="icon-bar"></span>
		   	</button>
	    	<g:link controller="table" class="navbar-brand">KUSH BAR</g:link>
		</div>
  		    <ul class="nav navbar-nav navbar-right">
  		    	<li class="${(controllerName == 'table' || controllerName == 'activity') ? 'active' : ''}">
  		    		<g:link controller="table">Mezas</g:link>
  		    	</li>
 		    	<sec:ifAllGranted roles="ROLE_ADMIN">
  		    		<li class="${(controllerName == 'service') ? 'active' : ''}">
  		    			<g:link controller="service">Servicios</g:link>
  		    		</li>
 		    		<li class=""><g:link action="actionName">Estadisticas</g:link></li>
		    	</sec:ifAllGranted>
		    	<li><g:link controller="logout">Salir</g:link></li>
		    </ul>
  		</div>
  	</div>
</nav>
