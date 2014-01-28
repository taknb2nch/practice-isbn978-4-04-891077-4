tprompt = require("../common/tiny_prompt")

answer = parseInt(Math.random() * 100) + 1
#console.log("answer: #{answer}")

readInput = () ->
	tprompt "Enter a number (1-100)> ", (input) ->
		input = parseInt(input)
		if input is answer
			console.log("正解！")
		else if input < answer
			console.log("もっと大きい！")
			readInput()
		else 
			console.log("もっと小さい！")
			readInput()

readInput()