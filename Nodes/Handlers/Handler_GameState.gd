extends Node

#constants
var CARD_VALUE = Constants.CARD_VALUES
const MAP_HANDLER = preload("res://Nodes/Handlers/Handler_Map.gd")

#Var to set on startup
var mapHandler = MAP_HANDLER.new()
var levelMap
var charVal: int

#Var to set per level change
var selectedLevelCoords := Vector2(10,0)
var levelValue:int	#Card value
var level: int

#Var to set per room change
#Var to set on call

func GameStart(charVal):
	self.charVal = charVal
	levelMap = mapHandler.GetDeck(Constants.CHAR_TO_CARD(self.charVal))
	level = 0
