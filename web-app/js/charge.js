var payment = parseFloat(document.querySelector("#payment").value),
	change = document.querySelector("#change"),
	no_change = document.querySelector("#no_change"),
	money = document.querySelector("#money");

money.addEventListener("keyup", function(){
	var _this = parseFloat(this.value);

	if (payment > _this) {
		change.value = payment - _this;
		no_change.value = payment - _this;
	} else {
		change.value = _this - payment;
		no_change.value = _this - payment;
	}
})
