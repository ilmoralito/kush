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
			<g:if test="${table?.fees}">
				<tr>
					<td><strong>Total consumido</strong></td>
					<td><strong><bar:totalActivities table="${table}"/></strong></td>
				</tr>
				<tr>
					<td><strong>Total abonado</strong></td>
					<td><strong><bar:totalFees table="${table}"/></strong></td>
				</tr>
				<tr>
					<td>TOTAL</td>
					<td><bar:totalPayment table="${table}"/></td>
				</tr>
			</g:if>
			<g:else>
				<tr>
					<td>TOTAL</td>
					<td><bar:totalActivities table="${table}"/></td>
				</tr>
			</g:else>
		</tbody>
	</table>
</g:if>
<g:else>
	<h1>...</h1>
</g:else>
