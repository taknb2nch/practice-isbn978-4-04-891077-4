tprompt = require("../common/tiny_prompt")

context = null

readInput = () ->
	tprompt("> ", (input) ->
		if context is "kareshi"
			if /はい|もちろん|いい(よ|です)|yes/.test(input)
				console.log ("冗談です")
			else if /いいえ|やだ|ごめん|no/.test(input)
				console.log ("悲しい....")
			else
				console.log ("ごめんなさい。何でもないです。")
			context = null
		else 
			if /名前は(何(ですか)?)?？/.test(input)
				console.log ("あいこです。")
			else if /(何時(ですか)?|時間は)？/.test(input)
				d = new Date()
				console.log ("#{d.getHours()}時#{d.getMinutes()}分です。")
			else if /彼氏.*い(るの?|ますか)?？/.test(input)
				console.log ("いないです。私の彼氏になってくれますか?")
				context = "kareshi"
			else
				console.log ("よく分かりません。")
		readInput()
		)

readInput()