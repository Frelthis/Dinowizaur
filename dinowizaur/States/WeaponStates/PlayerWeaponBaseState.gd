extends State
class_name BaseWeapon

@onready var main = get_tree().get_root().get_node("Main/Player")
@onready var weapon = load("res://Weaponstuff/Weapons/shotgun.tscn")

func Enter():
	var instance = weapon.instantiate()
	main.add_child.call_deferred(instance)

func Exit():
	pass

func Update(_delta: float):
	pass

func Physics_Update(_delta: float):
	pass
