pad = (num, width) ->
	num += ""

	while num.length < width
		num = "0" + num

	return num

clearLine = () ->
	process.stdout.write("\x1b[1G")
	process.stdout.write("\x1b[0J")

days = ["日", "月", "火", "水", "木", "金", "土", ]

printDate = () ->
	d = new Date
	year = d.getFullYear()
	month = d.getMonth() + 1
	date = d.getDate()
	hour = d.getHours()
	minutes = d.getMinutes()
	second = d.getSeconds()
	ms = d.getMilliseconds()

	day = d.getDay()

	timeString = "#{year}年#{month}月#{date}日"
	timeString += "#{hour}時#{pad(minutes, 2)}分#{pad(second, 2)}.#{pad(ms, 3)}秒"
	timeString += "（#{days[day]}）"

	#console.log timeString
	clearLine()
	process.stdout.write(timeString)

	setTimeout(printDate, 1000 - ms)

printDate()
