extends Node

var ROOM_TYPES = Constants.ROOM_TYPES

func GetRandDir() -> Vector2:
	var directions = [Vector2(0, 1), Vector2(1, 0), Vector2(0, -1), Vector2(-1, 0)]
	return directions[randi() % directions.size()]

func GetDist(V1, V2) -> float:
	return sqrt(pow(V2.x - V1.x, 2) + pow(V2.y - V1.y, 2))

func GenerateMap (level):
	var ROOM_COUNT = floor(level * 1.5) + 8
	var LINKED_ROOM_COUNT = randi() % 3 #Max 2 linked rooms for now

	var currCoords = Vector2.ZERO
	var roomCount = 0
	var roomList = {}
	#   coords:Vector2
	#   value: ROOM_TYPE
	var roomListNormalized = {}
	var adjustment = Vector2.ZERO
	var startCoord = Vector2.ZERO
	var bossCoords = Vector2.ZERO

	while(roomCount != ROOM_COUNT):
		if not roomList.has(currCoords):
			roomList[currCoords] = {
				'value' :  ROOM_TYPES.START_ROOM if (roomCount == 0) else ROOM_TYPES.BATTLE_ROOM, 
				'linked': false, 
				'linkedCoord': Vector2.ZERO
			}  # Add room at current coordinates
			roomCount += 1
		currCoords += GetRandDir()
	
	#Normalize coordinates (remove negative coords)

	for key in roomList.keys():
		adjustment.x = min(adjustment.x, key.x)
		adjustment.y = min(adjustment.y, key.y)

	for key in roomList.keys():
		roomListNormalized[key - adjustment] = roomList[key]
		if roomList[key].value == ROOM_TYPES.START_ROOM:
			startCoord = key - adjustment

	#Assign Boss room
	for key in roomListNormalized.keys():
		if(GetDist(startCoord, bossCoords) < GetDist(startCoord, key)):
			bossCoords = key
	roomListNormalized[bossCoords].value = ROOM_TYPES.BOSS_ROOM

	#Only battle rooms can be combined with other rooms
	var linkedRoomCount = 0
	var coordList = roomListNormalized.keys()
	
	#No linked rooms for now
	# while(linkedRoomCount != LINKED_ROOM_COUNT):
	#     var tempCoord = coordList[randi() % coordList.size()]
	#     while(tempCoord == ROOM_TYPES.START_ROOM || tempCoord == ROOM_TYPES.BOSS_ROOM):
	#         tempCoord = coordList[randi() % coordList.size()]
	
	return roomListNormalized


#Merging room mechanics
#   Rooms are still represented as a cell in grid but will have indication of being merged to another
#   Linked rooms will have same enemy composition, but will have a higher tier treshold
#   Room budget will be computed in the individual rooms
#   A template will be prepared for linked room combinations
#   For simplicity, max two rooms linked
