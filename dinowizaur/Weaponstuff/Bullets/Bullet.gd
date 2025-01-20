extends Area2D
class_name Bullet

var max_range := 1200.0
var speed := 750.0

var _travelled_distance = 0.0

func _physics_process(delta: float) -> void:
	var distance := speed * delta
	var motion := transform.x *speed * delta
	position += motion
	
	_travelled_distance += distance
	if _travelled_distance > max_range:
		hide()
		set_process(false)
