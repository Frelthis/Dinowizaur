extends CharacterBody2D


const SPEED = 20.0
const JUMP_VELOCITY = -400.0


func _physics_process(delta):
	velocity.y += 1
	if velocity.y > 100:
		velocity.y = 100
	move_and_slide()


func _on_area_2d_body_entered(body):
	#change weapon signal
	queue_free()
	pass # Replace with function body.
