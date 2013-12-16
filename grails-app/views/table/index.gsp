<!doctype html>
<html lang="en">
<head>
	<meta charset="UTF-8">
	<meta name="layout" content="main">
	<title>Tables</title>
	<r:require modules="bootstrap, app"/>
</head>
<body>
	<div class="row">
		<g:each in="${1..grailsApplication.config.ni.com.bar.tables}" var="table" status="i">
			<g:set var="st" value="${i + 1}"/>

			<div class="col-md-2">
				<div class="panel panel-${(bar.check(number:st)) ? 'primary' : 'info'}">
					<div class="panel-heading">
						Meza ${st}
						<g:if test="${ni.com.bar.Table.todayActivity.countByNumberAndStatus(st, true)}">
							<g:link action="list" params="[number:st]" class="pull-right">
								<span class="glyphicon glyphicon-th-list" style="color:#444;"></span>
							</g:link>
						</g:if>
					</div>
					<div class="panel-body">
						<g:if test="${bar.check(number:st)}">
							<g:link action="create" params="[number:st]">Mostrar</g:link>
						</g:if>
						<g:else>
							<g:link action="create" params="[number:st]">Habilitar</g:link>
						</g:else>
					</div>
				</div>
			</div>

		</g:each>
	</div>
</body>
</html>
