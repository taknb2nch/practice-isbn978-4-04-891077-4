tprompt = require("../common/tiny_prompt")

shuffle = (array) ->
	i = array.length
	if i is 0
		return false

	while --i
		j = Math.floor(Math.random() * (i + 1))
		temp = array[i]
		array[i] = array[j]
		array[j] = temp

	return true

digits = [1..9]
shuffle(digits)

answerDigits = digits[0..3]

answerString = answerDigits.join("")

readInput = () ->
	tprompt "> ", (input) ->
		inputDigits = input.split("")
		
		hits = 0
		blows = 0
		
		for i in [0..3]
			inputDigits[i] = parseInt(inputDigits[i])
			if inputDigits[i] is answerDigits[i]
				hits++
			else if inputDigits[i] in answerDigits
				blows++
		#
		if hits is 4
			console.log("大正解")
		else
			console.log("#{hits}ヒット、#{blows}ブロー")
			readInput()

readInput()