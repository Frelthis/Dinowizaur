extends State
class_name WaterBullet

@onready var main = get_tree().get_root().get_node("Main/Player")
@onready var bullet = load("res://Weaponstuff/Bullets/Water/WaterBullet.tscn")
var instance

func Enter():
	pass


func Exit():
	pass


func Update(_delta: float):
	pass


func Physics_Update(_delta: float):
	pass
