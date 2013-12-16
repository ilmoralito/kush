<g:if test="${table?.activities}">
	<table class="table table-hover">
		<thead>
			<tr>
				<th>Cantidad y Servicio</th>
				<th width="1">Total</th>
			</tr>
		</thead>
		<tbody>
			<g:each in="${table.activities}" var="activity">
				<tr>
					<td>
						<g:if test="${actionName == 'create'}">
							<g:link controller="activity" action="show" params="[id:activity.id]">
								${activity.amount} ${activity.service}
							</g:link>
						</g:if>
						<g:else>
							${activity.amount} ${activity.service}
						</g:else>
					</td>
					<td>${activity.total}</td>
				</tr>
			</g:each>
			<tr>
				<td>TOTAL</td>
				<td><bar:total table="${table}"/></td>
			</tr>
		</tbody>
	</table>
</g:if>
<g:else>
	...
</g:else>
