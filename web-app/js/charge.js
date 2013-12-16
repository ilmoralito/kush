$("#money").on("keyup", function(){
	var money = $(this).val(),
		payment = $("#payment").val(),
		change = $("#change");

		change.val(money - payment)
})