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
				<div class="well well-small well-${(bar.check(number:st)) ? 'primary' : ''}">
					<div class="row">
						<div class="col-md-6"><strong>${st}</strong></div>
						<div class="col-md-6">
							<g:if test="${ni.com.bar.Table.todayActivity.countByNumberAndStatus(st, true)}">
								<g:link action="list" params="[number:st]" class="pull-right">
									<span class="glyphicon glyphicon-th-list"></span>
								</g:link>
							</g:if>
						</div>
					</div>
					<br>
					<div class="row">
						<div class="col-md-12">
							<g:if test="${bar.check(number:st)}">
								<g:link action="create" params="[number:st]">Mostrar</g:link>
							</g:if>
							<g:else>
								<g:link action="create" params="[number:st]">Habilitar</g:link>
							</g:else>
						</div>
					</div>
				</div>
			</div>

		</g:each>
	</div>
</body>
</html>
