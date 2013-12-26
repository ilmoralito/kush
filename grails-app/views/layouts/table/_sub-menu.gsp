<div class="row">
	<div class="col-md-8 col-md-offset-2">
		<div class="btn-group pull-right">
			<g:if test="${table?.fees}">
				<g:link action="fees" params="[id:table.id, number:table.number]" class="btn btn-link">Abonos</g:link>
			</g:if>
			<g:link action="charge" params="[number:params?.number]" class="btn btn-link">Cobrar</g:link>
			<g:link action="create" params="[number:params?.number]" class="btn btn-link">Ir a meza ${params.number}</g:link>
		</div>
	</div>
</div>
