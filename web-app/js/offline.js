var trigger = document.querySelector("#createServiceForm")

trigger.addEventListener("click", function(e){
	var number = document.querySelector("#number").value,
		service = document.querySelector("#service").value,
		amount = document.querySelector("#amount").value;

	var obj = [{
		service:service,
		amount:amount
	}]

	var map = {
		service:service,
		amount:amount
	}

	/*


	for (var i = 0; i < localStorage.length; i++) {
		var table_number = localStorage.key(i)
	};
	*/

	for (var i = 0; i < localStorage.length; i++) {
		var table_number = localStorage.key(i)

		if (table_number == number) {
			var f = JSON.parse(localStorage.getItem(table_number))

			f.push(map)

			localStorage.setItem(number, JSON.stringify(f))
		} else {
			localStorage.setItem(number, JSON.stringify(obj))
		}
	};

	//e.preventDefault()
})

