#Guide on different expected modifiers on each module

#Move Module --------------------------------
class moveModifiers:
	var speed: int
	var direction: Vector2
	var knockBack: knockBackClass
	var speedMod: speedModClass

class knockBackClass:
	var active: bool
	var duration: float
	var speed: int
	var direction: Vector2
	var acceleration: Vector2
	#Add more things here as things get bigger

class speedModClass:
	var active: bool
	#For unconditional speed multiplier
	var speed: int
	#For direction specific modifier
	var speedVector: Vector2
	#add more as things get bigger

#Health Module-------------------------------------
class damageModifiers:
	#to be applied after multiplier
	var bonusDamage: int
	var damageMultiplier: float
	var ignoreBarrier: bool
	var ignoreShield: bool

class defenseModifiers:
	var damageReduction: float
	#Barriers block all damage
	var barrier: int
	#Shield reduces damage
	var shield: float
	
