class Card : 
	var coords: Vector2
	var value: String
	var active: bool
	var clicked: bool
	func init(coords, value):
		self.coords = coords
		self.value = value
