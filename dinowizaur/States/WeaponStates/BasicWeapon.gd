extends State
class_name BaseWeapon

@onready var main = get_tree().get_root().get_node("Main/Player")
@onready var weapon = load("res://Weaponstuff/Weapons/basic_weapon.tscn")
var instance

func Enter():
	instance = weapon.instantiate()
	main.add_child.call_deferred(instance)


func Exit():
	main.remove_child(instance)


func Update(_delta: float):
	pass


func Physics_Update(_delta: float):
	pass
