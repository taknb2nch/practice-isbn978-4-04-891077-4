himitsu0 = 1

func1 = () ->
	himitsu1 = 12

	func2 = () ->
		himitsu2 = 23
		console.log "func2 -> himitsu0: #{himitsu0}"
		console.log "func2 -> himitsu1: #{himitsu1}"
		console.log "func2 -> himitsu2: #{himitsu2}"

	func2()

	console.log "func1 -> himitsu0: #{himitsu0}"
	console.log "func1 -> himitsu1: #{himitsu1}"

func1()
