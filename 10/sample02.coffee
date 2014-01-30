document.getElementById("nameform").onsubmit = () ->
	name = document.getElementById("name").value
	alert("こんにちは、#{name}さん")

	return false
	