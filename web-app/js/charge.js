$("#money").on("keyup", function(){
	var money = $(this).val(),
		payment = $("#payment").val(),
		change = $("#change");

		change.val(money - payment)
})

if (!("open" in document.createElement("details"))) {
 
var summaries = document.querySelectorAll("details > summary");
 
for (var i = 0; i < summaries.length; i++) {
var summary = summaries[i];
summary.addEventListener("click", function() {
var parent = summary.parentNode;
if (parent.hasAttribute("open")) {
parent.removeAttribute("open");
} else {
parent.setAttribute("open", "open");
}
}, false);
}
 
}
