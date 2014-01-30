class Card
	constructor : (params) ->
		for name, value of params
			@[name] = value

		if @attachk + @defense + @speed > 15
			throw new Error("パラメータの合計を15以下にしてください。")

	restore : () ->
		@stamina = 100

class GameSystem
	battle : (card1, card2) ->
		console.log ("#{card1.name} vs #{card2.name}")

		card1.restore()
		card2.restore()

		loop
			if card1.speed > card2.speed
				[first, second] = [card1, card2]
			else if card1.speed < card2.speed
				[first, second] = [card2, card1]
			else 
				if Math.random() < 0.5
					[first, second] = [card1, card2]
				else 
					[first, second] = [card2, card1]

			damage = first.attachk - second.defense
			damage += Math.floor(Math.random() * 5)

			if damage > 0
				second.stamina -= damage

			if second.stamina <= 0
				return { winner: first, looser : second }

			damage = second.attachk - first.defense

			if damage > 0
				first.stamina -= damage

			if first.stamina <= 0
				return { winner: second, looser : first }

# myCard = new Card(
# 	name : "hogehoge"
# 	attachk : 4
# 	defense : 5
# 	speed : 6
# 	)
myCard1 = new Card(
	name : "hoge1",
	attachk : 5,
	defense : 4,
	speed : 6,
	)

myCard2 = new Card(
	name : "hoge2",
	attachk : 5,
	defense : 5,
	speed : 5,
	)

sys = new GameSystem()
result = sys.battle(myCard1, myCard2)

console.log ("winner is #{result.winner.name}, left stamina: #{result.winner.stamina}")
