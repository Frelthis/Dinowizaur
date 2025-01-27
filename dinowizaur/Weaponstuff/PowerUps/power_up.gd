extends CharacterBody2D

const Max_Velocity = 200
var element: int = -1
var weapon: int = -1
var element_change
var weapon_change


func _ready():
	element_change = get_tree().get_root().get_node("Main/Player/Bullet State Machine").current_state.name
	weapon_change = get_tree().get_root().get_node("Main/Player/Weapon State Machine").current_state.name
	if randi() %2:
		weapon = randi() %2
	else:
		element = randi() %2
	if element == 0:
		element_change = "fire"
	elif element == 1:
		element_change = "water"
	if weapon == 0:
		weapon_change = "shotgun"
	elif weapon == 1:
		weapon_change = "double"


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
