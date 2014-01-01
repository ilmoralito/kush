<g:set var="id" value="${(table?.id) ?: id}"/>
<g:set var="number" value="${(params?.number) ?: number}"/>

<div class="row">
	<div class="col-md-8 col-md-offset-2">
		<div class="btn-group pull-right">
			<g:if test="${fees}">
				<g:link action="fees" params="[id:id]" class="btn btn-link">Abonos</g:link>
			</g:if>
			<g:link action="charge" params="[number:number]" class="btn btn-link">Cobrar</g:link>
			<g:link action="create" params="[number:number]" class="btn btn-link">Meza ${number}</g:link>
		</div>
	</div>
</div>
