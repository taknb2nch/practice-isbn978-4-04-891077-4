tprompt = require("../common/tiny_prompt")

context = null

schedules = []

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
			else if (match = /^明日は(.*)/.exec(input))?
				schedules.push(match[1])
				console.log ("明日の予定を追加しました。")
			else if /明日の予定/.test(input)
				if schedules.length > 0
					for schedule in schedules
						console.log ("- #{schedule}")
				else
					console.log ("何もありません。")
			else
				console.log ("よく分かりません。")
		readInput()
		)

readInput()