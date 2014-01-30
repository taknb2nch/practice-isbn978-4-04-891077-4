fs = require("fs")

write = () ->
	fs.writeFile("file.txt", "こんにちは World", "utf8", (err) ->
		if err 
			throw err
		console.log ("saved!")
	)

read = () ->
	fs.readFile("file.txt", "utf8", (err, contents) ->
		if err
			throw err
		console.log (contents)
	)

write()
read()