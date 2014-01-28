tprompt = require("../common/tiny_prompt")

menu = 
	coffee : 350
	cake : 400
	curry : 600
	ramen : 650
	gyudon : 280


console.log "--- Menu ---"

for name, price of menu
	console.log "#{name}\t#{price}円"

console.log "------------"

totalPrice = 0

#
checkout = ->
	console.log "合計#{totalPrice}円です。"
	console.log JSON.stringify(orders)

orders = {}

order = (item) ->
	if not orders[item]?
		orders[item] = 1
	else
		orders[item]++

	totalPrice += menu[item]

readInput = () ->
	tprompt "item > ", (item) ->
		if item is ""
			checkout()
		else if menu[item]?
			console.log "#{item}は#{menu[item]}円です。"			
			order(item)
			readInput()
		else
			console.log "エラー：該当する商品がありません。"
			readInput()

readInput()
