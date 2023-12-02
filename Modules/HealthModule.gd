extends Node

var currHp: int = 0;
var maxHp: int = 0;

func init(currHp, maxHp):
	self.currHp = currHp
	self.maxHp = maxHp

func getHp() -> int:
	return self.currHp

func getMaxHp() -> int:
	return self.maxHp

func damage(damage, damageModifiers, defenseModifiers) -> int:
	self.currHp = max(0, self.currHp - damage)
	return self.currHp

func heal(value, modifiers) -> int:
	self.currHp = min(maxHp, self.currHp + value)
	return self.currHp
