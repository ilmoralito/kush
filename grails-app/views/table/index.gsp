<!doctype html>
<html lang="en">
<head>
	<meta charset="UTF-8">
	<meta name="layout" content="main">
	<title>Mezas</title>
	<r:require modules="bootstrap, bootstrap-dropdown, app"/>
</head>
<body>
	<g:set var="tables" value="${grailsApplication.config.ni.com.bar.tables}"/>

	<div class="row">
		<div class="col-md-12">
			<div class="btn-group pull-right">
				<g:link class="btn btn-default"><span class="glyphicon glyphicon-th"></g:link>
				<g:link params="[view:'th']" class="btn btn-default"><span class="glyphicon glyphicon-th-list"></g:link>
			</div>
		</div>
	</div>
	<br>
	<g:if test="${params?.view}">
		<table class="table table-hover">
			<thead>
				<tr>
					<th width="1">#</th>
					<th width="1">Saldo</th>
					<th></th>
				</tr>
			</thead>
			<tbody>
				<g:each in="${activeTables}" var="table" status="i">
					<g:set var="number" value="${table.number}"/>
					<g:if test="${table?.activities}">
						<tr>
							<td><g:link action="create" params="[number:number]">${number}</g:link></td>
							<td><bar:total table="${table}"/></td>
							<td>
								<g:link action="charge" params="[number:number]">Cobrar</g:link>
							</td>
						</tr>
					</g:if>
				</g:each>
			</tbody>
		</table>
	</g:if>
	<g:else>
		<div class="row">
			<g:each in="${1..tables}" var="number">
				<g:if test="${activeTables*.number.contains(number)}">
					<div class="col-md-2">
						<div class="well well-sm">
							<g:set var="tableInstance" value="${activeTables.find{ it.number == number }}"/>

							<div class="row">
								<div class="col-md-6"><strong>${number}</strong></div>
								<div class="col-md-6">
									<div class="btn-group pull-right">
										<button type="button" data-toggle="dropdown" class="btn btn-link btn-xs dropdown-toggle">
											<span class="glyphicon glyphicon-align-justify"></span></span>
										</button>
										<ul class="dropdown-menu">
											<bar:check number="${number}">
												<li role="presentation" class="dropdown-header">Actividad de hoy</li>
												<li><g:link action="list" params="[number:number]">Listar</g:link></li>
												<li role="presentation" class="divider"></li>
											</bar:check>
											<bar:showDisabledTableLink number="${number}">
												<li><g:link action="delete" params="[number:number]">Deshabilitar</g:link></li>
												<li class="divider"></li>
											</bar:showDisabledTableLink>
		  									<li role="presentation" class="dropdown-header">Mover</li>
										    <g:each in="${1..tables}" var="n">
										    	<!--
										    		show only if
										    		1. table is diferente than the choosing one
										    		2. if destiny table do not has activities
										    	-->
										    	<g:if test="${n != number && !ni.com.bar.Table.todayActivities.findByNumberAndStatus(n, false)?.activities?.size()}">
										    		<li><g:link action="moveToTable" params="[currentTableId:tableInstance.id, newTableNumber:n]">${n}</g:link></li>
										    	</g:if>
										    </g:each>
										</ul>
									</div>
								</div>
							</div>
							<br>
							<div class="row">
								<div class="col-md-12">
									<g:link action="create" params="[number:number]" class="btn btn-sm btn-primary">
										Mostrar
									</g:link>
									<g:if test="${tableInstance?.activities}">
										<g:link action="charge" params="[number:number]" class="btn btn-sm btn-warning pull-right">Cobrar</g:link>
									</g:if>
								</div>
							</div>
						</div>
					</div>
				</g:if>
				<g:else>
					<div class="col-md-2">
						<div class="well well-sm">
							<div class="row">
								<div class="col-md-12"><strong>${number}</strong></div>
							</div>
							<br>
							<div class="row">
								<div class="col-md-12">
									<g:link action="create" class="btn btn-sm" params="[number:number]">
										Habilitar
									</g:link>
								</div>
							</div>
						</div>
					</div>
				</g:else>
			</g:each>
		</div>
	</g:else>
</body>
</html>
