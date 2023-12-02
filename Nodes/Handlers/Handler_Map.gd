extends Node

#This contains all the level cards, hence deck
const CARD_VALUES = Constants.CARD_VALUES
const HEIGHT = Constants.DECK_HEIGHT
const WIDTH = Constants.DECK_WIDTH

var cardDeck = []

func GetDeck(char_val = 0):
	if cardDeck.size() > 0:
		return cardDeck
	return GenerateDeck(char_val)

func SetDeck(deck):
	cardDeck = deck

func GenerateDeck(char_val):
	var CardValues = CARD_VALUES.values()
	CardValues.erase(char_val)
	CardValues.erase(CARD_VALUES.START)
	cardDeck = []

	for i in range(HEIGHT):
		var row = []
		for j in range(WIDTH):
			var card = Classes.Card.new()
			var value = CardValues[randi() % CardValues.size()]
			if (i != HEIGHT-1 && i != 0):
				card.init(Vector2(j,i), value)
			elif i == 0:
				card.init(Vector2(j,i), CARD_VALUES.START)
			else:
				card.init(Vector2(j,i), char_val)
			row.append(card)
		cardDeck.append(row)
	return cardDeck
