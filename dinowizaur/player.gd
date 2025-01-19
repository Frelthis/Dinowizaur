extends CharacterBody2D


@export var SPEED = 300.0
var target_velocity = Vector2.ZERO


func _physics_process(delta):

	var direction = Vector2.ZERO

	var vel = Input.get_vector("move_left","move_right","move_up","move_down")
	direction.x += vel.x
	direction.y += vel.y
	target_velocity.x = direction.x * SPEED
	target_velocity.y = direction.y * SPEED
	velocity = target_velocity
	move_and_slide()
