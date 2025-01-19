extends CharacterBody2D


@export var SPEED = 300.0


func _physics_process(delta):

	var direction

	var vel = Input.get_vector("move_left","move_right","move_forward","move_back")
	direction.x += vel.x
	direction.z += vel.y

	move_and_slide()
