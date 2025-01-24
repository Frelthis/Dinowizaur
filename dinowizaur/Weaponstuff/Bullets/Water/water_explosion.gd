extends "res://Weaponstuff/Bullets/Basic/basic_bullet.gd"

func _physics_process(delta):
	velocity = Vector2(0, -Speed).rotated(direction)
	move_and_slide()
	
	var distance: float
	distance = Speed * delta
	
	_travelled_distance += distance
	if _travelled_distance > max_range:
		#hide()
		#set_process(false)
		#queue_free()
		pass


func _on_area_2d_body_entered(body):
	#damage
	queue_free()
