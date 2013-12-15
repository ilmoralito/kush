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
				<div class="panel panel-${bar.test(number:st)}">
					<div class="panel-heading">Meza ${st}</div>
					<div class="panel-body">
						<g:link action="create" params="[number:st]">Mas</g:link>
					</div>
				</div>
			</div>
		</g:each>
	</div>
</body>
</html>
