<g:set var="tables" value="${grailsApplication.config.ni.com.bar.tables}"/>

<g:if test="${activities}">
	<g:if test="${flags}">
		<g:each in="${flags}" var="flag">
			<div class="row">
				<div class="col-md-6">
					<h4>Meza ${flag}</h4>
				</div>
				<div class="col-md-6">
					<g:if test="${actionName == 'create'}">
						<div class="btn-group pull-right">
							<button type="button" data-toggle="dropdown" class="btn btn-link btn-xs dropdown-toggle">
								<span class="glyphicon glyphicon-align-justify"></span></span>
							</button>
							<ul class="dropdown-menu">
								<li role="presentation" class="dropdown-header">Mover</li>
								<g:each in="${1..tables}" var="n">
									<g:if test="${n != table.number}">
										<li><g:link action="moveActivities" params="[from:table.id, flag:flag, to:n]">${n}</g:link></li>
									</g:if>
								</g:each>
							</ul>
						</div>
					</g:if>
				</div>
			</div>
			<table class="table table-hover">
				<tbody>
					<g:each in="${activities.findAll { it.flag == flag }}" var="activity">
						<tr>
							<td>
								<g:if test="${actionName == 'create'}">
									<g:link controller="activity" action="show" id="${activity.id}">${activity}</g:link>
								</g:if>
								<g:else>
									${activity}
								</g:else>
							</td>
							<td width="1">${activity.total}</td>
						</tr>
					</g:each>
					<tr>
						<td></td>
						<td width="1"><strong><bar:totalActivitiesByFlag flag="${flag}" number="${table.number}"/></strong></td>
					</tr>
				</tbody>
			</table>
		</g:each>
	</g:if>
	<g:else>
		<table class="table table-hover">
			<thead>
				<th>Servicio</th>
				<th width="1">Precio</th>
			</thead>
			<tbody>
				<g:each in="${activities}" var="activity">
					<tr>
						<td>
							<g:if test="${actionName == 'create'}">
								<g:link controller="activity" action="show" id="${activity.id}">${activity}</g:link>
							</g:if>
							<g:else>
								${activity}
							</g:else>
						</td>
						<td>${activity.total}</td>
					</tr>
				</g:each>
				<tr>
					<td>TOTAL</td>
					<td><strong><bar:totalActivities table="${table}"/></strong></td>
				</tr>
			</tbody>
		</table>
	</g:else>
</g:if>