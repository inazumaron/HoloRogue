#Will contain all constant data (Enums sor far)
const DECK_HEIGHT = 11
const DECK_WIDTH = 21

enum ROOM_TYPES {
	START_ROOM,
	BATTLE_ROOM,
	SHOP_ROOM, #Probably not on MVP
	REST_ROOM, #Provides small healing
	CHALLENGE_ROOM, #Probably not on MVP
	BOSS_ROOM
}

enum CARD_VALUES {
	START,
	REST, 
	GRAVEYARD, 
	FOREST,
	TOWN, 
	HARBOR, 
	PLAINS
}

enum CHAR_VALUES {
	FLARE,
	MARINE,
	NOEL,
	PEKORA,
	RUSHIA
}

func CHAR_TO_CARD (charVal):
	if charVal in [CHAR_VALUES.FLARE]:
		return CARD_VALUES.FOREST
	if charVal in [CHAR_VALUES.MARINE]:
		return CARD_VALUES.HARBOR
	if charVal in [CHAR_VALUES.NOEL]:
		return CARD_VALUES.TOWN
	if charVal in [CHAR_VALUES.PEKORA]:
		return CARD_VALUES.PLAINS
	if charVal in [CHAR_VALUES.RUSHIA]:
		return CARD_VALUES.GRAVEYARD
