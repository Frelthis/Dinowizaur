extends State
class_name DoubleWeapon

@onready var main = get_tree().get_root().get_node("Main/Player")
@onready var weapon = load("res://Weaponstuff/Weapons/Double/double_weapon.tscn")
var instance

func Enter():
	instance = weapon.instantiate()
	main.add_child.call_deferred(instance)


func Exit():
	main.remove_child(instance)
	instance.queue_free()


func Update(_delta: float):
	pass


func Physics_Update(_delta: float):
	pass
