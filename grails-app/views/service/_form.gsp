<g:hiddenField name="type" value="${params?.type}"/>

<div class="row">
	<div class="col-md-6">
		<div class="form-group">
			<label for="name">Nombre</label>
			<g:textField name="name" value="${(params?.type == 'drink') ?  drink?.name : food?.name}" class="form-control" autofocus="true"/>
		</div>
		
		<div class="form-group">
			<label for="price">Precio</label>
			<g:textField name="price" value="${(params?.type == 'drink') ?  drink?.price : food?.price}" class="form-control"/>
		</div>
		
		<g:if test="${params?.type == 'drink'}">
			<div class="form-group">
				<label for="brand">Marca</label>
				<g:select from="${drink?.constraints?.brand?.inList}" name="brand" value="${drink?.brand}" class="form-control"/>
			</div>
		
			<div class="form-group">
				<label for="measure">Medida</label>
				<g:select from="${drink?.constraints?.measure?.inList}" name="measure" value="${drink?.measure}" class="form-control"/>
			</div>
		</g:if>
		<g:else>
			<div class="form-group">
				<label for="items">Ingredientes</label>
				<g:textField name="items" value="" class="form-control"/>
			</div>
			<div class="form-group">
				<label for="items">Ingredientes</label>
				<g:textField name="items" value="" class="form-control"/>
			</div>
			<div class="form-group">
				<label for="items">Ingredientes</label>
				<g:textField name="items" value="" class="form-control"/>
			</div>
		</g:else>
	</div>
</div>
