extends State
class_name FireBullet

@onready var main = get_tree().get_root().get_node("Main/Player")
@onready var bullet = load("res://Weaponstuff/Bullets/Fire/FireBullet.tscn")
var instance

func Enter():
	
	pass


func Exit():
	pass


func Update(_delta: float):
	pass


func Physics_Update(_delta: float):
	pass
