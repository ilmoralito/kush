<g:hiddenField name="type" value="${params?.type}"/>

<div class="row">
	<div class="col-md-6">
		<g:if test="${params?.type == 'drink'}">
			<div class="form-group">
				<label for="brand">Marca</label>
				<g:select from="${service?.constraints?.brand?.inList}" name="brand" value="${service?.brand}" class="form-control"/>
			</div>
		
			<div class="form-group">
				<label for="measure">Medida</label>
				<g:select from="${service?.constraints?.measure?.inList}" name="measure" value="${service?.measure}" class="form-control"/>
			</div>
		</g:if>
		<g:elseif test="${params?.type == 'food'}">
			<div class="form-group">
				<label for="name">Nombre</label>
				<g:textField name="name" value="${service?.name}" class="form-control" autofocus="true"/>
			</div>

			<div class="form-group">
				<label for="price">Precio</label>
				<g:textField name="price" value="${service?.price}" class="form-control"/>
			</div>

			<label for="items">Items</label>
			<a href="#" id="create_new_item_textbox">Crear nuevo item</a>
			<g:each in="${service?.items}" var="item" status="i">
				<div class="form-group">
					<g:textField name="items" value="${item}" class="form-control"/>
				</div>
			</g:each>

		</g:elseif>
		<g:else>
			<div class="form-group">
				<label for="brand">Marca</label>
				<g:select from="${service?.constraints?.brand?.inList}" name="brand" value="${service?.brand}" class="form-control"/>
			</div>
			<div class="form-group">
				<label for="size">Tamano</label>
				<g:select from="${service?.constraints?.size?.inList}" name="size" value="${service?.size}" class="form-control"/>
			</div>
		</g:else>

		<g:if test="${params?.type != 'food'}">
			<div class="form-group">
				<label for="price">Precio</label>
				<g:textField name="price" value="${service?.price}" class="form-control"/>
			</div>
		</g:if>
	</div>
</div>
