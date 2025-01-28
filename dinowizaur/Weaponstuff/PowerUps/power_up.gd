extends CharacterBody2D

const Max_Velocity = 200
var element: int = -1
var weapon: int = -1
var element_change
var weapon_change
var spawnPos: Vector2


func _ready():
	$Timer.start()
	global_position = spawnPos
	element_change = get_tree().get_root().get_node("Main").find_child("Bullet State Machine").current_state.name
	weapon_change = get_tree().get_root().get_node("Main").find_child("Weapon State Machine").current_state.name
	if randi() %2:
		weapon = randi() %2
	else:
		element = randi() %2
	if element == 0:
		element_change = "fire bullet"
		$PowerUpSprite.texture = load("res://Weaponstuff/Bullets/Fire/firehat.png")
	elif element == 1:
		element_change = "water bullet"
		$PowerUpSprite.texture = load("res://Weaponstuff/Bullets/Water/double.png")
	elif weapon == 0:
		weapon_change = "spread shot"
		$PowerUpSprite.texture = load("res://Weaponstuff/Weapons/spread.png")
	elif weapon == 1:
		weapon_change = "double shooter"
		$PowerUpSprite.texture = load("res://Weaponstuff/Weapons/doubleshot.png")


func _physics_process(delta):
	velocity.y += 1
	if velocity.y > Max_Velocity:
		velocity.y = Max_Velocity
	move_and_slide()


func _on_area_2d_body_entered(body):
	get_tree().get_root().get_node("Main/Player/PowerupSignals").emit_signal("Bullet_Pickedup",element_change)
	get_tree().get_root().get_node("Main/Player/PowerupSignals").emit_signal("Weapon_Pickedup",weapon_change)
	queue_free()
	pass


func _on_timer_timeout():
	$Timer.stop()
	queue_free()
