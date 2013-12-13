var target = $("#create_new_item_textbox")

target.on("click", function(e){
	var element = "<div class='form-group'><input name='items' id='items' class='form-control'></div>"
	target.parent().append(element)	
	e.preventDefault()
})